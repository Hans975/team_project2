<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성</title>
    <style>
        /* 기본적인 스타일링 */
        form {
            width: 50%;
            margin: 0 auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 10px;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .buttons {
            margin-top: 20px;
        }
        .buttons input[type="submit"] {
            margin-right: 10px;
        }
    </style>
    <script>
        // 리뷰 삭제 버튼 또는 리뷰 수정 버튼을 클릭했을 때만 reviewNo를 필수로 처리하는 함수
        function validateForm(buttonType) {
            var reviewNo = document.getElementById("reviewNo");
            var reviewTitle = document.getElementById("reviewTitle");
            var reviewContent = document.getElementById("reviewContent");
            var reviewScore = document.getElementById("reviewScore");

            // 리뷰 삭제 버튼을 클릭한 경우에만 reviewNo를 필수로 체크
            if (buttonType === "delete") {
                if (reviewNo.value.trim() === "") {
                    alert("리뷰 삭제를 위해 리뷰 번호를 입력해주세요.");
                    return false;  // 폼 제출을 막음
                }
                return true;
            }

            // 리뷰 수정 버튼을 클릭한 경우에도 reviewNo가 필수로 입력되었는지 체크
            if (buttonType === "modify") {
                if (reviewNo.value.trim() === "") {
                    alert("리뷰 수정 시 리뷰 번호를 입력해주세요.");
                    return false;  // 폼 제출을 막음
                }
            }

            // 리뷰 작성 또는 수정 시, 모든 필드를 필수로 체크
            if (reviewTitle.value.trim() === "" || reviewContent.value.trim() === "" || reviewScore.value.trim() === "") {
                alert("모든 필드를 입력해주세요.");
                return false;  // 폼 제출을 막음
            }

            return true;  // 폼을 정상 제출
        }

        // 폼 제출 전에 required 속성을 제거하여 HTML5 유효성 검사 방지
        function removeRequiredFields(buttonType) {
            var reviewTitle = document.getElementById("reviewTitle");
            var reviewContent = document.getElementById("reviewContent");
            var reviewScore = document.getElementById("reviewScore");

            // 리뷰 삭제 버튼을 클릭했을 때만 reviewTitle, reviewContent, reviewScore에서 required 속성을 제거
            if (buttonType === "delete") {
                reviewTitle.removeAttribute("required");
                reviewContent.removeAttribute("required");
                reviewScore.removeAttribute("required");
            } else {
                // 리뷰 작성 또는 수정 버튼을 클릭하면 다시 required 속성 부여
                reviewTitle.setAttribute("required", "required");
                reviewContent.setAttribute("required", "required");
                reviewScore.setAttribute("required", "required");
            }
        }
    </script>
</head>
<body>
    <h2>리뷰 작성 폼</h2>
    
    <form action="review_write_action.jsp" method="POST" onsubmit="return validateForm('write');">
        <!-- 리뷰 제목 -->
        <label for="reviewTitle">리뷰 제목:</label>
        <input type="text" id="reviewTitle" name="reviewTitle" required maxlength="100" placeholder="리뷰 제목을 입력하세요.">
        
        <!-- 리뷰 내용 -->
        <label for="reviewContent">리뷰 내용:</label>
        <textarea id="reviewContent" name="reviewContent" rows="10" required maxlength="2048" placeholder="리뷰 내용을 입력하세요."></textarea>
        
        <!-- 리뷰 점수 -->
        <label for="reviewScore">리뷰 점수 (1~5):</label>
        <input type="text" id="reviewScore" name="reviewScore" required maxlength="100" placeholder="1에서 5 사이의 점수를 입력하세요.">

        <!-- 리뷰 이미지명 -->
        <label for="reviewImageNames">리뷰 이미지명 (쉼표로 구분):</label>
        <input type="text" id="reviewImageNames" name="reviewImageNames" placeholder="예시: image1.jpg,image2.jpg" maxlength="255">
        
        <!-- 리뷰 수정 및 삭제를 위한 reviewNo 추가 -->
        <label for="reviewNo">리뷰 번호 (리뷰 수정/삭제 시에만 입력):</label>
        <input type="text" id="reviewNo" name="reviewNo" placeholder="리뷰 수정/삭제 시에만 입력">
        
        <!-- userId와 productNo는 직접 작성하도록 변경 -->
        <label for="userId">사용자 ID (테스트를 위해 직접 값 입력):</label>
        <input type="text" id="userId" name="userId" placeholder="테스트를 위해 직접 값 입력">
        
        <label for="productNo">상품 번호 (테스트를 위해 직접 값 입력):</label>
        <input type="text" id="productNo" name="productNo" placeholder="테스트를 위해 직접 값 입력">
        
        <!-- 버튼 추가: 리뷰 작성, 수정, 삭제 -->
        <div class="buttons">
            <!-- 리뷰 작성 버튼 -->
            <input type="submit" value="리뷰 작성" onclick="this.form.onsubmit = function(){return validateForm('write');}; removeRequiredFields('write');">
            <!-- 리뷰 수정 버튼 -->
            <input type="submit" value="리뷰 수정" formaction="review_modify_action.jsp" onclick="this.form.onsubmit = function(){return validateForm('modify');}; removeRequiredFields('modify');">
            <!-- 리뷰 삭제 버튼 -->
            <input type="submit" value="리뷰 삭제" formaction="review_remove_action.jsp" onclick="this.form.onsubmit = function(){return validateForm('delete');}; removeRequiredFields('delete');">
        </div>
    </form>
</body>
</html>
