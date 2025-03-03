<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="title" required="true" %>
<%@ attribute name="value" required="true" %>
<%@ attribute name="icon" required="true" %>
<%@ attribute name="color" %>

<div class="card ${ color }">
	<div class="card-body">
		<div class="text-end">
			<span class="">${ title }</span>
		</div>
		<h4 class="d-flex justify-content-between">
			<i class="bi bi-${ icon }"></i> ${ value }
		</h4>
	</div>
</div>