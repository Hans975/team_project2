<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@page import="com.itwill.team2.domain.Cart"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.team2.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<% 
	
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
		return;
	}
	String orderItemCount = request.getParameter("orderCount");
	String[] cartNo = new String[]{"0"};
	String productPrice = request.getParameter("productPrice");
	
	if(orderItemCount.equals("0")){
		cartNo[0] = session.getAttribute("cartNo").toString();
	}else{
		cartNo = request.getParameterValues("cartNo");
		System.out.println(cartNo);
	}
	OrderService orderService = new OrderService();
	ProductService productService = new ProductService();
	CartService cartService = new CartService();
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	Product product = null;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문/결제</title>

    <!-- 카카오 지도 SDK 추가 (Postcode 라이브러리) -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <link rel="stylesheet" href="./css/index.css?ver=3">
    <script src="./js/index.js"></script>
	<script type="text/javascript">
	function newInformation(){
		document.getElementById("name").value = "";
		document.getElementById("phone-num").value = "";
		document.getElementById("email").value = "";
		document.getElementById("address").value = "";
		document.getElementById("detailAddress").value = "";
	}
	
	function userInformation(){
		document.getElementById("name").value = "<%=user.getUserName()%>";
		document.getElementById("phone-num").value = "<%=user.getUserPhone()%>";
		document.getElementById("email").value = "<%=user.getUserEmail()%>";
		document.getElementById("address").value = "<%=user.getUserAddress()%>";
		document.getElementById("detailAddress").value = "<%=user.getUserDetailAddress()%>";
	}
	</script>
</head>
<body>
    <div class="wrap">
        <header class="order_header">
            <div class="headerContainer">
                <h1><a href=""><img src="img/header/top_logo_pc.png" alt=""></a></h1>
                <h2>주문/결제</h2>
                <div class="headerMenuR">
                    <div class="headerMenuUser">
                        <a href=""><img src="img/header/top_mypage.png" alt=""></a>
                    </div>
                    <div>
                        <a href=""><img src="img/header/basket-icon.png" alt=""></a>
                    </div>
                </div>
            </div>
        </header>
        <main>
            <div class="orderMain">
                <div>
                    <div class="orderSectionHeader">
                        <h3>배송지</h3>
                    </div>
                    <form class="order-form">
                        <div class="formGroupAddrRadioBox">
                            <div>
                                <input type="radio" id="addrUser" name="addr"  onchange="javascript:userInformation();" checked >
                                <label for="addrUser">주문자 정보와 동일</label>
                            </div>
                            <div>
                                <input type="radio" id="addrNew" name="addr" onchange="javascript:newInformation();">
                                <label for="addrNew">새로운 배송지</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name">주문자 *</label>
                            <input type="text" id="name" name="name" value="<%=user.getUserName()%>" placeholder="이름을 입력해주세요" >
                        </div>
        
                        <div class="form-group">
                            <label for="phone">휴대전화 *</label>
                            <div class="phone-group">
                                <input type="text" id="phone-num" name="phone-num" maxlength="11" value="<%=user.getUserPhone()%>" placeholder="연락처를 입력해주세요">
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <label for="email">이메일 *</label>
                            <div class="email-group">
                                <input type="text" id="email" name="email" value="<%=user.getUserEmail()%>" placeholder="이메일을 입력해주세요">
                            </div>
                        </div>
        
                        <div class="form-group">
                            <label for="address">주소 *</label>
                            <div class="address-group">
                                <input type="text" id="address" name="address" value="<%=user.getUserAddress() %>" placeholder="주소를 검색해주세요">
                                <button type="button" id="search-btn">주소 검색</button>
                            </div>
                            <div id="address-result" style="margin-top: 10px;"></div>
        
                            <label for="detailAddress">상세 주소</label>
                            <input type="text" id="detailAddress" name="detailAddress" value="<%=user.getUserDetailAddress() %>" placeholder="상세 주소를 입력해주세요">
                        </div>
                    </form>
                </div>
                <div>
                    <div class="orderSectionHeader">
                        <h3>주문상품</h3>
                        <div class="orderSectionHeaderRight">
                            <span class="orderSectionHeaderRightTxt"><%=cartNo.length %>건</span>
                        </div>
                    </div>
                   	<form id="orderCreate" method="post" action="order_create_action.jsp">
                    <div class="orderItemContainer">
						<%for(int i = 0; i < cartNo.length; i++){
						  String cartNo1 = cartNo[i];
						  if(cartNo1.equals("")){
							  continue;
						  }
						  Cart cart = cartService.findCart(Integer.parseInt(cartNo1));
						  product = productService.productDetail(cart.getProduct().getProductNo());%>
                        <ul>
                            <li>
                                <div class="orderItemImgBox">
                                    <img src="./image/<%=product.getCategory().getCategoryName()%>/<%=product.getSubCategory().getCategoryName()%>/<%=product.getProductName()%>/<%=product.getProductImages().get(0).getProductImageName()%>"" alt="">
                                </div>
                                <div>
                                    <Strong><%=product.getProductName() %></Strong>
                                    <ul>
                                        <li>[옵션:<%=cart.getColor().getColorName() %>/<%=cart.getSize().getSizeName() %>]</li>
                                        <li>수량:<%=cart.getCartQty() %>개</li>
                                        <li><%=decimalFormat.format(cart.getCartQty() * product.getProductPrice())%></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        <input type="hidden" name="cartNo" value="<%=cart.getCartNo() %>">
						<input type="hidden" name="cartQty" value="<%=cart.getCartQty()%>">
                        <%} %>
						<input type="hidden" name="orderPrice" value="<%=product.getProductPrice() %>">
                        <dl>
                            <dt>총 주문금액</dt>
                            <dd>
                                <%=decimalFormat.format(Integer.parseInt(productPrice))%>원
                            </dd>
                        </dl>
                    </div>
					</form>
                </div>
            </div>
        </main>
        <div class="SubmitButtonArea">
            <div>
            	<a onclick="document.getElementById('orderCreate').submit();">
                <button type="button" class="buttonPay">
                    <span><%=decimalFormat.format(Integer.parseInt(productPrice))%>원</span>
                    결제하기
                </button>
                </a>
            </div>
        </div>
    </div>
</body>
</html>