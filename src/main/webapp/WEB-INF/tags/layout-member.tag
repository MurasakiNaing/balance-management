<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ attribute name="title" required="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BALANCE | ${ title.toUpperCase() } </title>
<c:set var="root" value="${pageContext.request.contextPath}" scope="request" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ root }/resources/css/common.css" />
</head>
<body>

	<nav class="navbar bg-light navbar-expand sticky-top shadow">
		<div class="container">
			<a href="${ root }/member/home" class="navbar-brand">
				<i class="bi bi-house"></i> Balance Management
			</a>
			
			<ul class="navbar-nav">
				
				<li class="nav-item">
					<a href="${ root }/member/balance" class="nav-link ${ title eq 'Balances' ? 'active' : '' }">
						<i class="bi bi-pie-chart"></i> Balances
					</a>
				</li>
			
				<li class="nav-item">
					<a href="${ root }/member/entry/incomes" class="nav-link ${ title eq 'Incomes' ? 'active' : '' }">
						<i class="bi bi-coin"></i> Incomes
					</a>
				</li>
				
				<li class="nav-item">
					<a href="${ root }/member/entry/expenses" class="nav-link ${ title eq 'Expenses' ? 'active' : '' }">
						<i class="bi bi-cart"></i> Expenses
					</a>
				</li>
				
				<li class="nav-item">
					<a href="${ root }/member/ledger" class="nav-link ${ title eq 'Ledgers' ? 'active' : '' }">
						<i class="bi bi-tags"></i> Ledgers
					</a>
				</li>
				
				<li class="nav-item">
					<a href="#" id="signOutMenu" class="nav-link">
						<i class="bi bi-lock"></i> Sign Out
					</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container my-4">	
		<jsp:doBody />
	</div>
	<app:sign-out />

</body>
</html>