<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();
DecimalFormat decimalFormat = new DecimalFormat("###,###");
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

</head>
<body>
    <div class="wrap">
        <header>
            <!-- 로고 -->
            <jsp:include page="commonTop.jsp"/>
        </header>
        <main>
            <div class="mainContainer">
                <!-- 슬라이드 베너 -->
                <div class="mainSwiperContainer">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide"><a href="#"><img src="img/banner/298f79a8ff45b179d1c0d324d650a035.png" alt=""></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/banner/321a2762606e9027e7987bef941db9de.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/banner/431c9e648585c8f1c67d6d6e76ace57c.jpg" alt=""></a></li>
                        <li class="swiper-slide"><a href="#"><img src="img/banner/99ad953aee02769f4cd59f52758abdbb.png" alt=""></a></li>
                    </ul>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="SwiperListBox">
                    <div class="ListBoxTitle">
                        <h3>신상품</h3>
                    </div>
                    <div class="newSwiperListBox">
                        <ul class="newProdList swiper-wrapper">
                        	<%List<Product> products = productService.productListOrderByNo();
                    		for (int i = 1; i <= 10; i++) { 
                    		Product product = products.get(i);%>
                            <li class="swiper-slide">
                                <div class="prodBox">
                                    <div class="prod">
                                        <div class="prodImg">
											<a href="prodDetails.jsp?productNo=<%=product.getProductNo()%>"><img src="./image/<%=product.getCategory().getCategoryName()%>/<%=product.getSubCategory().getCategoryName()%>/<%=product.getProductName()%>/<%=product.getProductImages().get(0).getProductImageName()%>" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="discription">
                                        <div class="prodName">
                                            <a href="prodDetails.jsp?productNo=<%=product.getProductNo()%>"><span><%=product.getProductName() %></span></a>
                                            <img src="img/List/icon_202009041749300600.png" alt="찜버튼icon">
                                        </div>
                                        <div class="prodPrice">
                                            <span><%=decimalFormat.format(product.getProductPrice()) %></span>
                                        </div>
                                        <div class="ProdColor">
                                            <ul>	
                                                <%for(int j = 0; j < product.getColors().size(); j++){ %>
						                        <li style="background-color:<%=product.getColors().get(j).getColorCode()%>;"><span></span></li>
						                        <%} %>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                  			<%} %>
                        </ul>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
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