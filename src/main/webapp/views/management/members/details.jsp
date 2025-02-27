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
					<div class="card text-bg-info">
						<div class="card-body">
							<h5>
								<i class="bi bi-person-plus"></i> Registered At
							</h5>
							<h3 class="mt-4">2025-01-01 10:00</h3>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-bg-secondary">
						<div class="card-body">
							<h5>
								<i class="bi bi-calendar-check"></i> Last Accessed At At
							</h5>
							<h3 class="mt-4">2025-01-01 10:00</h3>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card text-bg-primary">
						<div class="card-body">
							<h5>
								<i class="bi bi-shield"></i> Status
							</h5>
							<h3 class="mt-4">Active</h3>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-3">

				<div class="col">
					<div class="card text-bg-light">
						<div class="card-body">
							<h5>
								<i class="bi bi-person"></i> Personal Info
							</h5>

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

				<div class="col">
					<div class="card text-bg-light">
						<div class="card-body">
							<h5>
								<i class="bi bi-telephone"></i> Contact Info
							</h5>
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
								<div>No.12 / 1F Yadanar Myaing Street, Kamayut 1 Quarter,
									Kamayut, Yangon</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>


	</div>

</app:layout-management>