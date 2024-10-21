<%@page import="com.itwill.team2.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("order_list.jsp");
		return;
	}
	String orderNo = request.getParameter("orderNo");
	OrderService orderService = new OrderService();
	orderService.deleteByOrderNo(Integer.parseInt(orderNo));
	response.sendRedirect("order_list.jsp");
%>