package com.jdc.online.balances.services;

import static com.jdc.online.balances.utils.EntityOperations.safeCall;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.jdc.online.balances.controller.member.dto.LedgerEntryForm;
import com.jdc.online.balances.controller.member.dto.LedgerEntryListItem;
import com.jdc.online.balances.controller.member.dto.LedgerEntrySearch;
import com.jdc.online.balances.model.PageResult;
import com.jdc.online.balances.model.entity.LedgerEntry;
import com.jdc.online.balances.model.entity.LedgerEntryItem;
import com.jdc.online.balances.model.entity.LedgerEntry_;
import com.jdc.online.balances.model.entity.Member;
import com.jdc.online.balances.model.entity.consts.BalanceType;
import com.jdc.online.balances.model.entity.embeddable.LedgerEntryItemPk;
import com.jdc.online.balances.model.entity.embeddable.LedgerEntryPk;
import com.jdc.online.balances.model.repo.LedgerEntryItemRepo;
import com.jdc.online.balances.model.repo.LedgerEntryRepo;
import com.jdc.online.balances.model.repo.LedgerRepo;
import com.jdc.online.balances.model.repo.MemberRepo;
import com.jdc.online.balances.utils.exceptions.AppBusinessException;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class LedgerEntryService {

	private final LedgerEntryRepo entryRepo;
	private final MemberRepo memberRepo;
	private final LedgerEntryItemRepo itemRepo;
	private final LedgerRepo ledgerRepo;
	private final LedgerEntryIdGenerator idGenerator;

	public LedgerEntryForm findForEdit(String id) {
		var username = SecurityContextHolder.getContext().getAuthentication().getName();

		var member = memberRepo.findOneByAccountUsername(username).get();

		var entryPk = LedgerEntryPk.parse(member.getId(), id);

		return safeCall(entryRepo.findById(entryPk).map(LedgerEntryForm::from), "ledger entry", "entry id", id);
	}

	@PreAuthorize("authentication.name eq #username")
	public PageResult<LedgerEntryListItem> search(String username, BalanceType type, LedgerEntrySearch search, int page,
			int size) {

		return entryRepo.search(queryFunc(username, type, search), countFunc(username, type, search), page, size);
	}

	private Function<CriteriaBuilder, CriteriaQuery<LedgerEntryListItem>> queryFunc(String username, BalanceType type,
			LedgerEntrySearch search) {

		return cb -> {
			var cq = cb.createQuery(LedgerEntryListItem.class);
			var root = cq.from(LedgerEntry.class);

			LedgerEntryListItem.select(cq, root);

			cq.where(search.where(cb, root, username, type));

			cq.orderBy(cb.desc(root.get(LedgerEntry_.issuedAt)));

			return cq;
		};
	}

	private Function<CriteriaBuilder, CriteriaQuery<Long>> countFunc(String username, BalanceType type,
			LedgerEntrySearch search) {
		return cb -> {
			var cq = cb.createQuery(Long.class);
			var root = cq.from(LedgerEntry.class);

			cq.select(cb.count(root.get(LedgerEntry_.id)));
			cq.where(search.where(cb, root, username, type));

			return cq;
		};
	}

	@Transactional
	public String save(LedgerEntryForm form) {

		var username = SecurityContextHolder.getContext().getAuthentication().getName();
		var member = memberRepo.findOneByAccountUsername(username).get();

		if (StringUtils.hasLength(form.getId())) {
			return update(member, form);
		}

		return insert(member, form);
	}

	private String insert(Member member, LedgerEntryForm form) {

		var entry = new LedgerEntry();
		entry.setId(idGenerator.next(member.getId(), LocalDate.now()));
		entry.setParticular(form.getParticular());
		entry.setLedger(ledgerRepo.findById(form.getLedgerId()).get());
		entry.setIssuedAt(LocalDateTime.now());

		var lastAmount = Optional.ofNullable(member.getActivity().getBalance()).orElse(BigDecimal.ZERO);
		var amount = form.getItems().stream().filter(a -> !a.isDeleted())
				.map(a -> a.getUnitPrice().multiply(BigDecimal.valueOf(a.getQuantity()))).reduce((a, b) -> a.add(b))
				.orElse(BigDecimal.ZERO);

		entry.setLastAmount(lastAmount);
		entry.setAmount(amount);

		// Insert Ledger Entry
		entry = entryRepo.save(entry);

		// Insert Ledger Entry
		for (var i = 0; i < form.getItems().size(); i++) {
			var item = form.getItems().get(i);

			if (!item.isDeleted()) {
				var entryItem = new LedgerEntryItem();
				var pk = new LedgerEntryItemPk();
				pk.setIssueDate(entry.getId().getIssueDate());
				pk.setMemberId(entry.getId().getMemberId());
				pk.setSeqNumber(entry.getId().getSeqNumber());
				pk.setItemNumber(i + 1);
				entryItem.setId(pk);

				entryItem.setEntry(entry);
				entryItem.setItem(item.getItemName());
				entryItem.setQuantity(item.getQuantity());
				entryItem.setUnitPrice(item.getUnitPrice());

				itemRepo.save(entryItem);
			}

		}

		// Update Member Last Balance
		var balance = switch (entry.getLedger().getType()) {
		case Expenses -> entry.getLastAmount().subtract(amount);
		case Incomes -> entry.getLastAmount().add(amount);
		};

		member.getActivity().setBalance(balance);

		return entry.getId().getCode();
	}

	private String update(Member member, LedgerEntryForm form) {
		// Check issue date
		var entryId = LedgerEntryPk.parse(member.getId(), form.getId());
		if (!entryId.getIssueDate().equals(LocalDate.now())) {
			throw new AppBusinessException("You can only update entries for today.");
		}

		// Get Ledger entry
		var entry = entryRepo.findById(entryId).get();

		// Delete All items
		for (var item : entry.getItems()) {
			itemRepo.deleteById(item.getId());
		}
		
		// Insert all items
		var newItems = form.getItems().stream().filter(a -> !a.isDeleted()).toList();
		
		for (var i = 0; i < newItems.size(); i++) {
			var item = newItems.get(i);

			var entryItem = new LedgerEntryItem();
			var pk = new LedgerEntryItemPk();
			pk.setIssueDate(entry.getId().getIssueDate());
			pk.setMemberId(entry.getId().getMemberId());
			pk.setSeqNumber(entry.getId().getSeqNumber());
			pk.setItemNumber(i + 1);
			entryItem.setId(pk);
			
			entryItem.setEntry(entry);
			entryItem.setItem(item.getItemName());
			entryItem.setQuantity(item.getQuantity());
			entryItem.setUnitPrice(item.getUnitPrice());
			
			itemRepo.save(entryItem);
		}

		// Update ledger entry info
		entry.setParticular(form.getParticular());
		entry.setLedger(ledgerRepo.findById(form.getLedgerId()).get());
		entry.setIssuedAt(LocalDateTime.now());

		var currentBalance = Optional.ofNullable(member.getActivity().getBalance()).orElse(BigDecimal.ZERO);
		var originalBalance = switch(entry.getLedger().getType()) {
		case Expenses -> currentBalance.add(entry.getAmount());
		case Incomes -> currentBalance.subtract(entry.getAmount());
		};
		
		var amount = form.getItems().stream().filter(a -> !a.isDeleted())
				.map(a -> a.getUnitPrice().multiply(BigDecimal.valueOf(a.getQuantity()))).reduce((a, b) -> a.add(b))
				.orElse(BigDecimal.ZERO);
		entry.setAmount(amount);
		
		// Update Member Balance
		currentBalance = switch (entry.getLedger().getType()) {
		case Expenses -> originalBalance.subtract(amount);
		case Incomes -> originalBalance.add(amount);
		};
		
		member.getActivity().setBalance(currentBalance);

		// Update remaining entry balance
		var entries = entryRepo.findRemainingEntries(member.getId(), entry.getId().getIssueDate(),
				entry.getId().getSeqNumber());
		
		for(var i = 0; i < entries.size(); i++) {
			var remain = entries.get(i);
			var entryBalance = BigDecimal.ZERO;
			if(i > 0) {
				var prevEntry = entries.get(i - 1);
				entryBalance = switch(prevEntry.getLedger().getType()) {
				case Expenses -> prevEntry.getLastAmount().subtract(prevEntry.getAmount());
				case Incomes -> prevEntry.getLastAmount().add(prevEntry.getAmount());
				};
			} else {
				entryBalance = switch(entry.getLedger().getType()) {
				case Expenses -> entry.getLastAmount().subtract(entry.getAmount());
				case Incomes -> entry.getLastAmount().add(entry.getAmount());
				};
			}
			var remainAmount = remain.getItems().stream()
					.map(a -> a.getUnitPrice().multiply(BigDecimal.valueOf(a.getQuantity()))).reduce((a, b) -> a.add(b))
					.orElse(BigDecimal.ZERO);
			remain.setAmount(remainAmount);
			remain.setLastAmount(entryBalance);
		}
		
		return entry.getId().getCode();
	}

}
