<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<app:layout-member title="Profile">

	<app:page-title title="Edit Profile" />

	<div class="row">
		<!-- Profile Image -->
		<div class="col-3">
			<img src="${ root }/resources/photos/${ form.profileImage }" class="img-fluid img-thumbnail profile-image" alt="Profile Image" />
			
			<form id="profilePhotoForm" class="mt-3" action="${ root }/member/profile/photo" method="post" enctype="multipart/form-data">
				<sec:csrfInput/>
				<input id="profilePhotoInput" type="file" name="file" class="d-none" />
				<button type="button" id="profilePhotoBtn" class="btn btn-primary w-100">
					<i class="bi bi-camera"></i> Change Profile Photo
				</button>
			</form>
		</div>
		
		<div class="col">		
			<sf:form action="" method="post" modelAttribute="form">
				<!-- Personal Info Inputs -->
				<!-- Name -->
				<div class="row">
					<app:form-group label="Name" cssClass="mb-3 col-8">
						<sf:input path="name" type="text" placeholder="Enter Name" class="form-control" />
						<sf:errors path="name" cssClass="text-danger" />
					</app:form-group>
				</div>
				
				<div class="row mb-3">
					<!-- Gender -->
					<app:form-group label="Gender" cssClass="col-4">
						<sf:select path="gender" class="form-select">
							<option value="">Select One</option>
							<option value="Male" ${form.gender eq 'Male' ? 'selected' : ''}>Male</option>
							<option value="Female" ${form.gender eq 'Female' ? 'selected' : ''}>Female</option>
						</sf:select>
						<sf:errors path="gender" cssClass="text-danger" />
					</app:form-group>
					<!-- Date of Birth -->
					<app:form-group label="Date of Birth" cssClass="col-4">
						<sf:input path="dob" type="date" class="form-control" />
						<sf:errors path="dob" cssClass="text-danger" />
					</app:form-group>
				</div>
				
				<!-- Contact Info Inputs -->
				<div class="row">
					<!-- Phone -->
					<app:form-group label="Phone" cssClass="col-4">
						<sf:input path="phone" type="text" class="form-control" placeholder="Enter Phone" />
						<sf:errors path="phone" cssClass="text-danger" />
					</app:form-group>
					<!-- Email -->
					<app:form-group label="Email" cssClass="col">
						<sf:input path="email" readonly="true" type="email" class="form-control" placeholder="Enter Email Address" />
						<sf:errors path="email" cssClass="text-danger" />
					</app:form-group>
				</div>
				
				<div class="row mb-3">
					<!-- Regions -->
					<app:form-group label="Region" cssClass="col">
						<select class="form-select" data-fetch-api="${ root }/member/location/district" id="region">
							<option value="">Select One</option>
							<c:forEach items="${ regions }" var="region">
								<option value="${ region.id }" ${ region.id eq form.region ? 'selected' : '' } >${ region.name }</option>
							</c:forEach>
						</select>
					</app:form-group>
					<!-- Districts -->
					<app:form-group label="District" cssClass="col">
						<select class="form-select" data-fetch-api="${ root }/member/location/township" id="district">
							<option value="">Select One</option>
							<c:forEach items="${ districts }" var="district">
								<option value="${ district.id }" ${ district.id eq form.district ? 'selected' : '' } >${ district.name }</option>
							</c:forEach>
						</select>
					</app:form-group>
					<!-- Township -->
					<app:form-group label="Township" cssClass="col">
						<sf:select path="township" class="form-select" id="township">
							<option value="">Select One</option>
							<c:forEach items="${ townships }" var="township">
								<option value="${ township.id }" ${ township.id eq form.township ? 'selected' : '' } >${ township.name }</option>
							</c:forEach>
						</sf:select>
						<sf:errors path="township" cssClass="text-danger" />
					</app:form-group>
					<!-- Address -->
					<div class="mb-3">
						<app:form-group label="Address">
							<sf:textarea path="address" rows="3" cols="60" class="form-control" placeholder="Enter Address"></sf:textarea>
							<sf:errors path="address" cssClass="text-danger" />
						</app:form-group>
					</div>
				</div>
				
				<button class="btn btn-danger">
					<i class="bi bi-save"></i> Save
				</button>
			</sf:form>
		</div>
	</div>


	<script src="${ root }/resources/js/member-location.js"></script>
	<script src="${ root }/resources/js/profile-edit.js"></script>
</app:layout-member>