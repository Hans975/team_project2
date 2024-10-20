<%@page import="com.itwill.team2.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>   
<%
/* if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("user_login_form.jsp");
	return;	
} */
try{
	UserService userService = new UserService();
	userService.remove(userNo);
	response.sendRedirect("user_logout_action.jsp");
}catch(Exception e){
	e.printStackTrace();
}	
%>