<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<app:layout-anonymous title="Sign Up">

	<main class="loginForm">
		<h3>Sign Up</h3>
		<c:if test="${ message ne null }">
			<div class="alert alert-danger">
				<i class="bi bi-exclamation-triangle"></i> ${ message }
			</div>
		</c:if>
		<sf:form action="${root}/signup" modelAttribute="form" method="post" class=" mt-4">
			
			<app:form-group label="Name" cssClass="mb-3">
				<sf:input path="name" type="text" placeholder="Enter Member Name" class="form-control" />
				<sf:errors path="name" cssClass="text-danger" />
			</app:form-group>
			
			<app:form-group label="Login ID" cssClass="mb-3">
				<sf:input path="username" type="text" placeholder="Enter Login ID" class="form-control" />
				<sf:errors path="username" cssClass="text-danger" />
			</app:form-group>
			
			<app:form-group label="Password" cssClass="mb-3">
				<sf:input path="password" type="password" placeholder="Enter Password" class="form-control" />
				<sf:errors path="password" cssClass="text-danger" />
			</app:form-group>
			
			<div>
				<a href="${ root }/signin" class="btn btn-outline-primary">
					<i class="bi bi-unlock"></i> Sign In
				</a>
				
				<button class="btn btn-primary">
					<i class="bi bi-person-plus"></i> Sign Up
				</button>
			</div>
		</sf:form>
	</main>

</app:layout-anonymous>