<%@page import="com.itwill.team2.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
session.setAttribute("userNo", 2); 
session.setAttribute("user", new User(1, "김진영", "9689", "9689", "pre9689@naver.com", "010-3621-9689", "경기도 부천시 고강로 10-11 성진그린타운 2동 101호", null));
%>
<form action="user_remove_action.jsp" method="post">
	<input type="submit">
</form>
</body>
</html>