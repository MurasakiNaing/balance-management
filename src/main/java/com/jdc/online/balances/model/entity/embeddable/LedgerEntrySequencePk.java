package com.jdc.online.balances.model.entity.embeddable;

import java.time.LocalDate;

import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class LedgerEntrySequencePk {

	private long memberId;
	private LocalDate issuedDate;

}
