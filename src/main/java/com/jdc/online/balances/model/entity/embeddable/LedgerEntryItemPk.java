package com.jdc.online.balances.model.entity.embeddable;

import java.time.LocalDate;

import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class LedgerEntryItemPk {

	private long memberId;
	private LocalDate issueDate;
	private int seqNumber;
	private int itemNumber;
	
}
