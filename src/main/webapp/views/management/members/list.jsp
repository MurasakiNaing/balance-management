<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>

<app:layout-management title="Members">
	<app:page-title title="Member Management" />
	
	<!-- Search Form -->
	<form action="#" class="row" id="searchForm">
		
		<input type="hidden" name="page" id="pageInput" />
		<input type="hidden" name="size" id="sizeInput" />
		
		<app:form-group label="Status" cssClass="col-auto">
			<select name="status" class="form-select">
				<option value="">Search All</option>
				<option value="Active" ${ param.status eq 'Active' ? 'selected' : '' }>Active</option>
				<option value="Denied" ${ param.status eq 'Denied' ? 'selected' : '' }>Denied</option>
			</select>
		</app:form-group>
		
		<app:form-group label="Registered From" cssClass="col-auto">
		 	<input name="dateFrom" type="date" class="form-control" />
		</app:form-group>
		
		<app:form-group label="Registered To" cssClass="col-auto">
		 	<input name="dateTo" type="date" class="form-control" />
		</app:form-group>
		
		<app:form-group label="Name" cssClass="col-auto">
			<input name="name" type="text" class="form-control" placeholder="Search Name" />
		</app:form-group>
		
		<div class="col btn-wrapper">
			<button class="btn btn-primary">
				<i class="bi bi-search"></i> Search
			</button>
		</div>
	</form>
	
	<!-- Result Table -->
	<table class="table table-striped table-bordered table-hover my-3">
		
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Registered At</th>
				<th>Last Login</th>
				<th>Status</th>
				<th>Change At</th>
				<th>Remark</th>
				<th></th>
			</tr>
		</thead>
		
		<tbody>
		
			<c:forEach items="${ result.contents() }" var="item">
				<tr>
					<td>${ item.id() }</td>
					<td>${ item.name() }</td>
					<td>${ dtf.formatDateTime(item.registeredAt()) }</td>
					<td>${ dtf.formatDateTime(item.lastLoginAt()) }</td>
					<td>${ item.status() }</td>
					<td>${ dtf.formatDateTime(item.changedAt()) }</td>
					<td>${ item.remark() }</td>
					<td class="text-center">
						<a href="${ root }/admin/member/${ item.id() }" class="icon-link">
							<i class="bi bi-arrow-right"></i>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	<!-- Pagination -->
	<app:pagination pageResult="${ result }" />
	
</app:layout-management>