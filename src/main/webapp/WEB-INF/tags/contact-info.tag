<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="phone" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>

<div class="card text-bg-light h-100">
	<div class="card-body">
		<h5>
			<i class="bi bi-telephone"></i> Contact Info
		</h5>
		<div class="mb-3">
			<span class="text-secondary">Phone</span>
			<div>${ phone ne null and phone ne '' ? phone : 'Undefined' }</div>
		</div>

		<div class="mb-3">
			<span class="text-secondary">Email</span>
			<div>${ email ne null and email ne '' ? email : 'Undefined' }</div>
		</div>

		<div class="mb-3">
			<span class="text-secondary">Address</span>
			<div>${ address ne null and address ne '' ? address : 'Undefined' }</div>
		</div>
	</div>
</div>