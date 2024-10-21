<%@page import="com.itwill.team2.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>     
<%
	if(request.getMethod().equals("GET")){
		response.sendRedirect("user_main.jsp");
		return;
	}
	try{
		request.setCharacterEncoding("UTF-8");
		String userName = request.getParameter("username");
		String userId = request.getParameter("userId");		
		String userPassword = request.getParameter("password");
		String userEmail = request.getParameter("email");
		String userPhone = request.getParameter("phone");
		String userAddress = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		System.out.println("Username: " + userName);
		System.out.println("Password: " + userPassword);
		System.out.println("Email: " + userEmail);
		System.out.println("Phone: " + userPhone);
		System.out.println("Address: " + userAddress);
		System.out.println("detailAddress:" + detailAddress);
		user = new User(userNo, userName, userId, userPassword, userEmail, userPhone, userAddress, detailAddress, null);
		UserService userService = new UserService();
		userService.update(user);
		response.sendRedirect("user_mypage.jsp");
	}catch(Exception e){
		e.printStackTrace();
		out.println("Error occurred: " + e.getMessage());
	}
	
%>






