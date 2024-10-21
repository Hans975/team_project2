<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품 등록 페이지</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #555;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .button-group {
            margin-bottom: 20px;
        }
        .button-group button {
            padding: 10px 20px;
            margin-right: 10px;
            border: 1px solid #ddd;
            background-color: #fff;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        .button-group button.selected {
            background-color: #333;
            color: #fff;
        }
        .image-upload {
            margin-bottom: 20px;
        }
        input[type="file"] {
            display: block;
            margin-top: 10px;
        }
        .image-preview {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .image-preview img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
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
        }
        .btn:hover {
            background-color: #555;
            transform: scale(1.05);
        }
        #fileNames {
            margin-top: 10px;
            font-weight: bold;
            color: #555;
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
    </style>
    <script>
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

        function previewImages() {
            const previewContainer = document.getElementById('imagePreview');
            const files = document.getElementById('productImages').files;
            const fileNamesContainer = document.getElementById('fileNames');


            let fileNames = [];

            // 기존 파일 이름 유지 후 새 파일 추가
            if (fileNamesContainer.textContent) {
                fileNames = fileNamesContainer.textContent.replace('업로드된 파일들: ', '').split(', ');
            }

            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();

                fileNames.push(file.name); // 파일 이름 추가

                reader.onload = function(e) {
                    const previewItem = document.createElement('div');
                    previewItem.classList.add('preview-item');
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.style.marginRight = '10px';  // 이미지 간격을 유지
                    img.style.width = '100px';       // 이미지 가로 크기 설정
                    img.style.height = '100px';      // 이미지 세로 크기 설정
                    img.style.objectFit = 'cover';   // 이미지 비율 맞춤
                    previewContainer.appendChild(img);
                    
                    var removeBtn = document.createElement('button');
                    removeBtn.innerHTML = 'x';
                    removeBtn.classList.add('remove-btn');
                    removeBtn.onclick = function () {
                        previewContainer.removeChild(previewItem);
                    };
                    previewItem.appendChild(img);
                    previewItem.appendChild(removeBtn);
                    previewContainer.appendChild(previewItem);
                }

                reader.readAsDataURL(file);
            }

            // 파일 이름 콤마로 구분하여 표시
            fileNamesContainer.textContent = '업로드된 파일들: ' + fileNames.join(', ');

        }
    </script>
</head>
<body>
    <div class="container">
        <h2>제품 등록</h2>
        <form action="/upload" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="productName">제품 이름</label>
        <input type="text" id="productName" name="productName" required>
    </div>
    <div class="form-group">
        <label for="productPrice">가격</label>
        <input type="text" id="productPrice" name="productPrice" required min="0">
    </div>
    
    <!-- 카테고리 선택 -->
    <div class="form-group button-group">
        <label>카테고리</label>
        <button type="button" data-field="category" data-value="1" onclick="toggleSelection(this)">남성</button>
        <button type="button" data-field="category" data-value="2" onclick="toggleSelection(this)">여성</button>
        <input type="hidden" id="category" name="category">
    </div>

    <!-- 하위 카테고리 선택 -->
    <div class="form-group button-group">
        <label>하위 카테고리</label>
        <button type="button" data-field="subCategory" data-value="1" onclick="toggleSelection(this)">아우터</button>
        <button type="button" data-field="subCategory" data-value="2" onclick="toggleSelection(this)">상의</button>
        <button type="button" data-field="subCategory" data-value="3" onclick="toggleSelection(this)">하의</button>
        <input type="hidden" id="subCategory" name="subCategory">
    </div>

    <!-- 색상 선택 -->
    <div class="form-group button-group">
        <label>색상</label>
        <button type="button" data-field="color" data-value="1"  onclick="toggleSelection(this)">BLACK</button>
        <button type="button" data-field="color" data-value="2"  onclick="toggleSelection(this)">WHITE</button>
        <button type="button" data-field="color" data-value="3"  onclick="toggleSelection(this)">RED</button>
        <button type="button" data-field="color" data-value="4"  onclick="toggleSelection(this)">BLUE</button>
        <button type="button" data-field="color" data-value="5"  onclick="toggleSelection(this)">GREEN</button>
        <input type="hidden" id="color" name="color">
    </div>

    <!-- 사이즈 선택 -->
    <div class="form-group button-group">
        <label>사이즈</label>
        <button type="button" data-field="size" data-value="1" onclick="toggleSelection(this)">S</button>
        <button type="button" data-field="size" data-value="2" onclick="toggleSelection(this)">M</button>
        <button type="button" data-field="size" data-value="3" onclick="toggleSelection(this)">L</button>
        <button type="button" data-field="size" data-value="4" onclick="toggleSelection(this)">XL</button>
        <button type="button" data-field="size" data-value="5" onclick="toggleSelection(this)">FREE</button>
        <input type="hidden" id="size" name="size">
    </div>

    <div class="form-group">
        <label for="stockQty">수량</label>
        <input type="text" id="stockQty" name="stockQty" required min="0">
    </div>
    
    <div class="form-group image-upload">
        <label for="productImages">이미지 업로드</label>
        <input type="file" id="productImages" name="productImages" multiple onchange="previewImages()">
        <div id="imagePreview" class="image-preview"></div>
        <div id="fileNames"></div> <!-- 파일 이름을 표시할 공간 -->

    </div>
    
    <div class="btn-container">
        <button type="submit" class="btn">제품 등록하기</button>
    </div>
</form>

    </div>
</body>
</html>