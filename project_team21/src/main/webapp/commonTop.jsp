<%@page import="com.itwill.team2.domain.Admin"%>
<%@page import="com.itwill.team2.domain.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();
List<Category> categories = productService.categoryList();
List<Category> subCategories = productService.subCategoryList();
%>
<%Integer userNo = (Integer)session.getAttribute("userNo"); %>
<header>
	<div class="hd_container">
	             <div class="top_logo">
	                 <a href="index.jsp"><img src="img/header/top_logo_pc.png" alt=""></a>
	             </div>
	             <div class="top_menu">
	                 <ul class="top_menu_dep1">
	                     <!-- <li> 하나당 카테고리분류1개 -->
	            <li><a href=""></a></li>
	            <li><a href="prodList.jsp">신상품</a></li>
	            <%for(Category category : categories) {%>
		            <li><a href="prodList.jsp?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a>
		            	<div class="top_menu_dep2_container">
		                    <div class="top_menu_dep2_innerContainer">
		                        <ul class="top_menu_dep2_01">
		                            <li><a href=""></a></li>
		                            <li><a href=""></a></li>
		                        </ul>
		                        <ul class="top_menu_dep2_02">
		                        <%for(Category subCategory : subCategories) {%>
		                            <li><a href="prodList.jsp?categoryName=<%=category.getCategoryName()%>&subCategoryName=<%=subCategory.getCategoryName()%>"><%=subCategory.getCategoryName()%></a></li>
		                        <%} %>
		                        </ul>
		                        <ul class="top_menu_dep2_03">
		                        <%for(Category subCategory : subCategories) {%>
		                            <li><img src="대표사진/<%=category.getCategoryName()%>/<%=subCategory.getCategoryName()%>.jpg" alt=""></li>
		                        <%} %>
		                        </ul>
		                    </div>
		                </div>
		            </li>
	            <%} %>
	        </ul>
	    </div>
	    <!-- (회원가입,로그인),검색,찜리스트,바구니 -->
	    <div class="top_menber">
	        <ul>
	        	</li>
	            <li style="margin-right: 10px;">
                    <form action="prodSearchList.jsp" method="get">
                        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" style="padding: 5px; border: 1px solid #ccc; border-radius: 4px;">
                        <button type="submit" style="border: none; background: transparent; cursor: pointer;" >
                            <img src="img/header/top_search.png" alt="검색" class="top_menber_bt_bk" style="vertical-align: middle;">
                        </button>
                    </form>
                </li>
	            <li class="top_menuUserIcon">
	            	<%if(userNo == null){ %>
                    <a href="user_login_form.jsp"><img src="img/header/top_mypage.png" alt="" class="top_menber_bt_bk"></a>
                    <%}else{ %>
                    <a><img src="img/header/top_mypage.png" alt="" class="top_menber_bt_bk"></a>
                    <%} %>
                    <%if(userNo != null){ %>
                    <div class="top_menuUserLogin">
                        <a href="user_logout_action.jsp?redirect=<%= request.getRequestURL() %>">LOGOUT</a>
                        <a href="user_mypage.jsp">MYPAGE</a>
                    </div>
                    <%} %>
                </li>
                <li>
                    <a href=""><img src="img/header/top_wish.png" alt="" class="top_menber_bt_bk"></a>
                </li>
                <li>
                    <a href="cart_form.jsp"><img src="img/header/top_cart_pc.png" alt="" class="top_menber_bt_bk"></a>
                </li>
	        </ul>
	    </div>
	</div>
</header>