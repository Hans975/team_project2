package com.itwill.team2.service;

import java.util.List;

import com.itwill.team2.Mybatis.CartDaoImplMyBatis;
import com.itwill.team2.Mybatis.OrderDaoImplMyBatis;
import com.itwill.team2.dao.CartDao;
import com.itwill.team2.dao.OrderDao;
import com.itwill.team2.dao.ProductDao;
import com.itwill.team2.domain.Order;

public class OrderService {
	private OrderDao orderDao;
	private ProductDao productDao;
	private CartDao cartDao;
	public OrderService() throws Exception{
		orderDao = new OrderDaoImplMyBatis();
		cartDao = new CartDaoImplMyBatis();
	}
	/*
	 * 카드 선택 주문생성
	 */
	public int insert(Order order, String[] cart_noStr_array) throws Exception{
		if (cart_noStr_array != null) {
			for (int i = 0; i < cart_noStr_array.length; i++) {
				cartDao.deleteCart(Integer.parseInt(cart_noStr_array[i]));
			}
		}
		return orderDao.insert(order);
	}
	/*
	 * 주문1개삭제
	 */
	public int deleteByOrderNo(int o_no)throws Exception{
		return orderDao.deleteByOrderNo(o_no);
	}
	/*
	 * 주문목록
	 */
	public List<Order> orderList(int user_no) throws Exception{
		return orderDao.findOrderByUserNo(user_no);
	}
	/*
	 * 주문상세 보기
	 */
	public Order orderDetails(int order_no) throws Exception{
		return orderDao.findOrderWithOrderItemByOrderNo(order_no);
	}
}
