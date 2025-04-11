package com.jdc.online.balances.model.entity.embeddable;

import java.time.LocalDate;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class LedgerEntrySequencePk {

	private long memberId;
	private LocalDate issuedDate;

}
