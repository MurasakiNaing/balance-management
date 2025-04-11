<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<app:layout-member title="${ type }">
	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="${ form.id eq null ? 'Add New' : 'Edit' } Incomes" />
	</div>
	
	<sf:form id="editForm" action="${ root }/member/entry/${ urlType }/save" method="post" modelAttribute="form" class="row">
		
		<sf:hidden path="id"/>
	
		<!-- Summary -->
		<div class="col-4">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">
						<i class="bi bi-tags"></i> Ledger Entry
					</h5>
										
					<!-- Ledger -->
					<app:form-group label="Ledger" cssClass="mb-3">
						<sf:select path="ledgerId" class="form-select">
							<option value="">Select Ledger</option>
							<c:forEach var="item" items="${ ledgers }">
								<option value="${ item.id() }" ${ item.id() eq form.ledgerId ? 'selected' : '' } >${ item.name() }</option>
							</c:forEach>
						</sf:select>
						<sf:errors path="ledgerId" cssClass="text-sm text-danger" />
					</app:form-group>

					<!-- Particular -->
					<app:form-group label="Particular" cssClass="mb-3">
						<sf:textarea path="particular" rows="3" cols="40" class="form-control" placeholder="Please enter particular."></sf:textarea>
						<sf:errors path="particular" cssClass="text-sm text-danger" />
					</app:form-group>
					
					<!-- Total -->
					<app:form-group label="Total Amount" >
						<span id="allTotal" class="form-control">10,000</span>
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
					
					<div id="entryItemsContainer">
						<c:forEach var="item" varStatus="sts" items="${form.items}">
						
							<div class="row mt-2">
								<sf:hidden path="items[${ sts.index }].deleted"/>
								<div class="col">
									<div class="input-group">
										<button data-delete-input-id="items${ sts.index }.deleted" data-delete-url="${ root }/member/entry/${urlType}/item/remove" type="button" class="deleteBtn btn btn-outline-danger input-group-text">
											<i class="bi bi-eraser"></i>
										</button>									
										<sf:input type="text" path="items[${ sts.index }].itemName" class="form-control" placeholder="Enter Item Name" />
									</div>
								</div>
								<div class="col-2">
									<sf:input type="number" path="items[${ sts.index }].unitPrice" class="form-control changesInput" />
								</div>
								<div class="col-2">
									<sf:input type="number" path="items[${ sts.index }].quantity" class="form-control changesInput" />
								</div>
								<div class="col-2">
									<span id="row${ sts.index }Total" class="form-control text-end">0</span>
								</div>
							</div>
						</c:forEach>
					</div>
					
					<div class="mt-3">
						<button id="addItemBtn" data-add-url="${ root }/member/entry/${urlType}/item/add" type="button" class="btn btn-outline-primary">
							<i class="bi bi-plus"></i> Add Item
						</button>
						
						<button type="submit" class="btn btn-outline-danger">
							<i class="bi bi-save"></i> Save Item
						</button>
					</div>
					
				</div>
			</div>
		</div>
	</sf:form>	
	<script src="${ root }/resources/js/ledger-entry-edit.js" ></script>
</app:layout-member>