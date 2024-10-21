<%@page import="com.itwill.team2.service.UserService"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if(request.getMethod().equalsIgnoreCase("GET")){
        response.sendRedirect("user_find_id_and_password_form.jsp");
        return;
    }

    // 파라미터 받기
    String userName = request.getParameter("username");
    String userPhone = request.getParameter("phone");
    String userId = request.getParameter("userId");
    String findType = request.getParameter("findType"); // "id" 또는 "password" 선택
    System.out.println("userName : "+userName);
    System.out.println("userPhone :"+userPhone);
    System.out.println("userId : "+userId);
    System.out.println("findType : "+findType);

    UserService userService = new UserService();

    try {
        if ("id".equals(findType)) {
            // 아이디 찾기 로직
            if (userName != null && userPhone != null) {
                String foundUserId = userService.findUserId(userName, userPhone);
                if (foundUserId != null) {
                    request.setAttribute("foundUserId", foundUserId);
                } else {
                    request.setAttribute("msg", "해당 정보로 등록된 아이디가 없습니다.");
                }
            } else {
                request.setAttribute("msg", "이름과 전화번호를 모두 입력해주세요.");
            }
            RequestDispatcher rd = request.getRequestDispatcher("user_find_id_and_password_form.jsp");
            rd.forward(request, response);

        } else if ("password".equals(findType)) {
            // 비밀번호 찾기 로직
            if (userId != null && userPhone != null) {
                String foundPassword = userService.findPassword(userId, userPhone);
                if (foundPassword != null) {
                    request.setAttribute("foundPassword", foundPassword);
                    request.setAttribute("findType", "password");
                } else {
                    request.setAttribute("msg", "해당 정보로 등록된 비밀번호가 없습니다.");
                }
            } else {
                request.setAttribute("msg", "아이디와 전화번호를 모두 입력해주세요.");
            }
            RequestDispatcher rd = request.getRequestDispatcher("user_find_id_and_password_form.jsp");
            rd.forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("msg", "오류가 발생했습니다. 다시 시도해주세요.");
        RequestDispatcher rd = request.getRequestDispatcher("user_find_id_and_password_form.jsp");
        rd.forward(request, response);
    }
%>
