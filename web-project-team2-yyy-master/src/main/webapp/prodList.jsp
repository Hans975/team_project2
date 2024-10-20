<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.itwill.team2.domain.Color"%>
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
String categoryName = request.getParameter("categoryName");
String subCategoryName = request.getParameter("subCategoryName");
Map<String, Category> categories = new HashMap<>();
categories.put("category", new Category(null, categoryName));
categories.put("sub_category", new Category(null, subCategoryName));
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
            <div class="prodListContainer">
                <div class="prodListHeader">
                    <div class="prodListTitle">
                        <h3>
                        <%if(categoryName == null && subCategoryName == null){ %>
                        신상품
                        <%}else{ %>
                        <%=categoryName %>
                        <%} %>
                        </h3>
                    </div>
                    <div class="prodListHeadbar">
                        <%if(categoryName == null && subCategoryName == null){ %>
                        <ul>
                            <li><a></a></li>
                            <li><a></a></li>
                            <li><a></a></li>
                        </ul>
                        <%}else{ %>
                        <ul>
                            <li><a href="prodList.jsp?categoryName=<%=categoryName %>&subCategoryName=아우터">아우터</a></li>
                            <li><a href="prodList.jsp?categoryName=<%=categoryName %>&subCategoryName=상의">상의</a></li>
                            <li><a href="prodList.jsp?categoryName=<%=categoryName %>&subCategoryName=하의">하의</a></li>
                        </ul>
                        <%} %>
                        <%List<Product> products = null;
                    	if(categoryName == null && subCategoryName == null){
                    		products = productService.productListOrderByNo();
                    	}else if(subCategoryName == null){
	                    	products = productService.productListByCategory(categoryName);
                    	}else {
	                    	products = productService.productListByCategory(categories);
                    	}%>
                        <div class="prodListItemsCount">
                        	<%if(categoryName == null && subCategoryName == null){ %>
                    			<span>10 items</span>
	                    	<%}else { %>
		                    	<span><%=products.size() %> items</span>
	                    	<%} %>
                            
                        </div>
                    </div>
                </div>	
                <div>
                    <ul class="bestProdList">
                    	<%int count = 0;
                    	for(Product product : products){ 
                    	if(categoryName == null && subCategoryName == null){
                    		count += 1;
                    	}
                    	%>
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
			                            	<%
			                            	Set<Color> colors = new HashSet(product.getColors());
			                            	for(Color color : colors){ %>
					                        <li style="background-color:<%=color.getColorCode()%>;"><span></span></li>
					                        <%} %>
			                            </ul>
			                        </div>
                                </div>
                            </div>
                        </li>
                        <%if(count == 10)break;} %>
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