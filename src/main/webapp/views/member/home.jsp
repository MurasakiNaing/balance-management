<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="app" tagdir="/WEB-INF/tags" %>

<app:layout-member title="Home">
	<div class="d-flex justify-content-between align-items-start">
		<app:page-title title="Member Home" />
		
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
			<!-- Profile -->
			<div class="card">
				<div class="card-body">
					<div class="d-flex justify-content-between align-items-start">
						<h5 class="card-title">
							<i class="bi bi-person"></i> Profile
						</h5>
						<a href="#" class="btn-link">
							<i class="bi-pencil"></i>
						</a>
					</div>
				</div>
				
				<img src="${ root }/resources/photos/default-profile.png" class="profile-image" alt="Profile Image" />
				
				<div class="card-body">
					<div class="list-group list-group-flush">
						<div class="list-group-item">
							<i class="bi bi-person"></i> Aung Aung
						</div>
						
						<div class="list-group-item">
							<i class="bi bi-telephone"></i> 09-1111-22222
						</div>
						
						<div class="list-group-item">
							<i class="bi bi-envelope"></i> aungaung@gmail.com
						</div>
					</div>
				</div>
			</div>

			<!-- Access History -->
			
		</div>
		
		<div class="col">
		
			<div class="row">
				<!-- Summary -->
				<div class="col">
					<app:summary-info icon="cart" value="100,000" title="Expenses" color="text-bg-danger" />
				</div>
				
				<div class="col">
					<app:summary-info icon="coin" value="500,000" title="Incomes" color="text-bg-success" />
				</div>
				
				<div class="col">
					<app:summary-info icon="bar-chart" value="400,000" title="Balances" color="text-bg-primary" />
				</div>
			</div>
		
			<!-- Balance Bar Charts -->
			<div class="card mt-4">
				<div class="card-body">
					<h5 class="card-title">
						<i class="bi bi-bar-chart"></i> Balances 
					</h5>
					
					<div id="balanceChart"></div>
				</div>
			</div>
			
			<div class="row mt-4">
				<!-- Expenses Pie Chart -->
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<i class="bi bi-cart"></i> Expenses
							</h5>
							
							<div id="expensesChart" class="pieChartRoot"></div>
						</div>
					</div>
				</div>
				<!-- Incomes Pie Chart -->
				<div class="col">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">
								<i class="bi bi-coin"></i> Incomes
							</h5>
							
							<div id="incomesChart" class="pieChartRoot"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
	<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
	<script src="${ root }/resources/js/member-home.js"></script>
</app:layout-member>