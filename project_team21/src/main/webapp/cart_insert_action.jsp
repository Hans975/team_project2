<%@page import="com.itwill.team2.domain.Size"%>
<%@page import="com.itwill.team2.domain.Color"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.domain.Cart"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
//  테스트완료
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
	return;
}
String cartQty=request.getParameter("cartQty");
String productNo=request.getParameter("productNo");
String colorNo=request.getParameter("colorNo");
String sizeNo=request.getParameter("sizeNo");
CartService cartService=new CartService();
int cartNo = cartService.insertByCart(Cart.builder()
		.cartQty(Integer.parseInt(cartQty))
		.user(User.builder().userNo(userNo).build())
		.product(Product.builder().productNo(Integer.parseInt(productNo)).build())
		.color(Color.builder().colorNo(Integer.parseInt(colorNo)).build())
		.size(Size.builder().sizeNo(Integer.parseInt(sizeNo)).build())
		.build()						
);
session.setAttribute("cartNo", cartNo);

response.sendRedirect("prodDetails.jsp?productNo="+Integer.parseInt(productNo));
%>
