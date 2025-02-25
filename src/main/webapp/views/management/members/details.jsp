<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>

<app:layout-management title="Details">
	<app:page-title title="Member Details" />
	
	<div class="row">
		
		<div class="col-3">
			<!-- Profile Information -->
			<img class="image-fluid img-thumbnail profile-image" src="${ root }/resources/photos/default-profile.png" alt="" />

		</div>
		
		
		<div class="col">
			<div class="row">
				
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5><i class="bi bi-person"></i> Personal Info</h5>
							
							<div class="mb-3">
								<span class="text-secondary">Name</span>
								<div>Aung Aung</div>
							</div>
							
							<div class="mb-3">
								<span class="text-secondary">Date of Birth</span>
								<div>2000-10-1</div>
							</div>
							
							<div class="mb-3">
								<span class="text-secondary">Gender</span>
								<div>Female</div>
								<br />
							</div>
						
						</div>
					</div>
				</div>
			
			</div>
		
		</div>
		
		<div class="col">
			<div class="card">
				<div class="card-body">
					<h5><i class="bi bi-telephone"></i> Contact Info</h5>
					<div class="mb-3">
						<span class="text-secondary">Phone</span>
						<div>09-1111-22222</div>
					</div>
					
					<div class="mb-3">
						<span class="text-secondary">Email</span>
						<div>aungaung@gmail.com</div>
					</div>
					
					<div class="mb-3">
						<span class="text-secondary">Address</span>
						<div>No.12 / 1F Yadanar Myaing Street, Kamayut 1 Quarter, Kamayut, Yangon</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>	
	
</app:layout-management>