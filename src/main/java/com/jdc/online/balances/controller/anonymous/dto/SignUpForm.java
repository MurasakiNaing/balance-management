package com.jdc.online.balances.controller.anonymous.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class SignUpForm {

	@NotEmpty(message = "Please enter member name.")
	private String name;
	@NotEmpty(message = "Please enter email for login.")
	private String username;
	@NotEmpty(message = "Please enter password.")
	private String passworod;
	
}
