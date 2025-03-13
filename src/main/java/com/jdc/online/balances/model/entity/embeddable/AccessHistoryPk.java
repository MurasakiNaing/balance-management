package com.jdc.online.balances.model.entity.embeddable;

import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class AccessHistoryPk {

	private String username;
	private String accessAt;
	
}
