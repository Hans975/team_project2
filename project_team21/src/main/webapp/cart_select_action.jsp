<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@page import="com.itwill.team2.domain.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>    
<%
//   테스트 완료
    if(request.getMethod().equalsIgnoreCase("GET")){
     		response.sendRedirect("cart_list.jsp");
    		return;
    	}

	CartService cartService = new CartService();
	
	List<Cart> cartList = cartService.selectByCartUserNoList(userNo);
 	response.sendRedirect("cart_list.jsp");
    	
	

    %>