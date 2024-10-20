package com.itwill.team2.dao;

import java.util.List;

import com.itwill.team2.domain.Order;

public interface OrderDao {
	/*
	 * 주문생성
	 */
	int insert(Order order) throws Exception;
	/*
	 * 주문1건삭제(ON DELETE CASCADE)
	 */
	int deleteByOrderNo(int o_no) throws Exception;
	/*
	 * 주문전체 보기(특정사용자)
	 */
	List<Order> findOrderByUserNo(int user_no) throws Exception;
	/*
	 * 주문상세 보기(특정사용자)
	 */
	Order findOrderWithOrderItemByOrderNo(int order_no) throws Exception;
}
