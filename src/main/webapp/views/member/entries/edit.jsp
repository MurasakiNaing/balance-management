<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<app:layout-member title="${ type }">
	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="Edit Incomes" />
	</div>
	
	<form action="${ root }/member/entry/save" method="post" class="row">
		<!-- Summary -->
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<i class="bi bi-tags"></i> Ledger Entry
					</h5>
										
					<!-- Ledger -->
					<app:form-group label="Ledger" cssClass="mb-3">
						<select class="form-select">
							<option value="">Select Ledger</option>
						</select>
					</app:form-group>

					<!-- Particular -->
					<app:form-group label="Particular" cssClass="mb-3">
						<textarea rows="3" cols="40" class="form-control" placeholder="Please enter particular."></textarea>
					</app:form-group>
					
					<!-- Total -->
					<app:form-group label="Total Amount" >
						<span class="form-control">10,000</span>
					</app:form-group>
				</div>
			</div>
			
		</div>
		<div class="col">
			<!-- Entry item -->
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<i class="bi bi-list"></i> Entry Items
					</h5>
					
					<div class="row">
						<div class="col">Item Name</div>
						<div class="col-2">Unit Price</div>
						<div class="col-2">Quantity</div>
						<div class="col-2 text-end">Total</div>
					</div>
					
					<div>
						<div class="row mt-2">
							<div class="col">
								<div class="input-group">
									<button type="button" class="btn btn-outline-danger input-group-text">
										<i class="bi bi-eraser"></i>
									</button>									
									<input type="text" class="form-control" placeholder="Enter Item Name" />
								</div>
							</div>
							<div class="col-2">
								<input type="number" class="form-control" />
							</div>
							<div class="col-2">
								<input type="number" class="form-control" />
							</div>
							<div class="col-2">
								<span class="form-control text-end">0</span>
							</div>
						</div>
					</div>
					
					<div class="mt-3">
						<button type="button" class="btn btn-outline-primary">
							<i class="bi bi-plus"></i> Add Item
						</button>
						
						<button type="submit" class="btn btn-outline-danger">
							<i class="bi bi-save"></i> Save Item
						</button>
					</div>
					
				</div>
			</div>
		</div>
	</form>	
	
</app:layout-member>