package com.itwill.team2.Mybatis;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.OrderDao;
import com.itwill.team2.domain.Order;
import com.itwill.team2.domain.OrderItem;
import com.itwill.team2.mapper.OrderMapper;

public class OrderDaoImplMyBatis implements OrderDao{
	private SqlSessionFactory sqlSessionFactory;
	
	public OrderDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public int insert(Order order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int insertRowCount = orderMapper.insert(order);
		List<OrderItem> orderItems = order.getOrderItems();
		for (OrderItem orderItem : orderItems) {
			orderItem.setOrderItemNo(order.getOrderNo());
			orderMapper.insertOrderItem(orderItem);
		}
		sqlSession.commit();
		sqlSession.close();
		return insertRowCount;
	}

	@Override
	public int deleteByOrderNo(int o_no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int deleteRowCount = sqlSession.getMapper(OrderMapper.class).deleteByOrderNo(o_no);
		sqlSession.close();
		return deleteRowCount;
	}

	@Override
	public List<Order> findOrderByUserNo(int user_no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findOrderByUserNo(user_no);
		sqlSession.close();
		return orderList;
	}

	@Override
	public Order findOrderWithOrderItemByOrderNo(int order_no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Order order = sqlSession.getMapper(OrderMapper.class).findOrderWithOrderItemByOrderNo(order_no);
		sqlSession.close();
		return order;
	}
}
