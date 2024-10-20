<%@page import="com.itwill.team2.service.UserService"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>  
<%
  /* if (request.getMethod().equalsIgnoreCase("GET")) {
  	response.sendRedirect("index.jsp");
  	return;
  } */
  UserService userService = new UserService();
  %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	
	<link rel="stylesheet" href="./css/index.css?ver=3">
	<script src="./js/index.js"></script>
    
    
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
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 50px 20px;
            border: 1px solid #ddd;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .menu {
            width: 25%;
            border-right: 1px solid #ddd;
            margin-top: 37px;
            padding-right: 23px;
        }
        .menu-header {
            font-size: 25px;
            font-weight: bold;
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            color: #555;
        }
        .menu a {
            display: block;
            margin-bottom: 15px;
            padding: 15px;
            text-decoration: none;
            color: #333;
            border: 1px solid #ddd;
            text-align: center;
            font-weight: bold;
            background-color: #fff;
            transition: background-color 0.3s, color 0.3s;
        }
        .menu_user_modify{
            margin-top: 31px;
        }
        .menu a:hover {
            background-color: #333;
            color: #fff;
        }
        .main-content {
            width: 75%;
            padding-left: 40px;
            padding-top: 10px;
            background-color: #fdfdfd;
        }
        .user-modify {
            text-align: left;
        }
        .user-modify h2 {
            font-size: 28px;
            margin-bottom: 30px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            color: #555;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
            color: #555;
            margin-top: 20px;
        }
        .form-group input {
            width: 97%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        #address {
            pointer-events: none;
            background-color: #f0f0f0;
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
        .btn-address-search {
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .btn-address-search:hover {
            background-color: #555;
            transform: scale(1.05);
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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("address").value = data.address;
                    document.getElementById("address").setCustomValidity("");
                    document.getElementById("detailAddress").value = "";
                    document.getElementById("detailAddressGroup").style.display = "block";
                }
            }).open();
        }

        function checkPasswords() {
            var password = document.getElementById("password");
            var confirmPassword = document.getElementById("passwordConfirm");

            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("비밀번호가 일치하지 않습니다.");
            } else {
                confirmPassword.setCustomValidity("");
            }
        }

        function validateForm() {
            var phoneNumber = document.getElementById("phone");
            var userAddress = document.getElementById("address");

            if (!checkPhoneNumber(phoneNumber)) {
                phoneNumber.reportValidity();
                return false;
            }

            if (userAddress.value.trim() === "") {
                userAddress.setCustomValidity("주소를 입력하세요.");
                userAddress.reportValidity();
                return false;
            } else {
                userAddress.setCustomValidity("");
            }

            document.getElementById("signupContainer").style.display = "none";
            document.getElementById("completionMessage").style.display = "block";
            document.getElementById("startShoppingBtn").style.display = "block";

            return true;
        }

        function formatPhoneNumber(input) {
            let value = input.value.replace(/[^0-9]/g, '');
            if (value.length < 4) {
                input.value = value;
            } else if (value.length < 8) {
                input.value = value.slice(0, 3) + '-' + value.slice(3);
            } else {
                input.value = value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11);
            }
        }

        function checkPhoneNumber(input) {
            var phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
            if (!phoneRegex.test(input.value)) {
                input.setCustomValidity("전화번호 형식이 올바르지 않습니다. 010-0000-0000 형식으로 입력하세요.");
                return false;
            } else {
                input.setCustomValidity("");
                return true;
            }
        }
        
        function userModifyAction() {
    		document.f.action = "user_modify_action.jsp";
    		document.f.method='POST';
    		document.f.submit();
    	}
        
        function userRemove() {
            // 확인과 취소 버튼이 있는 확인 창
            var confirmation = confirm('정말 회원탈퇴를 하시겠습니까?');
            
            if (confirmation) {  // 사용자가 확인을 눌렀을 때만 실행
                var form = document.createElement('form');
                form.method = 'post';
                form.action = 'user_remove_action.jsp';
                
                var userNoInput = document.createElement('input');
                userNoInput.type = 'hidden';
                userNoInput.name = 'userNo';
                userNoInput.value = '<%=userNo%>';
                
                form.appendChild(userNoInput);
                document.body.appendChild(form);
                form.submit();
            } else {
                // 사용자가 취소를 눌렀을 때는 아무런 동작도 하지 않음
                alert('회원탈퇴가 취소되었습니다.');
            }
        }
        
    </script>
</head>
<body>
    <header>
        <!-- 로고 -->
        <jsp:include page="commonTop.jsp"/>
    </header>

    <div class="container">
        <div class="menu">
            <div class="menu-header"><a href="user_mypage.jsp">마이페이지</a></div>
            <a href="user_review_list.jsp" class="menu_user_review">나의 리뷰 관리</a>
            <a href="#" onclick="userRemove()" class="menu_user_remove">회원탈퇴</a>
            <a href="user_logout_action.jsp" class="menu_user_logout">로그아웃</a>
        </div>
        <div class="main-content">
            <div class="user-modify">
                <h2>회원 정보 수정</h2>
                <form action="user_modify_action.jsp" method="post" onsubmit="return validateForm();">
                    <div class="form-group">
                        <label for="username">이름</label>
                        <input type="text" id="username" name="username" required oninvalid="this.setCustomValidity('이름을 입력하세요.')" oninput="setCustomValidity('')" value="<%=user.getUserName()%>">
                    </div>
                    <div class="form-group">
                        <label for="password">비밀번호</label>
                        <input type="password" id="password" name="password" required oninvalid="this.setCustomValidity('비밀번호를 입력하세요.')" oninput="checkPasswords(); setCustomValidity('')" value="<%=user.getUserPassword()%>">                    </div>
                    <div class="form-group">
                        <label for="passwordConfirm">비밀번호 확인</label>
                        <input type="password" id="passwordConfirm" name="passwordConfirm" required oninput="checkPasswords()">
                    </div>
                    <div class="form-group">
                        <label for="email">이메일</label>
                        <input type="email" id="email" name="email" required value="<%=user.getUserEmail()%>">
                    </div>
                    <div class="form-group">
                        <label for="phone">전화번호</label>
                        <input type="text" id="phone" name="phone" required placeholder="010-0000-0000" maxlength="13" oninput="formatPhoneNumber(this); checkPhoneNumber(this)" value="<%=user.getUserPhone()%>">
                    </div>
                    <div class="form-group">
                        <label for="address">주소</label>
                        <input type="text" id="address" name="address" value="<%=user.getUserAddress() %>" placeholder="주소를 검색하세요" required readonly onclick="execDaumPostcode()">
                        <div class="form-group" id="detailAddressGroup" style="display: none;">
                            <label for="detailAddress">상세 주소</label>
							<input type="text" id="detailAddress" name="detailAddress" placeholder="상세 주소를 입력하세요" required oninvalid="this.setCustomValidity('상세 주소를 입력하세요.')" oninput="setCustomValidity('')">                        </div>
                        <button type="button" class="btn btn-address-search" onclick="execDaumPostcode()">주소 검색</button>
                    </div>
                    <div class="btn-container">
                        <button type="submit" class="btn">수정 완료</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>