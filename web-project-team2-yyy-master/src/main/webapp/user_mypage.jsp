<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@page import="com.itwill.team2.service.UserService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.team2.domain.OrderItem"%>
<%@page import="com.itwill.team2.domain.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %> 
<%
OrderService orderService = new OrderService();
List<Order> orders = new ArrayList<>();
if (orderService.orderList(userNo) != null) {
	orders = orderService.orderList(userNo);
}
UserService userService = new UserService();

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
	
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <link rel="stylesheet" href="./css/index.css?ver=3">
    <script src="./js/index.js"></script>
	
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

.menu_user_modify {
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

.order-history {
	text-align: left;
}

.order-history h2 {
	font-size: 28px;
	margin-bottom: 30px;
	border-bottom: 2px solid #333;
	padding-bottom: 10px;
	color: #555;
}

.order-table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.order-table th, .order-table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
	font-size: 16px;
}

.order-table th {
	background-color: #f0f0f0;
	font-weight: bold;
	color: #555;
}

.order-table td {
	background-color: #fff;
}

.order-table th.order-date {
	width: 15%;
}

.order-detail-container {
	display: none;
	margin: 0;
	padding: 0;
}

.order-detail {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.order-detail th, .order-detail td {
	border: 1px solid #ddd;
	padding: 15px;
	text-align: center;
	font-size: 15px;
	color: #666;
}

.order-detail th {
	background-color: #f0f0f0;
	font-weight: bold;
}

.order-detail td {
	background-color: #fff;
}

.order-detail-link {
	cursor: pointer;
	color: #007bff;
	text-decoration: underline;
	font-weight: bold;
	transition: color 0.3s;
}

.order-detail-link:hover {
	color: #0056b3;
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

.product-img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-right: 10px;
	border: 1px solid #ddd;
}

.review-btn {
	display: inline-block;
	padding: 8px 15px;
	margin-top: 10px;
	background-color: #007bff;
	color: #fff;
	text-decoration: none;
	font-weight: bold;
	border-radius: 15px;
	transition: background-color 0.3s;
}

.review-btn:hover {
	background-color: #0056b3;
}
</style>
<script>
        function toggleOrderDetail(orderNo) {
            var detailElement = document.getElementById("orderDetailContainer_" + orderNo);
            if (detailElement.style.display === "none" || detailElement.style.display === "") {
                detailElement.style.display = "table-row";
            } else {
                detailElement.style.display = "none";
            }
        }
    </script>
<script>
    function postUserNo(actionUrl) {
        var form = document.createElement('form');
        form.method = 'post';
        form.action = actionUrl;
        var userNoInput = document.createElement('input');
        userNoInput.type = 'hidden';
        userNoInput.name = 'userNo';
        userNoInput.value = '<%=userNo%>';
        form.appendChild(userNoInput);
        document.body.appendChild(form);
        form.submit();
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
            <a href="#" onclick="postUserNo('user_modify_form.jsp')" class="menu_user_modify">회원정보 수정</a>
            <a href="#" onclick="postUserNo('user_review_list.jsp')" class="menu_user_review">나의 리뷰 관리</a>
            <a href="#" onclick="userRemove()" class="menu_user_remove">회원탈퇴</a>
            <a href="#" onclick="postUserNo('user_logout_action.jsp')" class="menu_user_logout">로그아웃</a>
        </div>
        <div class="main-content">
            <div class="order-history">
                <h2>최근 주문 내역</h2>
                <table class="order-table">
                    <thead>
                        <tr>
                            <th>주문일자</th>
                            <th>주문상세</th>
                            <th>주문금액</th>
                            <th>상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<%
                    	
                    	%>
                        <%
                          for(Order order : orders) { 
                          Order orderForPrice = Order.builder().orderItems(new ArrayList<OrderItem>()).build();
                    	  orderForPrice = orderService.orderDetails(order.getOrderNo());
                          int totalPrice = 0;
                    	  for(OrderItem orderItemForPrice : orderForPrice.getOrderItems()){
                    		  totalPrice += orderItemForPrice.getOrderItemQty()*orderItemForPrice.getProduct().getProductPrice();
                    	  }
                        %>
                            <tr>
                            	<%Date nowDate = order.getOrderDate();
                            	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
                            	String strNowDate = simpleDateFormat.format(nowDate); %>
                                <td><%= strNowDate %></td>
                                <td><%= order.getOrderName() %></td>
                                <td><%= totalPrice + "원" %></td>
                                <td>
                                    <span class="order-detail-link" onclick="toggleOrderDetail(<%= order.getOrderNo() %>)">
                                        상세보기
                                    </span>
                                </td>
                            </tr>
                            <tr id="orderDetailContainer_<%= order.getOrderNo() %>" class="order-detail-container">
                                <td colspan="4">
                                    <table class="order-detail">
                                        <thead>
                                            <tr>
                                                <th>제품 이미지</th>
                                                <th>제품 이름</th>
                                                <th>색상</th>
                                                <th>사이즈</th>
                                                <th>수량</th>
                                                <th>총가격</th>
                                                <th>리뷰 작성</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            Order orderDetail = Order.builder().orderItems(new ArrayList<OrderItem>()).build();
                                            if(orderService.orderDetails(order.getOrderNo()) != null){
                                                orderDetail = orderService.orderDetails(order.getOrderNo());
                                            }
                                            for(OrderItem orderItem : orderDetail.getOrderItems()) { %>
                                                <tr>
                                                    <td><img src="./image/<%=orderItem.getProduct().getCategory().getCategoryName() %>/<%=orderItem.getProduct().getSubCategory().getCategoryName() %>/<%=orderItem.getProduct().getProductName() %>/<%= orderItem.getProduct().getProductImages().get(0).getProductImageName() %>" alt="제품 이미지" class="product-img"></td>
                                                    <td><%= orderItem.getProduct().getProductName() %></td>
                                                    <td><%= orderItem.getColor().getColorName() %></td>
                                                    <td><%= orderItem.getSize().getSizeName() %></td>
                                                    <td><%= orderItem.getOrderItemQty() %></td>
                                                    <td><%= orderItem.getOrderItemQty() * orderItem.getProduct().getProductPrice() + "원" %></td>
                                                    <td><form action="review_write_form.jsp" method="post" style="display:inline;">
    <input type="hidden" name="productNo" value="<%= orderItem.getProduct().getProductNo() %>">
    <button type="submit" class="review-btn">리뷰 쓰기</button>
</form></td>
                                                </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                <div class="btn-container">
                    <a href="index.jsp" class="btn">쇼핑 계속하기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>