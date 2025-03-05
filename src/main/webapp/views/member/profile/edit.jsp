<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<app:layout-member title="Profile">

	<app:page-title title="Edit Profile" />

	<div class="row">
		<!-- Profile Image -->
		<div class="col-3">
			<img src="${ root }/resources/photos/default-profile.png" class="img-fluid img-thumbnail profile-image" alt="Profile Image" />
			
			<form id="profilePhotoForm" class="mt-3" action="${ root }/member/profile/photo" method="post" enctype="multipart/form-data">
				<input id="profilePhotoInput" type="file" name="file" class="d-none" />
				<button type="button" id="profilePhotoBtn" class="btn btn-primary w-100">
					<i class="bi bi-camera"></i> Change Profile Photo
				</button>
			</form>
		</div>
		
		<div class="col">		
			<form action="" method="post">
				<!-- Personal Info Inputs -->
				<!-- Name -->
				<div class="row">
					<app:form-group label="Name" cssClass="mb-3 col-8">
						<input type="text" placeholder="Enter Name" class="form-control" />
					</app:form-group>
				</div>
				
				<div class="row mb-3">
					<!-- Gender -->
					<app:form-group label="Gender" cssClass="col-4">
						<select class="form-select">
							<option value="Male">Male</option>
							<option value="Female">Female</option>
						</select>
					</app:form-group>
					<!-- Date of Birth -->
					<app:form-group label="Date of Birth" cssClass="col-4">
						<input type="date" class="form-control" />
					</app:form-group>
				</div>
				
				<!-- Contact Info Inputs -->
				<div class="row">
					<!-- Phone -->
					<app:form-group label="Phone" cssClass="col-4">
						<input type="text" class="form-control" placeholder="Enter Phone" />
					</app:form-group>
					<!-- Email -->
					<app:form-group label="Email" cssClass="col">
						<input type="email" class="form-control" placeholder="Enter Email Address" />
					</app:form-group>
				</div>
				
				<div class="row mb-3">
					<!-- Regions -->
					<app:form-group label="Region" cssClass="col">
						<select class="form-select">
							<option value="Male">Select Region</option>
						</select>
					</app:form-group>
					<!-- Districts -->
					<app:form-group label="District" cssClass="col">
						<select class="form-select">
							<option value="Male">Select District</option>
						</select>
					</app:form-group>
					<!-- Township -->
					<app:form-group label="Township" cssClass="col">
						<select class="form-select">
							<option value="Male">Select Township</option>
						</select>
					</app:form-group>
					<!-- Address -->
					<div class="mb-3">
						<app:form-group label="Address">
							<textarea rows="3" cols="60" class="form-control" placeholder="Enter Address"></textarea>
						</app:form-group>
					</div>
				</div>
				
				<button class="btn btn-danger">
					<i class="bi bi-save"></i> Save
				</button>
			</form>
		</div>
	</div>


	<script src="${ root }/resources/js/profile-edit.js"></script>
</app:layout-member>