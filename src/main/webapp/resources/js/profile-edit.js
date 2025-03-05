document.addEventListener('DOMContentLoaded', () => {
	const profilePhotoForm = document.getElementById('profilePhotoForm');
	const profilePhotoInput = document.getElementById('profilePhotoInput');
	const profilePhotoBtn = document.getElementById('profilePhotoBtn');
	
	if(profilePhotoBtn && profilePhotoInput && profilePhotoForm) {
		profilePhotoBtn.addEventListener('click', () => profilePhotoInput.click());
		profilePhotoForm.addEventListener('change', () => profilePhotoForm.submit());
	}
})