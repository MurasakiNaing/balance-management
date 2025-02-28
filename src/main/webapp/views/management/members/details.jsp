<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags"%>

<app:layout-management title="Members">

	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="Member Details" />
		<button class="btn btn-danger">
			<i class="bi bi-x"></i> Deactivate
		</button>		
	</div>


	<div class="row">

		<div class="col-3">
			<!-- Profile Information -->
			<img class="image-fluid img-thumbnail profile-image"
				src="${ root }/resources/photos/default-profile.png" alt="" />
		</div>


		<div class="col">
			<div class="row">
				<div class="col">
					<app:information label="Registered At" icon="person-plus" bgColor="text-bg-info" value="2025-01-01 10:00" />
				</div>
				<div class="col">
					<app:information label="Last Accessed At At" icon="calendar-check" bgColor="text-bg-secondary" value="2025-01-01 10:00" />
				</div>
				<div class="col">
					<app:information label="Status" icon="shield" bgColor="text-bg-primary" value="Active" />
				</div>
			</div>

			<div class="row mt-3">

				<div class="col">
					<app:personal-info 
					name="Aung Aung" 
					gender="Male" 
					dob="2000-10-1" />
				</div>

				<div class="col">
					<app:contact-info 
					address="No.12 / 1F Yadanar Myaing Street, Kamayut 1 Quarter,Kamayut, Yangon" 
					phone="09-1111-22222" 
					email="aungaung@gmail.com" />
				</div>

			</div>

		</div>


	</div>

</app:layout-management>