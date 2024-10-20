<%@ page import="com.itwill.team2.service.CartService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // POST 요청 확인
    if (request.getMethod().equalsIgnoreCase("POST")) {
        // 파라미터로 넘어온 cartNos를 받아옴
        String cartNosParam = request.getParameter("cartNos");

        if (cartNosParam != null && !cartNosParam.isEmpty()) {
            // cartNosParam을 콤마(,)로 분리하여 배열로 변환
            String[] cartNos = cartNosParam.split(",");

            // CartService를 이용하여 삭제 수행
            CartService cartService = new CartService();

            for (String cartNo : cartNos) {
                try {
                    // 각각의 장바구니 항목 삭제
                    cartService.deleteByCart(Integer.parseInt(cartNo));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            // 성공 메시지 반환
            response.setContentType("text/plain");
            response.getWriter().write("선택된 상품이 삭제되었습니다.");
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 요청입니다.");
        }
    } else {
        response.sendRedirect("cart_list.jsp");
    }
%>
