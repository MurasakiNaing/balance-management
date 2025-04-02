package com.jdc.online.balances.model.entity.embeddable;

import java.time.Instant;

import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class AccessHistoryPk {

	private String username;
	private Instant accessAt;
	
}
