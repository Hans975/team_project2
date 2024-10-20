<%@page import="com.itwill.team2.domain.Cart"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     테스트완료 -->
<%@include file="login_check.jspf" %>    
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("cart_list.jsp");
	return;
}
String cartNo=request.getParameter("carNo");
String cartQty=request.getParameter("cartQty");
CartService cartService=new CartService();
int rowCount=cartService.updateByCart(Cart.builder()
									.cartNo(Integer.parseInt(cartNo))
									.cartQty(Integer.parseInt(cartQty))
									.build());
	







%>


