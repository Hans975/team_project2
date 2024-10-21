<%@page import="com.itwill.team2.domain.Review"%>
<%@page import="com.itwill.team2.service.ReviewService"%>
<%@page import="com.itwill.team2.domain.Stock"%>
<%@page import="com.itwill.team2.domain.ProductImage"%>
<%@page import="com.itwill.team2.domain.Size"%>
<%@page import="com.itwill.team2.domain.Color"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String productNo = request.getParameter("productNo");
	ProductService productService = new ProductService();
	List<Product> products = productService.productListOrderByNo();
	if (productNo != null) {
	    try {
	        if (Integer.parseInt(productNo) > products.size()) {
	            // 상품 번호가 상품 리스트 크기보다 크면 index.jsp로 리디렉션
	            response.sendRedirect("index.jsp");
	            return;
	        }
	    } catch (NumberFormatException e) {
	        // 상품 번호가 정수가 아닐 경우에도 index.jsp로 리디렉션
	        response.sendRedirect("index.jsp");
	        return;
	    }
	} else {
	    // productNo 파라미터가 없을 경우에도 index.jsp로 리디렉션
	    response.sendRedirect("index.jsp");
	    return;
	}
	
	boolean loginCheck = false;
	if(session.getAttribute("userNo") != null){
		loginCheck = true;
	}
	int reviewScore = 0;
	int sizeStock = 0;
	ReviewService reviewService = new ReviewService();
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	Product product = productService.productDetail(Integer.parseInt(productNo));
	List<Color> colors = product.getColors();
	List<Size> sizes = product.getSizes();
	List<ProductImage> productImages = product.getProductImages();
	List<Stock> stocks = product.getStocks();
	List<Review> reviewList = reviewService.findReviewByProductNoOrderByScore(Integer.parseInt(productNo));
	int reviewImageCount = 0;
	for(Review review : reviewList){
		reviewImageCount += review.getReviewImages().size();
	}
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
	<script type="text/javascript">
		var selectedColorNo = null;
	    var selectedSizeNo = null;
	
	    // 색상 선택 시
	    function selectColor(colorNo, colorName) {
	        selectedColorNo = colorNo;
	        document.getElementById("selectedColorNo").value = colorNo; // hidden 필드에 저장
	        document.getElementById("selectedColorName").value = colorName; // hidden 필드에 저장
	    }
	
	    // 사이즈 선택 시
	    function selectSize(sizeNo, sizeName, sizeStock) {
	        selectedSizeNo = sizeNo;
	        document.getElementById("selectedSizeNo").value = sizeNo; // hidden 필드에 저장
	        document.getElementById("selectedSizeName").value = sizeName; // hidden 필드에 저장
	        document.getElementById("sizeStock").value = sizeStock; // hidden 필드에 저장
	    }
	 	// 장바구니 추가 시
		function submitForm(){
			if(<%= !loginCheck  %>){
				alert('로그인 하세요');
				location.href = 'user_login_form.jsp';
				return;
			}
			// 선택된 색상과 사이즈가 있는지 확인
	        if (!selectedColorNo || !selectedSizeNo) {
	            alert('색상과 사이즈를 선택하세요.');
	            return;
	        }
			
	        document.cart_and_order_form.action = 'cart_insert_action.jsp';
	        document.cart_and_order_form.method = 'POST';
	        document.cart_and_order_form.submit();
		}
	 	
		function buyNow() {
	        // 로그인 확인
	        if (<%= !loginCheck %>) {
	            alert('로그인 하세요');
	            location.href = 'user_login_form.jsp';
	            return;
	        }

	        // 색상 및 사이즈 선택 여부 확인
	        if (!selectedColorNo || !selectedSizeNo) {
	            alert('색상과 사이즈를 선택하세요.');
	            return;
	        }
	   		// 필요한 추가 데이터 수집
	        var selectedCartQty = document.getElementById('cartQty').value; // 예: 장바구니 수량
	        var selectedProductNo = document.getElementById('productNo').value; // 예: 상품 번호
	        // AJAX로 장바구니에 추가
	        var xhr = new XMLHttpRequest();
	        xhr.open('POST', 'cart_insert_action.jsp', true);
	        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

	        // 폼 데이터 생성 (예시로 colorNo와 sizeNo를 보냄)
			var data = 'cartQty=' + selectedCartQty +
			           '&productNo=' + selectedProductNo +
	        		   '&colorNo=' + selectedColorNo +
			           '&sizeNo=' + selectedSizeNo;

	        xhr.onreadystatechange = function () {
	            if (xhr.readyState === 4 && xhr.status === 200) {
	            	// 기존 폼 요소 선택
	            	var existingForm = document.querySelector("form[name='cart_and_order_form']");
	            	
	                // 장바구니에 성공적으로 추가되면 바로구매 페이지로 이동
	            	var orderForm = document.createElement("form");
	                orderForm.method = "POST";
	                orderForm.action = "order.jsp";
	                
	            	// 기존 폼의 모든 입력 요소를 복사하여 새로운 폼에 추가합니다.
	                Array.from(existingForm.elements).forEach(function(element) {
	                    var clonedElement = element.cloneNode(true); // 요소를 클론합니다.
	                    orderForm.appendChild(clonedElement);         // 새로운 폼에 추가합니다.
	                });
	            	
	                document.body.appendChild(orderForm);
	                orderForm.submit();
	            }
	        };

	        // 요청 전송
	        xhr.send(data);
	    }
		
		// 서버에서 전달된 상품 가격 (자바에서 값을 받아와 사용)
	    var productPrice = <%= product.getProductPrice() %>; // 상품 가격을 변수에 저장

	    // 수량 변경 함수
	    function changeQty(amount) {
	        var qtyInput = document.getElementById('cartQty'); // 수량 입력 필드
	        var qty = parseInt(qtyInput.value) + amount; // 현재 수량에 변경된 값을 더함
	        var sizeStock = parseInt(document.getElementById('sizeStock').value); // sizeStock의 값을 숫자로 변환
	        // 수량이 1 이하로 떨어지지 않도록 설정
	        if (qty < 1) {
	            qty = 1;
	        }
	        qtyInput.value = qty; // 새로운 수량을 입력 필드에 설정
			if (qty > sizeStock) {
				alert('수량보다 많은 상품은 선택 할 수 없습니다.');
				qtyInput.value = sizeStock;
			}
	        updatePrice(); // 수량이 변경되면 가격을 업데이트
	    }

	    // 가격 업데이트 함수
	    function updatePrice() {
	        var qty = parseInt(document.getElementById('cartQty').value); // 현재 수량을 가져옴
	        var totalPrice = qty * productPrice; // 수량에 따른 총 가격 계산

	        // 총 가격을 다시 포맷해서 표시
	        document.getElementById('totalPrice').innerText = new Intl.NumberFormat().format(totalPrice);
	        
	     	// 총 가격과 수량을 두 번째 상자에 표시
	        document.getElementById('totalPriceWithQty').innerText = new Intl.NumberFormat().format(totalPrice);
	     	// 총 가격과 수량을 세 번째 상자에 표시
	        document.getElementById('productPrice').value = totalPrice;
	        document.getElementById('totalQty').innerText = qty; // 개수 업데이트
	    }
	</script>
