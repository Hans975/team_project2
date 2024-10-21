<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="com.itwill.team2.service.CartService" %>
<%@ page import="com.itwill.team2.domain.Cart" %>
<%@ page import="com.itwill.team2.domain.Product" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.team2.domain.Stock"%>
<%@page import="com.itwill.team2.domain.ProductImage"%>
<%@page import="com.itwill.team2.domain.Size"%>
<%@page import="com.itwill.team2.domain.Color"%>
<%@ page import="com.itwill.team2.service.ProductService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>

 	<%
    // CartService 및 유틸 초기화
    CartService cartService = new CartService();
 	ProductService productService = new ProductService();
    DecimalFormat decimalFormat = new DecimalFormat("###,###");

    // 세션에서 사용자 번호 가져오기
    
    if (userNo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
   
    // 장바구니 항목 리스트 가져오기
    List<Cart> cartList = cartService.selectByCartUserNoList((Integer)session.getAttribute("userNo")); // 한 번만 선언

    // 중복된 항목을 추적할 리스트
    List<Integer> processedCartNos = new ArrayList<>();

    // 중복 항목 처리
    for (int i = 0; i < cartList.size(); i++) {
        Cart cart1 = cartList.get(i);

        if (processedCartNos.contains(cart1.getCartNo())) {
            continue;
        }

        for (int j = i + 1; j < cartList.size(); j++) {
            Cart cart2 = cartList.get(j);

            if (cart1.getProduct().getProductNo() == cart2.getProduct().getProductNo() &&
                cart1.getColor().getColorNo() == cart2.getColor().getColorNo() &&
                cart1.getSize().getSizeNo() == cart2.getSize().getSizeNo()) {

                int newQty = cart1.getCartQty() + cart2.getCartQty();
                Cart updatedCart = Cart.builder()
                                       .cartNo(cart1.getCartNo())
                                       .cartQty(newQty)
                                       .build();

                cartService.updateByCart(updatedCart);
                cartService.deleteByCart(cart2.getCartNo());

                processedCartNos.add(cart2.getCartNo());
            }
        }
    }

    // 최신 장바구니 리스트 가져오기 (필요한 경우)
    cartList = cartService.selectByCartUserNoList(userNo);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <link rel="stylesheet" href="./css/index.css?ver=3">
    <script src="./js/index.js"></script>

<script>
        // 선택된 상품 삭제 함수
        function deleteSelectedItems() {
            const selectedItems = [];
            document.querySelectorAll("input[name='cart_item_checkbox']:checked").forEach(function (checkbox) {
                selectedItems.push(checkbox.value);
            });

            if (selectedItems.length === 0) {
                alert('삭제할 상품을 선택하세요.');
                return;
            }

            $.ajax({
                url: 'cart_delete_button_action.jsp', // 처리할 JSP 파일 경로
                type: 'POST',
                data: { cartNos: selectedItems.join(',') },
                success: function(response) {
                    alert('선택된 상품이 삭제되었습니다.');
                    location.reload(); // 삭제 후 페이지를 새로 고침
                },
                error: function(xhr, status, error) {
                    console.error('상품 삭제 실패:', error);
                    alert('상품 삭제 중 오류가 발생했습니다.');
                }
            });
        }

        // 선택된 항목들의 총 결제 금액을 계산하는 함수
        function calculateSelectedTotalPrice() {
            let totalPrice = 0;
             document.querySelectorAll("input[name='cart_item_checkbox']").forEach(function (checkbox) {
                const cartNo = checkbox.value;
                const price = parseInt(document.getElementById('productPrice-' + cartNo).value);
                const quantity = parseInt(document.getElementById('SelectQty-' + cartNo).value);
                
                if (checkbox.checked) {
                    // 체크된 경우
                    document.getElementById(cartNo).value = cartNo; // cartNo 값을 넣기
                    totalPrice += price * quantity;
                } else {
                    // 체크가 안 된 경우
                    document.getElementById(cartNo).value = ""; // cartNo 값을 비우기
                }
            });
            document.getElementById('total-price').innerText = totalPrice.toLocaleString() + '원';
            document.getElementById('productPrice1').value = totalPrice;
            document.getElementById('productPrice2').value = totalPrice;
        }

        function updateQty(change, cartNo) {
            const qtyInput = document.getElementById('SelectQty-' + cartNo);
            let currentQty = parseInt(qtyInput.value);
            if (isNaN(currentQty)) currentQty = 1;
            currentQty += change;
            if (currentQty < 1) currentQty = 1;
            qtyInput.value = currentQty;

            const productPrice = parseInt(document.getElementById('productPrice-' + cartNo).value);
            const newTotal = productPrice * currentQty;
            document.getElementById('price-' + cartNo).innerText = newTotal.toLocaleString() + '원';

            $.ajax({
                url: 'cart_update_quantity_button_action.jsp',
                type: 'POST',
                data: { carNo: cartNo, cartQty: currentQty },
                success: function(response) {
                    console.log('수량 업데이트 성공:', response);
                    calculateSelectedTotalPrice();
                },
                error: function(xhr, status, error) {
                    console.error('수량 업데이트 실패:', error);
                }
            });
        }
        
        function cart_item_all_select_deselect_checkbox_change() {
            const cartItemCheckboxList = document.getElementsByName("cart_item_checkbox");
            for (let i = 0; i < cartItemCheckboxList.length; i++) {
                cartItemCheckboxList[i].checked = document.getElementById('cart_item_all_select_deselect_checkbox').checked;
            }
            calculateSelectedTotalPrice();
        }

        window.onload = calculateSelectedTotalPrice;
    </script>












</head>
<body>
    <div class="wrap">
        <header>
            <!-- 로고 -->
            <jsp:include page="commonTop.jsp"/>
        </header>
        <main>
            <div class="cartMainContainer">
                <div class="cartTitleBox">
                    <h2>장바구니</h2>
                </div>
                <div class="cartListBox">
                    <div class="cartListTitle">
                        <ul>
                            <li><input type="checkbox" id="cart_item_all_select_deselect_checkbox" 
								onchange="cart_item_all_select_deselect_checkbox_change();" checked="checked">
								전체선택</li>
                            <li>상품정보</li>
                            <li>수량</li>
                            <li>합계</li>
                            <li>선택</li>
                        </ul>
                    </div>
                     <!-- 동적으로 장바구니 리스트 출력 -->
                     <!-- 선택된 항목들을 제출하기 위한 form -->
	       			<form id="orderForm" action="order.jsp" method="post">
                    <%
                    cartList = cartService.selectByCartUserNoList((Integer)session.getAttribute("userNo"));
                   
                    for (Cart cart : cartList) {
                    %>
                    <div class="cartListSelect">
					    <ul>
					        <li>
					            <!-- 개별 항목 선택/해제 체크박스 -->
					            <input type="checkbox" name="cart_item_checkbox" 
								onchange="calculateSelectedTotalPrice();" checked="checked"
								value="<%= cart.getCartNo() %>">
					        </li>
					        <li class="cartListSelectImgBox">
					            <div class="cartListSelectImg">
					                <img src="./image/<%=cart.getProduct().getCategory().getCategoryName()%>/<%=cart.getProduct().getSubCategory().getCategoryName()%>/<%=cart.getProduct().getProductName()%>/<%=cart.getProduct().getProductImages().get(0).getProductImageName()%>" alt="">
					            </div>
					            <div class="cartListSelectTextBox">
					                <h5><%= cart.getProduct().getProductName() %></h5>
					                <p><%= cart.getColor().getColorName() %>, <%= cart.getSize().getSizeName() %></p>
					            </div>
					        </li>
					        <li class="cartListSelectQty">
					            <a href="#none" class="down" onclick="updateQty(-1, '<%= cart.getCartNo() %>')">-</a>
					            <span><input id="SelectQty-<%= cart.getCartNo() %>" type="text" value="<%= cart.getCartQty() %>" readonly></span>
					            <a href="#none" class="up" onclick="updateQty(1, '<%= cart.getCartNo() %>')">+</a>
					            <input type="hidden" id="productPrice-<%= cart.getCartNo() %>" value="<%=cart.getProduct().getProductPrice() %>">
					        </li>
					        <li>
					            <span id="price-<%= cart.getCartNo() %>">
					                <%= decimalFormat.format(cart.getProduct().getProductPrice() * cart.getCartQty()) %>원
					            </span>
					        </li>
						        <li class="cartListButtons">
						            
						            <a href="#">관심상품</a>
						            <a href="javascript:void(0);" onclick="deleteSelectedItems()">선택상품 삭제</a>
						        </li>
					    </ul>
					</div>
       				<input type="hidden" id="<%=cart.getCartNo() %>" name="cartNo" value="">
					<% } %>
	       			<input type="hidden" id="productPrice1" name="productPrice" value="">
			        <input type="hidden" name="orderCount" value="1">
	       			</form>
                </div>
                <div class="cartListButtonTab">
                    <div>
                        <a href="javascript:void(0);" onclick="deleteSelectedItems()">선택상품 삭제</a>
                        <a href="cart_delete_all_action.jsp?userNo=<%= java.net.URLEncoder.encode(session.getAttribute("userNo").toString(), "UTF-8") %>">전체삭제</a>

                    </div>
                    <div class="cartListTotPriceBox">
                         <span>결제예정금액</span>
                        <br>
                        <span class="cartListTotPrice" id="total-price">0원</span>
                    </div>
                </div>
                <div class="cartListButtonTab2">
                     <a href="javascript:void(0);" onclick="submitSelectedItems()">선택상품주문</a>
                    <a href="index.jsp">쇼핑계속하기</a>
                    <a href="javascript:void(0);" onclick="submitAllItems()">전체상품주문</a>
                </div>
       			<!-- 전체 상품 주문에 필요한 form -->
				<form id="orderAllForm" action="order.jsp" method="post">
  					<% for (Cart cart : cartList) {%>
		        	<!-- 장바구니 항목들을 숨겨진 필드로 추가 -->
			        <input type="hidden" name="cartNo" value="<%=cart.getCartNo() %>">
			        <%} %>
			        <input type="hidden" id="productPrice2" name="productPrice" value="">
			        <input type="hidden" name="orderCount" value="1">
				</form>
				
				<script>
				    // 전체상품주문 버튼 클릭 시, 폼을 제출하여 order_form.jsp로 이동
				    function submitAllItems() {
				    	const selectedItems = [];
				        document.querySelectorAll("input[name='cart_item_checkbox']:checked").forEach(function (checkbox) {
				            selectedItems.push(checkbox.value);
				        });
				        
						if(selectedItems.length === 0){
							alert('주문할 상품을 선택하세요.');
			                return;
						}
				        document.getElementById('orderAllForm').submit();
				    }
				    function submitSelectedItems(){
				    	const selectedItems = [];
				        document.querySelectorAll("input[name='cart_item_checkbox']:checked").forEach(function (checkbox) {
				            selectedItems.push(checkbox.value);
				        });
				        
				        if (selectedItems.length === 0) {
				            alert('주문할 상품을 선택하세요.');
				            return;
				        }
				        
				        document.getElementById('orderForm').submit();
					}
				</script>
					                
            </div>
        </main>
        <footer>
            <div class="ftContainer">
                <div class="ftSection01">
                    <span>111-222</span>
                    <br>
                    <span>상담시간:안해줘</span>
                    <br>
                    
                    <span>email:babo1@naver.com(단체주문 문의)</span>
                </div>
                <div class="ftSection02">
                    <ul>
                        <li>브랜드소개</li>
                        <li>개인정보 처리방침</li>
                        <li>공지사항</li>
                    </ul>
                </div>
                <div class="ftSection03">
                    <ul>
                        <li><a href="">앱 다운로드</a></li>
                    </ul>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>