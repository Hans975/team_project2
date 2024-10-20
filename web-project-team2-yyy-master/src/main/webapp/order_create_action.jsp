<%@page import="com.itwill.team2.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.team2.domain.Size"%>
<%@page import="com.itwill.team2.domain.Color"%>
<%@page import="com.itwill.team2.domain.OrderItem"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.service.CartService"%>
<%@page import="com.itwill.team2.domain.Cart"%>
<%@page import="com.itwill.team2.domain.Order"%>
<%@page import="com.itwill.team2.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<% 
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("index.jsp");
		return;
	}

	String orderName = "";
	Order order = new Order();
	List<OrderItem> orderItems = new ArrayList<OrderItem>();
	OrderService orderService = new OrderService();
	CartService cartService = new CartService();
	ProductService productService = new ProductService();
	String[] cartNoStrArray = request.getParameterValues("cartNo");
	String[] cartQtyStrArray = request.getParameterValues("cartQty");
	
	if(cartNoStrArray==null){
		response.sendRedirect("index.jsp");
		return;
	}
	int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
	for (int i = 0; i < cartNoStrArray.length; i++) {
		String cartNoStr = cartNoStrArray[i];
		String cartQtyStr = cartQtyStrArray[i];
		int cart_no = Integer.parseInt(cartNoStr);
		Cart cart = cartService.findCart(cart_no);
		Product product = cart.getProduct();
		Color color = cart.getColor();
		Size size = cart.getSize();
		orderItems.add(new OrderItem(0, cart.getCartQty(), order, product, color, size));
		Product productStock = productService.productStock(cart.getProduct().getProductNo(), color.getColorNo(), size.getSizeNo());
		int stockQty = (productStock.getStocks().get(0).getStockQty() - Integer.parseInt(cartQtyStr));
		productService.productUpdateStock(stockQty, product.getProductNo(), color.getColorNo(), size.getSizeNo());
		
		productService.updateProductSales(product.getProductNo(), Integer.parseInt(cartQtyStr));
	}
	if (orderItems.size() == 1){
		orderName = orderItems.get(0).getProduct().getProductName();
	}else{
		orderName = orderItems.get(0).getProduct().getProductName() + "외" + (orderItems.size() - 1) + "개";
	}
	order = new Order(0, orderName, null, orderPrice, user, orderItems);
	orderService.insert(order, cartNoStrArray);
	response.sendRedirect("orderClear.jsp");
%>