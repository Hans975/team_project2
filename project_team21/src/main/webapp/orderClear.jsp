<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문/결제</title>


    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<link rel="stylesheet" href="./css/index.css?ver=3">
    <script src="./js/index.js"></script>

</head>
<body>
    <div class="wrap">
        <header class="order_header">
            <div class="headerContainer">
                <h1><a href="index.jsp"><img src="img/header/top_logo_pc.png" alt=""></a></h1>
                <h2>주문/결제</h2>
                <div class="headerMenuR">
                    <div class="headerMenuUser">
	                    <a><img src="img/header/top_mypage.png" alt="" class="top_menber_bt_bk"></a>
	                    <div>
	                        <a href="user_logout_action.jsp?redirect=<%= request.getRequestURL() %>">LOGOUT</a>
	                        <a href="user_mypage.jsp">MYPAGE</a>
	                    </div>
                    </div>
                    <div>
                        <a href="cart_form.jsp"><img src="img/header/basket-icon.png" alt=""></a>
                    </div>
                </div>
            </div>
        </header>
        <main>
           <div class="orderClearContainer">
                <div class="orderClearBox">
                    <div class="orderClearTitle">
                        <div class="orderClearTitleImg">
                            <img src="img/header/orderClear.png" alt="">
                        </div>
                        <h2>주문이 완료되었습니다.</h2>
                    </div>
                    <div class="orderClearButtons">
                        <ul>
                            <li><a href="user_mypage.jsp">마이페이지</a></li>
                            <li><a href="index.jsp">메인홈</a></li>
                        </ul>
                    </div>
                </div>
           </div>
        </main>
    </div>
</body>
</html>