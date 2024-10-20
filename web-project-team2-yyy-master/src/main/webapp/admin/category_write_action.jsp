<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.itwill.team2.domain.Category"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("admin_manage_page.jsp");
	return;
}

String categoryName = request.getParameter("categoryName");
System.out.println("Received categoryName: " + categoryName);

ProductService productService = new ProductService();
Category category = Category.builder().categoryName(categoryName).build();
productService.categoryInsert(category);




%>