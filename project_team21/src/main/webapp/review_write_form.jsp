<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 작성</title>
<link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-color: #f9f9f9;
    color: #333;
}

.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 30px;
    border: 1px solid #ddd;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
    font-size: 28px;
    margin-bottom: 20px;
    color: #555;
    border-bottom: 2px solid #333;
    padding-bottom: 10px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: bold;
    display: block;
    margin-bottom: 10px;
}

input[type="text"], textarea {
    width: 97%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

input[type="text"]:invalid, textarea:invalid {
    box-shadow: none;
}

textarea {
    resize: vertical;
    height: 150px;
}

.rating {
    display: flex;
    gap: 5px;
    font-size: 24px;
    margin-top: 0px;
}

.star {
    cursor: pointer;
    color: #ccc;
    transition: color 0.3s;
}

.star.selected {
    color: #ffcc00;
}

.file-input {
    margin-top: 10px;
}

.preview {
    display: flex;
    gap: 10px;
    margin-top: 20px;
    flex-wrap: wrap;
}

.preview-item {
    position: relative;
    display: inline-block;
}

.preview img {
    width: 100px;
    height: 100px;
    object-fit: contain;
    border: 1px solid #ddd;
    background-color: #f0f0f0;
}

.remove-btn {
    position: absolute;
    top: 5px;
    right: 5px;
    background-color: rgba(255, 255, 255, 0.7);
    border: none;
    cursor: pointer;
    font-size: 16px;
    color: #f00;
    border-radius: 50%;
}

.btn-container {
    text-align: center;
    margin-top: 30px;
}

.btn {
    display: inline-block;
    padding: 15px 30px;
    background-color: #333;
    color: #fff;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s, transform 0.3s;
    border-radius: 25px;
    cursor: pointer;
}

.btn:hover {
    background-color: #555;
    transform: scale(1.05);
}

.file-name {
    font-size: 14px;
    margin-top: 10px;
    color: #666;
    margin-top: 20px;
    margin-left: 10px;
}

.image_upload_group {
    display: flex;
}
</style>
<script>
    var allFiles = [];
    var uploadedFileNames = [];

    function previewImages() {
        var previewContainer = document.getElementById('previewContainer');
        var files = document.getElementById('fileInput').files;
        const fileNamesContainer = document.getElementById('fileNames');

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (!uploadedFileNames.includes(file.name)) {
                uploadedFileNames.push(file.name);
                allFiles.push(file);
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
                        removeBtn.onclick = function () {
                            previewContainer.removeChild(previewItem);
                            // uploadedFileNames 배열에서 파일 이름 제거 (업로드된 파일의 이름을 배열에서 제거)
                            const index = uploadedFileNames.indexOf(file.name);
                            if (index > -1) {
                                uploadedFileNames.splice(index, 1);
                            }
                            // 파일 목록 업데이트 (업데이트된 파일 목록을 사용자에게 표시)
                            if (uploadedFileNames.length > 0) {
                                fileNamesContainer.innerHTML = '<b>업로드된 파일들:</b> ' + uploadedFileNames.join(', ');
                            } else {
                                fileNamesContainer.textContent = '';
                            }
                            // allFiles 배열에서 파일 제거 (파일 객체를 배열에서 제거)
                            const fileIndex = allFiles.indexOf(file);
                            if (fileIndex > -1) {
                                allFiles.splice(fileIndex, 1);
                            }
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
            fileNamesContainer.innerHTML = '<b>업로드된 파일들:</b> <b>' + uploadedFileNames.join(', ') + '</b>';
        } else {
            fileNamesContainer.textContent = '';
        }
    }

    function setRating(rating) {
        var stars = document.querySelectorAll('.star');
        var currentRating = document.getElementById('ratingValue').value;
        if (currentRating == rating) {
            rating = 0; // 동일한 별점을 다시 클릭하면 선택 해제
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
        
    	// 파일 입력을 모든 선택된 파일로 업데이트 (모든 선택된 파일을 파일 입력 요소에 설정)
        var fileInput = document.getElementById('fileInput');
        var dataTransfer = new DataTransfer();
        allFiles.forEach((file) => {
            dataTransfer.items.add(file);
        });
        fileInput.files = dataTransfer.files;
        
        return true; // 기본 폼 제출을 허용 (유효성 검사가 통과되면 폼 제출)
    }
</script>
</head>
<body>
    <div class="container">
        <h2>리뷰 작성</h2>
        <form action="/review_write" method="post"
            enctype="multipart/form-data" onsubmit="return validateForm()">
                <input type="hidden" name="productNo"
                    value="<%=request.getParameter("productNo")%>">
                <div class="form-group">
                    <label for="title">리뷰 제목</label> <input type="text" id="title"
                        name="reviewTitle" required placeholder="제목을 입력하세요"
                        oninvalid="this.setCustomValidity('제목을 입력하세요')">
                </div>
                <div class="form-group">
                    <label for="content">리뷰 내용</label>
                    <textarea id="content" name="reviewContent" required
                        placeholder="내용을 입력하세요"
                        oninvalid="this.setCustomValidity('내용을 입력하세요')"></textarea>
                </div>
                <div class="form-group">
                    <label style="display: flex; align-items: center;">별점<span
                        id="ratingError"
                        style="color: red; font-size: 12px; margin-left: 10px; display: none;">별점을
                            선택해 주세요.</span></label>
                    <ul class="rating" title="별점을 선택해 주세요" style="list-style: none; padding: 0; display: flex; align-items: center;">
                        <% for (int i = 1; i <= 5; i++) { %>
                            <span class="star" onclick="setRating(<%=i%>)">★</span>
                        <% } %>
                    </ul>
                    <input type="hidden" id="ratingValue" name="reviewScore" required>
                </div>
                <div class="form-group">
                    <div class="image_upload_group">
                        <input type="file" id="fileInput" name="photos" accept="image/*"
                            multiple class="file-input" style="display: none;"
                            onchange="previewImages()"> <label for="fileInput"
                            class="btn"
                            style="cursor: pointer; padding: 5px 15px; font-size: 14px; margin-top: 10px;">사진
                            업로드</label>
                        <div id="fileNameDisplay" class="file-name" value="선택된 이미지 없음"></div>
                    </div>
                    <div id="previewContainer" class="preview"></div>
                    <div id="fileNames"></div>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn">리뷰 등록</button>
                    <button type="button" class="btn" onclick="window.close()">작성
                        취소</button>
                </div>
            </form>
    </div>
</body>
</html>