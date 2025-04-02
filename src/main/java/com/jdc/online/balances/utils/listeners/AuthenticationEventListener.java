package com.jdc.online.balances.utils.listeners;

import java.time.LocalDateTime;

import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AbstractAuthenticationFailureEvent;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.AuthenticationFailureDisabledEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.security.authentication.event.LogoutSuccessEvent;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.online.balances.model.entity.consts.Role;
import com.jdc.online.balances.model.repo.MemberActivityRepo;
import com.jdc.online.balances.services.AccessHistoryService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AuthenticationEventListener {

	private final AccessHistoryService accessHistoryService;
	private final MemberActivityRepo activtyRepo;
	
	@EventListener
	@Transactional
	public void handle(AuthenticationSuccessEvent event) {
		// Update Access History
		accessHistoryService.loginSuccess(event.getAuthentication().getName());
		
		var authentication = event.getAuthentication();
		if(authentication.getAuthorities().stream().map(a -> a.getAuthority()).filter(a -> Role.Member.name().equals(a)).count() > 0) {
			// Update Last Access Info
			var username = authentication.getName();
			activtyRepo.updateLastAccess(LocalDateTime.now(), username);
		}
	}
	
	@EventListener
	public void handle(AbstractAuthenticationFailureEvent event) {
		var message = switch(event) {
		case AuthenticationFailureBadCredentialsEvent e -> "Missing Login ID or Password.";
		case AuthenticationFailureDisabledEvent e -> "Account is disabled.";
		default -> "Other Authentication failed.";
		};
		
		accessHistoryService.loginError(event.getAuthentication().getName(), message);
	}
	
	@EventListener
	public void handle(LogoutSuccessEvent event) {
		accessHistoryService.logoutSuccess(event.getAuthentication().getName());
	}
	
}
