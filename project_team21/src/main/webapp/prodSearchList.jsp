<%@page import="com.itwill.team2.domain.Category"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String searchKeyword = request.getParameter("searchKeyword");
ProductService productService = new ProductService();
DecimalFormat decimalFormat = new DecimalFormat("###,###");
List<Product> searchLists = productService.productListSerchName(searchKeyword);
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
            <div class="prodListContainer">
                <div class="prodListHeader">
                    <div class="prodListTitle">
                        <h3>검색결과: </h3>
                    </div>
                    <div class="prodListHeadbar">
                        <ul style="align-items: center;">
                            <li >"<%=searchKeyword %>"로 검색한 상품결과입니다.</li>
                        </ul>
                        <div class="prodListItemsCount">
                            <span><%=searchLists.size() %> Items</span>
                    </div>
                </div>
                </div>	
                <div>
                    <ul class="bestProdList">
	                    	<% for(Product product : searchLists){ %>
                        <li>
                            <div class="prodBox">
                                <div class="prod">
                                    <div class="prodImg">
                                        <a href="prodDetails.jsp?productNo=<%=product.getProductNo()%>"><img src="./image/<%=product.getCategory().getCategoryName() %>/<%=product.getSubCategory().getCategoryName() %>/<%=product.getProductName() %>/<%=product.getProductImages().get(0).getProductImageName() %>/" alt=""></a>
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
                                            <%for(int i = 0; i < product.getColors().size(); i++){ %>
                                            <li style="background-color:<%=product.getColors().get(i).getColorCode()%>;"><span></span></li>
                                            <%} %>
                                        </ul>
                                    </div>
                                    <div class="ProdReview">
                                        <span>리뷰 <%=product.getReviews().size() %>건<!-- 몇건 숫자데이터--></span>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%} %>
                    </ul>
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