</head>
<body>
    <div class="wrap">
        <header>
            <!-- 로고 -->
            <jsp:include page="commonTop.jsp"/>
        </header>
        <main>
            <div class="prodDetailcontainer">
                <div class="prodDetailArea01"> 
                	<div class="prodDetailPopup">
                        <h4>장바구니에 상품을 담았습니다</h4>
                        <div>
                            <a href="#" class="cartgo">바로가기</a>
                            <a href="#" class="shopping">계속쇼핑하기</a>
                        </div>
                    </div> 
                    <div class="prodDetailImg">
                        <div class="prodDetailTitleimgSweper">
                            <ul class="prodDetailTitleimg swiper-wrapper">
                                <% for(int i = 0; i < (product.getProductImages().size()-1); i++){ %>
                                <li class="swiper-slide"><img src="./image/<%=product.getCategory().getCategoryName()%>/<%=product.getSubCategory().getCategoryName()%>/<%=product.getProductName()%>/<%=product.getProductImages().get(i).getProductImageName()%>" alt=""></li>
                                <% } %>
                            </ul>
                            <div class="swiper-button-next"></div>         
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
                        <div class="prodDetailDetailimgBox">
                            <ul class="prodDetailDetailimg">
                                <li><img src="./image/<%=product.getCategory().getCategoryName()%>/<%=product.getSubCategory().getCategoryName()%>/<%=product.getProductName()%>/<%=product.getProductImages().get(product.getProductImages().size()-1).getProductImageName()%>" alt=""></li>
                            </ul>
                        </div>
                        <div class="prodDetailDetailimg_more">
                            <a href="#none">상품설명 더보기</a>
                        </div>
                    </div>
                    
                    <div class="prodDetailAreaFix">
                        <div class="prodDetailAreaFixTxtBox">
                            <span><%= product.getProductName() %></span>
                            <br>
                            <span><%= decimalFormat.format(product.getProductPrice()) %></span>
                        </div>
                        <div class="prodDetailOption">
                                <span>Color</span>
                                <span class="prodDetailOptionSize">Size</span>
                                <div class="prodDetailOptionListBox">
	                                <ul class="prodDetailOptionList1">
	                                	<%
	                            		int productStock = 0;
	                            		String productColor = null;
	                            		for(Color color : colors){
	                                		//갈색   검은색
	                                        	for(Stock stock : stocks){
	                                        		// 검정 L 53   검정 XL 40   갈색 L 15   갈색 XL 225
	                                        		if(color.getColorName().equals(stock.getColor().getColorName())){
	                                        			productStock += stock.getStockQty();
	                                    				productColor = color.getColorName();
	                                        		} 
	                                        	} 
	                                	%>
		                                        		<li class="prodDetailOptionList1Li">
					                                        <a class="write_bt" role="button" tabindex="0" onclick="selectColor(<%= color.getColorNo()%>,'<%=color.getColorName() %>')" >
					                                        <span>(<%= productStock %>) <%= productColor %></span>
					                                        </a>
							                                <div class="prodDetailOptionList2Box">
							                                <ul class="prodDetailOptionList2">
							                                    <%
							                                		for(Size size : sizes){
								                                       	for(Stock stock : stocks){
								                                       		if(size.getSizeName().equals(stock.getSize().getSizeName())){
								                                       			if(color.getColorName().equals(stock.getColor().getColorName())){
								                                       		%>
								                                        		<li class="prodDetailOptionList2Li">
											                                        <a class="write_bt" role="button" tabindex="0" onclick="selectSize(<%= size.getSizeNo()%>, '<%=size.getSizeName()%>',<%= stock.getStockQty()%>)">
											                                        <span>(<%= stock.getStockQty() %>) <%= size.getSizeName() %></span>
											                                        </a>
											                                    </li>
							                                	<%} } } }%>
							                                </ul>
						                                	</div>
					                                    </li>
	                                	<%productStock = 0;} %>
	                                </ul>
                                </div>
                        </div>
                       	<form name="cart_and_order_form" method="post">
		                        <div class="prodDetailSelectOption">
		                            <ul>
		                                <li>
		                                    <div class="prodDetailSelectOptionTitle">
		                                        <span><%= product.getProductName() %></span>
		                                        <br>
		                                        <span class="SelectOptions"></span>
		                                    </div>
		                                    <div class="prodDetailSelectOptionitem">
											    <div>
											        <!-- 수량을 감소시키는 버튼 -->
											        <a href="#none" onclick="changeQty(-1)">-</a>
											        <!-- 수량을 입력하는 필드 -->
											        <span><input id="cartQty" name="cartQty" type="text" value="1" onchange="updatePrice()"></span>
											        <!-- 수량을 증가시키는 버튼 -->
											        <a href="#none" onclick="changeQty(1)">+</a>
											    	<input type="hidden" id="sizeStock" value="">
											    </div>
											</div>
											<div class="prodDetailSelectPrice">
											    <!-- 총 가격이 표시되는 부분 -->
											    <span id="totalPrice"><%= decimalFormat.format(product.getProductPrice()) %></span>
											</div>
		                                </li>
		                            </ul>
		                        </div>
		                        <div class="prodDetailSelectButtons">
		                            <div class="prodDetailSelectButtonsSave">
		                                <a href="javascript:add_cart(this.parentElement);"><img src="img/productDt/detail_wish.png" alt="찜버튼"></a>
		                            </div>
									    <!-- 숨겨진 필드 -->
									    <input type="hidden" name="orderCount" value="0">
									    <input type="hidden" id="selectedColorNo" name="colorNo" value="">
									    <input type="hidden" id="selectedColorName" name="colorName" value="">
									    <input type="hidden" id="selectedSizeNo" name="sizeNo" value="">
									    <input type="hidden" id="selectedSizeName" name="sizeName" value="">
									    <input type="hidden" id="productNo" name="productNo" value="<%= productNo %>">
									    <input type="hidden" id="productPrice" name="productPrice" value="<%= product.getProductPrice() %>">
									    
									
									    <!-- 장바구니 추가 버튼 -->
									    <div>
									        <a href="javascript:submitForm();">
									            <span>장바구니</span>
									        </a>
									    </div>
		                            <div class="buy_now">
		                                <a href="javascript:buyNow();">
		                                    <span>바로구매</span>
		                                </a>
		                            </div>
		                        </div>
						</form>
                        <div class="prodDetailSelectTotalPrice">
                            <span class="">총 상품금액</span>
                            <span><span id="totalPriceWithQty" class="prodDetailSelectTotalPriceNum"><%= decimalFormat.format(product.getProductPrice()) %></span>(<span id="totalQty">1</span>개)</span>
                        </div>
                    </div>
                </div>
                <div class="prodDetailArea03">
                    <div class="reviewHeader">
                        <span>REVIEW(<%=reviewList.size() %>)</span>
                    </div>
                    <div class="products_reviews">
                        <div class="products_reviewsinBox">
                            <div>
                                <span class="reviewStar">★</span>
                                <%	
                                	List<Review> reviews = reviewService.findReviewListByProductNoByDate(Integer.parseInt(productNo));
                               		double sum = 0;
                           			String avg = "";
                               		if(reviews.size() > 0){
	                                	for(Review review : reviews){
	                                		sum += review.getReviewScore();
	                                	}
			                            avg = String.format("%.1f", sum / reviews.size()); 
                                	}
                                	else{
			                            avg = String.format("%.1f", sum); 
                                	}
                                %>
                                <span>
                                <%=avg%>
                                </span>
                            </div>
                        </div>
                        <div class="products_reviews_tit">
                            <ul>
                            	<%for(int i = 5; i > 0; i--){%>
                            	
                                <li>
                                    <span class="products_reviews_Name"><% for(int j = 0; j < i; j++){%>★<%}%></span>
                                    <div class="products_reviews_score">
                                        <div class="products_reviews_score_color"></div>
                                    </div>
                                    <span><%=reviewService.findProductNoByReviewCount(Integer.parseInt(productNo), i)%></span>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                    <div>
                        <div>
                            <span>포토(<%=reviewImageCount %>)</span>
                        </div>
                        <div class="reviewsImgListBox">
                            <div class="reviewsImgListinBox">
                                <ul class="reviewsImgList swiper-wrapper">
                                	<%
                                	  for(int i = 0; i < reviews.size(); i++){
	                                	  Review review = reviews.get(i);
	                                	  if (review.getReviewImages() != null && !review.getReviewImages().isEmpty()) {
	                                	  	for (int j = 0; j < review.getReviewImages().size(); j++) {%>
                                    <li class="swiper-slide"><img src="./reviewImage/<%=review.getReviewImages().get(j).getReviewImageName() %>" alt=""></li>
                                    <%}   } } %>
                                </ul>
                            </div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                    </div>
                    <div class="reviewListHeader">
                        <div class="reviewFilterListBox">
                            <ul class="reviewFilterList">
                                <li><a>최신순</a></li>
                                <li><a>별점순</a></li>
                            </ul>
                        </div>
                        <div>
                            <div class="reviewFilterListSearchBox">
                                <a href="#none"><img src="img/header/top_search.png" alt="검색버튼"></a>
                                <input type="text" placeholder="리뷰 키워드 검색">
                            </div>
                        </div>
                    </div>
                    <div class="reviewListBox">
                        <div class="reviewListinBox">
                            <ul>
                            	<%for(Review review : reviews){ %>
                                <li>
                                    <div class="reviewListTitle">
                                        <div>
                                            <span class="reviewStar"><%for(int i = 0; i < review.getReviewScore(); i++){ %>★<%} %></span>
                                            <span><%=review.getReviewTitle() %></span>
                                        </div>
                                        <span><%=review.getReviewDate() %></span></div>
                                    <div class="userReviewBox">
                                        <p>
                                            <%=review.getReviewContent() %>
                                        </p>
                                        <ul class="userReviewImgList">
	    	                                <%for (int j = 0; j < review.getReviewImages().size(); j++) {%>
                                            <li><img src="./reviewImage/<%=review.getReviewImages().get(j).getReviewImageName() %>" alt="리뷰사진"></li>
                                            <%}%>
                                        </ul>
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer>
    
        </footer>
    </div>
</body>
</html>