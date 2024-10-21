<%@page import="com.itwill.team2.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
    if(request.getMethod().equalsIgnoreCase("GET")){
    		response.sendRedirect("cart_list.jsp");
    		return;
    	}
 	String cartNo = request.getParameter("cartNo");
	CartService cartService = new CartService();
	cartService.deleteByCart(Integer.parseInt(cartNo));
	//response.sendRedirect("order_list.jsp");
    	
    %>