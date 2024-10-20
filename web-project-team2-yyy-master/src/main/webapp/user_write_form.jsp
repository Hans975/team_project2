<%@page import="com.itwill.team2.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
	User fuser=(User)request.getAttribute("fuser");
	if(fuser==null){
		fuser=new User();
	}
	String msg=(String)request.getAttribute("msg");
	if(msg==null)msg="";
%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<script>
        // 비밀번호와 비밀번호 확인이 일치하는지 확인
        function checkPasswords() {
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("confirm_password");

            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("비밀번호가 일치하지 않습니다.");
            } else {
                confirmPassword.setCustomValidity(""); // 에러 메시지를 없앰
            }
        }

        // 폼 전체 유효성 검증
        function validateForm() {
            var phoneNumber = document.getElementById("userPhone");
            var userAddress = document.getElementById("userAddress");

            // 전화번호 유효성 검사
            if (!checkPhoneNumber(phoneNumber)) {
                phoneNumber.reportValidity(); // 전화번호 오류 메시지 표시
                return false; // 유효하지 않으면 제출을 막음
            }

            // 주소 유효성 검사: 주소가 비어 있으면 오류 표시
            if (userAddress.value.trim() === "") {
                userAddress.setCustomValidity("주소를 입력하세요.");
                userAddress.reportValidity(); // 주소 오류 메시지 표시
                return false; // 유효하지 않으면 제출을 막음
            } else {
                userAddress.setCustomValidity(""); // 에러 메시지를 없앰
            }

            // 회원가입 완료 메시지 및 쇼핑 시작 버튼 표시
            document.getElementById("signupContainer").style.display = "none";
            document.getElementById("completionMessage").style.display = "block";
            document.getElementById("startShoppingBtn").style.display = "block";

            return true; // 폼 제출 막음 (테스트용)
        }

        // 전화번호 형식 자동으로 "-" 추가
        function formatPhoneNumber(input) {
            let value = input.value.replace(/[^0-9]/g, ''); // 숫자만 남김
            if (value.length < 4) {
                input.value = value;
            } else if (value.length < 8) {
                input.value = value.slice(0, 3) + '-' + value.slice(3);
            } else {
                input.value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
            }
        }

        // 전화번호 형식 검증 및 툴팁 메시지 표시
        function checkPhoneNumber(input) {
            var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
            if (!phoneRegex.test(input.value)) {
                input.setCustomValidity("전화번호 형식이 올바르지 않습니다. 010-0000-0000 형식으로 입력하세요.");
                return false;
            } else {
                input.setCustomValidity(""); // 에러 메시지를 없앰
                return true;
            }
        }

        // 카카오 주소 API 호출
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 선택된 주소를 해당 필드에 입력
                    document.getElementById("userAddress").value = data.address;
                    document.getElementById("userAddress").setCustomValidity(""); // 주소 입력 후 오류 메시지 초기화
                    document.getElementById("detailAddress").value = ""; // 상세 주소 입력 필드 초기화
                    document.getElementById("detailAddressGroup").style.display = "block"; // 상세 주소 입력 필드 표시
                }
            }).open();
        }

        // 아이디 중복 확인 (서버와 통신하는 코드로 수정 필요)
        function checkDuplicateId() {
            var userId = document.getElementById("userId");

            // 여기서는 간단히 아이디가 "test"일 때 중복으로 간주
            if (userId.value === "admin") {
                alert("생성이 불가능한 아이디입니다. 다른 아이디를 입력하세요.");
                userId.value = "";
                userId.focus();
            }
        }

        // 쇼핑 계속하기 버튼 클릭 시 팝업 닫기
        function closePopupAndContinueShopping() {
            window.close();
        }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel=stylesheet href="css/join.css" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script> <!-- 카카오 API 사용 -->
    <style>
        /* 주소 필드에 입력을 못하게 하는 스타일 */
        #userAddress {
            pointer-events: none; /* 마우스로 클릭 불가능 */
            background-color: #f0f0f0; /* 읽기 전용처럼 보이도록 배경색 설정 */
        }
        #completionMessage {
            display: none;
            margin-top: 20px;
            text-align: center;
        }
        #startShoppingBtn {
            display: none;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div id="signupContainer">
        <h1 id="signupTitle">회원가입</h1>
        <form id="signupForm" action="user_write_action.jsp" method="POST" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="userName">사용자 이름</label>
                <input type="text" id="userName" name="userName" required>
            </div>
            <div class="form-group">
                <label for="userId">사용자 아이디</label>
                <input type="text" id="userId" name="userId" required onblur="checkDuplicateId()"><font color="red"><%=msg %></font>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="userPassword" required oninput="checkPasswords()">
            </div>
            <div class="form-group">
                <label for="confirm_password">비밀번호 확인</label>
                <input type="password" id="confirm_password" name="confirm_password" required oninput="checkPasswords()">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="userEmail" required>
            </div>
            <div class="form-group">
                <label for="userPhone">전화번호</label>
                <input type="text" id="userPhone" name="userPhone" required placeholder="010-0000-0000" maxlength="13" oninput="formatPhoneNumber(this); checkPhoneNumber(this)">
            </div>
            <div class="form-group">
                <label for="userAddress">주소</label>
                <input type="text" id="userAddress" name="userAddress" placeholder="주소를 검색하세요" required readonly onclick="execDaumPostcode()">
                <div class="form-group" id="detailAddressGroup" style="display: none;">
                    <label for="detailAddress">상세 주소</label>
                    <input type="text" id="detailAddress" name="detailAddress" placeholder="상세 주소를 입력하세요">
                </div>
                <button type="button" class="btn-address-search" onclick="execDaumPostcode()">주소 검색</button>
            </div>
            <button type="submit">가입하기</button>
        </form>
    </div>
</body>
</html>