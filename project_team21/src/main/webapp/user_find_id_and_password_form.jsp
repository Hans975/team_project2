<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-color: #fff; /* 전체 배경 흰색 */
    color: #333; /* 기본 텍스트 색상 */
}

.container {
    max-width: 600px;
    margin: 0 auto;
    padding: 50px 20px;
    background-color: #fff; /* 폼 컨테이너 배경 흰색 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
    border-radius: 8px;
}

h2 {
    text-align: center;
    color: #333; /* 기본 제목 색상 */
    font-size: 24px;
    margin-bottom: 20px;
}

.tab-container {
    text-align: center;
    margin-bottom: 30px;
}

.tab {
    display: inline-block;
    padding: 10px 20px;
    margin: 0 10px;
    cursor: pointer;
    background-color: #fff; /* 비활성화된 탭 내부 흰색 */
    border-radius: 25px;
    font-weight: bold;
    color: #000; /* 비활성화된 탭 텍스트 검정색 */
    transition: background-color 0.3s, color 0.3s;
}

.tab:hover {
    background-color: #e0e0e0; /* 탭 호버 시 내부 회색 */
}

/* 선택된 탭이 회색으로 변함 */
.selected-tab {
    background-color: #e0e0e0; /* 선택된 탭 회색 */
    color: #000; /* 선택된 탭 텍스트 검정색 */
}

form {
    display: none;
    margin-top: 20px;
    background-color: #fff; /* 폼 내부 배경 흰색 */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

form.active {
    display: block;
}

label {
    display: block;
    font-size: 14px;
    font-weight: bold;
    color: #333; /* 텍스트 기본 색상 */
    margin-bottom: 8px;
}

input[type="text"] {
    width: calc(100% - 20px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    margin-bottom: 20px;
    color: #333; /* 입력 텍스트 색상 */
    background-color: #fff; /* 입력 필드 흰색 */
}

button[type="submit"], button[type="button"] {
    display: inline-block;
    width: 100%;
    padding: 10px;
    background-color: #000; /* 버튼 배경 검정색 */
    color: white; /* 버튼 텍스트 흰색 */
    border: none;
    border-radius: 25px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button[type="submit"]:hover, button[type="button"]:hover {
    background-color: #555;
}

.result, .error {
    margin-top: 20px;
    font-size: 16px;
    text-align: center;
    padding: 5px;
    border-radius: 5px;
    background-color: #fff;
    color: #333; /* 결과 텍스트 색상 */
}

.error {
    color: red; /* 오류 텍스트는 빨간색 */
}

.close-btn {
    text-align: center;
    margin-top: 30px;
}

.close-btn button {
    background-color: #000; /* 닫기 버튼 검정색 */
    padding: 5px 15px;
    font-size: 12px;
    border-radius: 15px;
    width: 100px; /* 너비를 줄여서 버튼을 작게 만듦 */
}

.close-btn button:hover {
    background-color: #555;
}
</style>
</head>
<body>

<div class="container">
    <h2>아이디/비밀번호 찾기</h2>

    <!-- 탭 UI -->
    <div class="tab-container">
        <span id="findIdTab" class="tab active" onclick="showTab('id')">아이디 찾기</span>
        <span id="findPasswordTab" class="tab" onclick="showTab('password')">비밀번호 찾기</span>
    </div>

    <!-- 아이디 찾기 폼 -->
    <form id="findIdForm" class="active" action="user_find_id_and_password_action.jsp" method="post">
        <input type="hidden" name="findType" value="id">
        <label for="username">이름:</label>
        <input type="text" id="username" name="username" required>

        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" required>

        <button type="submit">아이디 찾기</button>

        <!-- 결과 또는 오류 메시지 출력 -->
        <div id="result-container">
            <%
                String foundUserId = (String) request.getAttribute("foundUserId");
                String msg = (String) request.getAttribute("msg");

                if (foundUserId != null) {
            %>
                <p class="result">찾은 아이디: <strong><%= foundUserId %></strong></p>
            <%
                } else if (msg != null) {
            %>
                <p class="error"><%= msg %></p>
            <%
                }
            %>
        </div>
    </form>

    <!-- 비밀번호 찾기 폼 -->
    <form id="findPasswordForm" action="user_find_id_and_password_action.jsp" method="post">
        <input type="hidden" name="findType" value="password">
        <label for="userId">아이디:</label>
        <input type="text" id="userId" name="userId" required>

        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" required>

        <button type="submit">비밀번호 찾기</button>

        <!-- 결과 또는 오류 메시지 출력 -->
        <div id="result-container">
            <%
                String foundPassword = (String) request.getAttribute("foundPassword");

                if (foundPassword != null) {
            %>
                <p class="result">찾은 비밀번호: <strong><%= foundPassword %></strong></p>
            <%
                } else if (msg != null) {
            %>
                <p class="error"><%= msg %></p>
            <%
                }
            %>
        </div>
    </form>

    <!-- 닫기 버튼 -->
    <div class="close-btn">
        <button type="button" onclick="window.close()">닫기</button>
    </div>
</div>

<script>
    function showTab(tab) {
        var findIdForm = document.getElementById("findIdForm");
        var findPasswordForm = document.getElementById("findPasswordForm");
        var findIdTab = document.getElementById("findIdTab");
        var findPasswordTab = document.getElementById("findPasswordTab");

        if (tab === 'id') {
            findIdForm.classList.add('active');
            findPasswordForm.classList.remove('active');

            findIdTab.classList.add('selected-tab');
            findPasswordTab.classList.remove('selected-tab');
        } else {
            findPasswordForm.classList.add('active');
            findIdForm.classList.remove('active');

            findPasswordTab.classList.add('selected-tab');
            findIdTab.classList.remove('selected-tab');
        }
    }
 // 페이지 로드 시 findType에 따라 선택된 탭을 유지
    window.onload = function() {
        var findType = '<%= request.getAttribute("findType") %>'; // findType 값을 가져옴
        if (findType === 'password') {
            showTab('password'); // 비밀번호 찾기 탭으로 설정
        } else {
            showTab('id'); // 기본은 아이디 찾기 탭
        }
    };
</script>


</body>
</html>