<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>

<app:layout-management title="Home">
	
	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="Admin Home" />
		
		<div>
			<div class="btn-group">
				<input type="radio" name="display" class="btn-check" checked="checked"  id="monthly" />
				<label for="monthly" class="btn btn-outline-primary">Monthly</label>
				
				<input type="radio" name="display" class="btn-check"  id="yearly" />
				<label for="yearly" class="btn btn-outline-primary">Yearly</label>
			</div>
		</div>
	</div>

	<div class="row">
		
		<div class="col-3">
			<!-- New Member for This Month -->
			<div class="card mb-4 text-bg-light">
				<div class="card-header">
					<h5 class="card-title">
						Last Month
					</h5>
				</div>
				<div class="card-body">
					<h4><i class="bi bi-people"></i> 15</h4>
				</div>
			</div>
			
			<!-- New Member for This Year -->
			<div class="card mb-4 text-bg-secondary">
				<div class="card-header">
					<h5 class="card-title">
						Last Year
					</h5>
				</div>
				<div class="card-body">
					<h4><i class="bi bi-people"></i> 150</h4>
				</div>
			</div>
			
			<!-- New Member for This Year -->
			<div class="card text-bg-dark">
				<div class="card-header">
					<h5 class="card-title">
						Total Members
					</h5>
				</div>
				<div class="card-body">
					<h4><i class="bi bi-people"></i> 1500</h4>
				</div>
			</div>
		</div>
		
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<i class="bi bi-people"></i> Member Registration
					</h5>
				</div>
			</div>
		</div>
		
	</div>
	
</app:layout-management>