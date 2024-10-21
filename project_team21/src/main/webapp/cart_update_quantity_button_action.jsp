<%@page import="com.itwill.team2.domain.Cart"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String carNo = request.getParameter("carNo");
        String cartQty = request.getParameter("cartQty");

        CartService cartService = new CartService();
        int rowCount = cartService.updateByCart(Cart.builder()
                                        .cartNo(Integer.parseInt(carNo))
                                        .cartQty(Integer.parseInt(cartQty))
                                        .build());

        response.setContentType("text/plain");
        response.getWriter().write("수량 업데이트 완료");
    } else {
        response.sendRedirect("cart_list.jsp");
    }
%>
