<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="en">
<head>
<link rel=stylesheet href="css/login.css" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YYY-로그인</title>
</head>
<body>
    <header>
        <div class="top_logo">
       		<a href="index.jsp"><img src="img/header/top_logo_pc.png" alt=""></a>
       	</div>
        <h1>로그인</h1><hr>
    </header>
    <main>
        <form  action="user_login_action.jsp" method="POST" style="max-width: 700px; margin: 0px auto;" >
            <div class="login_body">
                <input type="text" class="loginId" id="loginId" name="userId" placeholder="아이디 입력" required>
                <input type="password" id="password" name="userPassword" placeholder="비밀번호 입력" required>
                
                <% if (request.getParameter("error") != null) { %>
                    <div class="error_message" style="color: red;">아이디 또는 비밀번호가 잘못되었습니다.</div>
                <% } %>
				
                <div class="login_btn">
                    <button type="submit" id="login_btn" name="login_btn"><span>로그인하기</span></button>
                </div>
                
                <ul class="check_list">
                    <li>
                        <a href="" onclick="openFindPopup()" id="btn_find_info" class="btn_find_info" target="_self" title="원클릭 아이디 찾기 화면전환"><span>아이디/비밀번호 찾기</span></a>
                    </li>
                </ul>
                
                <div class="login_join_box">
                    <span>회원이 아니신가요?</span>
                    <a href="" role="button" class="join_btn" onclick="openJoinUpPopup()" target="_self">회원가입하기</a>
                </div>
                
            </div>    
        </form>
    </main>
    <footer>

    </footer>
    
    <script>
        function openJoinUpPopup() {
            let popup = window.open('user_write_form.jsp', '회원가입', 'width=400,height=600,status=no, scrollbars=no,resizable=no'); // 팝업 창 열기
            
            if (!popup) {
                alert('팝업이 차단되었습니다. 팝업 차단을 해제해주세요.');
            }
        }
        function openFindPopup(){
        	let popup = window.open('user_find_id_and_password_form.jsp', '아이디/비밀번호 찾기', 'width=400,height=600,status=no, scrollbars=no,resizable=no'); // 팝업 창 열기
        	if (!popup) {
                alert('팝업이 차단되었습니다. 팝업 차단을 해제해주세요.');
            }
        }
    </script>
</body>
</html>

