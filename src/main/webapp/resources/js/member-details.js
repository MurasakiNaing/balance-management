document.addEventListener('DOMContentLoaded', () => {
	const statusChangeDialog = new bootstrap.Modal('#statusChangeDialog');
	const statusChnageBtn = document.getElementById('statusChangeButton');
	
	if(statusChangeDialog && statusChnageBtn) {
		statusChnageBtn.addEventListener('click', () => {
			statusChangeDialog.show();
		})
	}
})