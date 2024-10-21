<%@page import="com.itwill.team2.domain.Admin"%>
<%@page import="com.itwill.team2.service.AdminService"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@page import="com.itwill.team2.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_from.jsp");
		return;
	}
	//아이디 비밀번호 초기화
	String userId = null;
	String password = null;
	try {
		userId = request.getParameter("userId");
		password = request.getParameter("userPassword");
		AdminService adminService=  new AdminService();
		UserService userService = new UserService();
		Admin loginAdmin = null;
		try {
			loginAdmin = adminService.loginAdmin(userId, password);
			// 관리자 로그인 성공 시
			session.setAttribute("adminNo", loginAdmin.getAdminNo());
			session.setAttribute("admin", loginAdmin);
			response.sendRedirect("admin/admin_manage_page.jsp");
			return; // 중복 실행 방지
		} catch (Exception e) {
			// 관리자 로그인 실패 (무시하고 사용자 로그인 시도)
		}
		User loginUser = userService.login(userId, password);
		session.setAttribute("userNo", loginUser.getUserNo());
		session.setAttribute("user", loginUser);
		response.sendRedirect("index.jsp");
	}catch(Exception e){
		e.printStackTrace();
		
		response.sendRedirect("user_login_form.jsp?error=true");
	}
%>