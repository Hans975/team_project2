package com.itwill.team2;

import java.util.ArrayList;
import java.util.List;

import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Order;
import com.itwill.team2.domain.OrderItem;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.User;
import com.itwill.team2.service.OrderService;

public class OrderServiceTest {
	public static void main(String[] args) throws Exception {
		OrderService orderService = new OrderService();
		List<Order> orders = orderService.orderList(1);
		for (Order order : orders) {
			System.out.println(order);
		}
		
		Order orders2 = orderService.orderDetails(1);
		
		
		System.out.println(orders2);
		List<OrderItem> orderItems = orders2.getOrderItems();
		for (OrderItem orderItem : orderItems) {
			System.out.println(orderItem);
		}
		
//		int deleteRowCount = orderService.deleteByOrderNo(3);
//		System.out.println("deleteRowCount : "+deleteRowCount);
//		List<OrderItem> orderItems = new ArrayList<OrderItem>();
//		String[] cart_noStr_array = {"2"};
//		System.out.println(cart_noStr_array[0]);
//		Order order = new Order();
//		OrderItem orderItem = new OrderItem(0, 1, order, new Product(2, null, null, null, null, null, null, null, null, null, null, null), new Color(4, null, null, null), new Size(2, null, null));
//		orderItems.add(orderItem);
//		orderItems.add(new OrderItem(0, 1, order, new Product(2, null, null, null, null, null, null, null, null, null, null, null), new Color(2, null, null, null), new Size(3, null, null)));
//		order = new Order(0, "맨투맨 외 1개", null, 2500, new User(1, null, null, null, null, null, null, null), orderItems);
//		int insertRowCount = orderService.insert(order, cart_noStr_array); //(3, "정태수", "1111", "1111", "jts@naver.com", "010-1111-1111", "서울 강남", null)
//		System.out.println("insertRowCount : "+insertRowCount);
//		
//		cart_noStr_array = new String[]{"1", "3"};
//		order = new Order(0, "니트 외 1개", null, 12500, new User(1, null, null, null, null, null, null, null), new ArrayList<>());
//		orderItem = new OrderItem(0, 1, order, new Product(1, null, null, null, null, null, null, null, null, null, null, null), new Color(4, null, null, null), new Size(2, null, null));
//		order.getOrderItems().add(orderItem);
//		order.getOrderItems().add(new OrderItem(0, 1, order, new Product(2, null, null, null, null, null, null, null, null, null, null, null), new Color(2, null, null, null), new Size(3, null, null)));
//		insertRowCount = orderService.insert(order, cart_noStr_array); //(3, "정태수", "1111", "1111", "jts@naver.com", "010-1111-1111", "서울 강남", null)
//		System.out.println("insertRowCount : "+insertRowCount);
		
	}
}
