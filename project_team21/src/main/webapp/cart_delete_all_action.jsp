<%@page import="com.itwill.team2.service.CartService"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // URL 파라미터로 userNo 값을 받음
    String userNoParam = request.getParameter("userNo");

    if (userNoParam != null && !userNoParam.isEmpty()) {
        // userNo를 Integer로 변환 (URL 인코딩된 값 사용)
        int userNo = Integer.parseInt(URLDecoder.decode(userNoParam, "UTF-8"));

        // GET 방식인 경우
        if (request.getMethod().equalsIgnoreCase("GET")) {
            // CartService를 이용해 카트 전체 삭제 처리
            CartService cartService = new CartService();
            int result = cartService.deleteByCartAll(userNo);
        } 
        response.sendRedirect("cart_form.jsp");
    } else {
        // userNo가 없으면 에러 처리
        out.println("유효하지 않은 사용자 번호입니다.");
    }
%>
