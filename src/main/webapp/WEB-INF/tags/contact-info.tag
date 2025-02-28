<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="phone" required="true" %>
<%@ attribute name="email" required="true" %>
<%@ attribute name="address" required="true" %>

<div class="card text-bg-light">
	<div class="card-body">
		<h5>
			<i class="bi bi-telephone"></i> Contact Info
		</h5>
		<div class="mb-3">
			<span class="text-secondary">Phone</span>
			<div>${ phone }</div>
		</div>

		<div class="mb-3">
			<span class="text-secondary">Email</span>
			<div>${ email }</div>
		</div>

		<div class="mb-3">
			<span class="text-secondary">Address</span>
			<div>${ address }</div>
		</div>
	</div>
</div>