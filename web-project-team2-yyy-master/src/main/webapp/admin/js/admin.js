/**
 * 
 */

function toggleSelection(button) {
	const field = document.getElementById(button.getAttribute('data-field'));
	const selectedValue = button.getAttribute('data-value');  // data-value 속성에서 값 가져옴 (문자열 대신 숫자여야 함)

	// 선택된 버튼의 스타일 변경 (선택된 버튼만 강조 표시)
	const buttons = button.parentNode.querySelectorAll('button');
	buttons.forEach(b => b.classList.remove('selected'));
	button.classList.add('selected');

	// 선택된 값을 hidden 필드에 저장
	field.value = selectedValue;
}

let uploadedFileNames = [];
function previewImages() {
	var previewContainer = document.getElementById('imagePreview');
	var files = document.getElementById('productImages').files;
	const fileNamesContainer = document.getElementById('fileNames');

	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		if (!uploadedFileNames.includes(file.name)) {
			uploadedFileNames.push(file.name);
			var reader = new FileReader();
			reader.onload = (function(file) {
				return function(e) {
					var previewItem = document.createElement('div');
					previewItem.classList.add('preview-item');
					var img = document.createElement('img');
					img.src = e.target.result;
					var removeBtn = document.createElement('button');
					removeBtn.innerHTML = 'x';
					removeBtn.classList.add('remove-btn');
					removeBtn.onclick = function() {
						previewContainer.removeChild(previewItem);
						// uploadedFileNames 배열에서 파일 이름 제거
						const index = uploadedFileNames.indexOf(file.name);
						if (index > -1) {
							uploadedFileNames.splice(index, 1);
						}
						// 파일 목록 업데이트
						if (uploadedFileNames.length > 0) {
							fileNamesContainer.textContent = '업로드된 파일들: ' + uploadedFileNames.join(', ');
						} else {
							fileNamesContainer.textContent = '';
						}
						// 파일 입력 초기화
						document.getElementById('fileInput').value = "";
					};
					previewItem.appendChild(img);
					previewItem.appendChild(removeBtn);
					previewContainer.appendChild(previewItem);
				};
			})(file);
			reader.readAsDataURL(file);
		}
	}

	if (uploadedFileNames.length > 0) {
		fileNamesContainer.textContent = '업로드된 파일들: ' + uploadedFileNames.join(', ');
	} else {
		fileNamesContainer.textContent = '';
	}
}

let uploadedDetailFileNames = [];
function previewDetailImages() {
	var previewContainer = document.getElementById('detailImagePreview');
	var files = document.getElementById('detailProductImages').files;
	const fileNamesContainer = document.getElementById('detailFileNames');

	for (var i = 0; i < files.length; i++) {
		var file = files[i];
		if (!uploadedDetailFileNames.includes(file.name)) {
			uploadedDetailFileNames.push(file.name);
			var reader = new FileReader();
			reader.onload = (function(file) {
				return function(e) {
					var previewItem = document.createElement('div');
					previewItem.classList.add('preview-item');
					var img = document.createElement('img');
					img.src = e.target.result;
					var removeBtn = document.createElement('button');
					removeBtn.innerHTML = 'x';
					removeBtn.classList.add('remove-btn');
					removeBtn.onclick = function() {
						previewContainer.removeChild(previewItem);
						// uploadedFileNames 배열에서 파일 이름 제거
						const index = uploadedDetailFileNames.indexOf(file.name);
						if (index > -1) {
							uploadedDetailFileNames.splice(index, 1);
						}
						// 파일 목록 업데이트
						if (uploadedDetailFileNames.length > 0) {
							fileNamesContainer.textContent = '업로드된 파일들: ' + uploadedDetailFileNames.join(', ');
						} else {
							fileNamesContainer.textContent = '';
						}
						// 파일 입력 초기화
						document.getElementById('fileInput').value = "";
					};
					previewItem.appendChild(img);
					previewItem.appendChild(removeBtn);
					previewContainer.appendChild(previewItem);
				};
			})(file);
			reader.readAsDataURL(file);
		}
	}

	if (uploadedDetailFileNames.length > 0) {
		fileNamesContainer.textContent = '업로드된 파일들: ' + uploadedDetailFileNames.join(', ');
	} else {
		fileNamesContainer.textContent = '';
	}
}

function setRating(rating) {
	var stars = document.querySelectorAll('.star');
	var currentRating = document.getElementById('ratingValue').value;
	if (currentRating == rating) {
		rating = 0; // Toggle off if the same star is clicked again
	}
	stars.forEach((star, index) => {
		if (index < rating) {
			star.classList.add('selected');
		} else {
			star.classList.remove('selected');
		}
	});
	document.getElementById('ratingValue').value = rating;
	document.getElementById('ratingValue').setCustomValidity('');
}

function validateForm() {
	const ratingValue = document.getElementById('ratingValue').value;
	if (ratingValue === "0" || ratingValue === "" || ratingValue === "NaN") {
		document.getElementById('ratingError').style.display = 'block';
		return false;
	} else {
		document.getElementById('ratingError').style.display = 'none';
	}
	return true;
}