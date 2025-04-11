<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>

<app:layout-management title="Members">

	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="Member Details" />
		<button id="statusChangeButton" class="btn btn-danger">
			<i class="bi ${ result.status() eq 'Active' ? 'bi-x' : 'bi-check' }"></i> ${ result.status() eq 'Active' ? 'Deactivate' : 'Activate' }
		</button>		
	</div>


	<div class="row">

		<div class="col-3">
			<!-- Profile Information -->
			<img class="image-fluid img-thumbnail profile-image"
				src="${ root }/resources/photos/${ result.profileImage() }" alt="Profile Image" />
		</div>


		<div class="col">
			<div class="row">
				<div class="col">
					<app:information label="Registered At" icon="person-plus" bgColor="text-bg-info" value="${ dtf.formatDateTime(result.registeredAt()) }" />
				</div>
				<div class="col">
					<app:information label="Last Accessed At At" icon="calendar-check" bgColor="text-bg-secondary" value="${ dtf.formatDateTime(result.lastAccessAt()) }" />
				</div>
				<div class="col">
					<app:information label="Status" icon="shield" bgColor="text-bg-primary" value="${ result.status() }" />
				</div>
			</div>

			<div class="row mt-4 d-flex align-items-stretch">
				<div class="col">
					<app:personal-info 
					name="${ result.name() }" 
					gender="${ result.gender() }" 
					dob="${ result.dateOfBirth() }" />
				</div>

				<div class="col">
					<app:contact-info 
					address="${ result.displayAddress }" 
					phone="${ result.phone() }" 
					email="${ result.email() }" />
				</div>

			</div>

		</div>
	</div>
	
	<div id="statusChangeDialog" class="modal">
		<div class="modal-dialog">
			<form action="${ root }/admin/member/${ result.id() }/update" method="post" class="modal-content">
				<sec:csrfInput/>
				<input type="hidden" name="status" class="hidden" value="${ result.status() ne 'Active' }" />
				<div class="modal-header">
					<div class="modal-title">${ result.status() eq 'Active' ? 'Deactivate' : 'Active' } Status</div>
				</div>
				<div class="modal-body">
					<app:form-group label="Reason">
						<textarea name="reason" class="form-control" required="required"></textarea>
					</app:form-group>
				</div>
				<div class="modal-footer">
					<button class="btn btn-outline-primary">
						<i class="bi bi-save"></i> Change Status
					</button>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="${ root }/resources/js/member-details.js"></script>
</app:layout-management>