<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<app:layout-anonymous title="Sign In">

	<main class="loginForm">
		<h3>Sign In</h3>
		
		<c:if test="${ message ne null }">
			<div class="alert alert-info">
				<i class="bi bi-info-circle"> ${ message }</i>
			</div>
		</c:if>
		
		<form action="${ root }/signin" method="post" class=" mt-4">
			<sec:csrfInput/>
			
			<app:form-group label="Login ID" cssClass="mb-3">
				<input type="text" name="username" placeholder="Enter Login ID" class="form-control" />
			</app:form-group>
			
			<app:form-group label="Password" cssClass="mb-3">
				<input type="password" name="password" placeholder="Enter Password" class="form-control" />
			</app:form-group>
			
			<div>
				<a href="${ root }/signup" class="btn btn-outline-primary">
					<i class="bi bi-person-plus"></i> Sign Up
				</a>
				
				<button class="btn btn-primary">
					<i class="bi bi-unlock"></i> Sign In
				</button>
			</div>
		</form>
	</main>

</app:layout-anonymous>