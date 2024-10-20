<%@page import="com.itwill.team2.service.userException.ExistedUserException"%>
<%@page import="com.itwill.team2.service.UserService"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId");
	String userPassword = request.getParameter("userPassword");
	String userEmail = request.getParameter("userEmail"); 
	String userPhone = request.getParameter("userPhone"); 
	String userAddress = request.getParameter("userAddress"); 
	String detailAddress = request.getParameter("detailAddress"); 
	User newUser = null;
	try{
		newUser = new User(0, userName, userId, userPassword, userEmail, userPhone, userAddress, detailAddress, null);
		UserService userService = new UserService();
		userService.create(newUser);
		response.sendRedirect("user_write_success_form.jsp");
	}catch(ExistedUserException e){
    	request.setAttribute("msg", e.getMessage());
    	request.setAttribute("fuser", newUser);
    	RequestDispatcher rd=request.getRequestDispatcher("user_write_form.jsp");
    	rd.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_write_form.jsp");
	}
%>















