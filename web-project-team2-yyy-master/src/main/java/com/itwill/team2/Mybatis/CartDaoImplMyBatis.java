package com.itwill.team2.Mybatis;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.CartDao;
import com.itwill.team2.domain.Cart;
import com.itwill.team2.mapper.CartMapper;

public class CartDaoImplMyBatis implements CartDao{
	private SqlSessionFactory sqlSessionFactory;
	
	
	public CartDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public Cart findByCartNo(int cartNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Cart cart = sqlSession.getMapper(CartMapper.class).findByCartNo(cartNo);
		sqlSession.close();
		return cart;
	}
	
	@Override
	public int insertCart(Cart cart) throws Exception {
	  SqlSession sqlSession=sqlSessionFactory.openSession(true);
	  sqlSession.getMapper(CartMapper.class).insertCart(cart);
	  sqlSession.close();

	  return cart.getCartNo();
	}

	@Override
	public int updateCart(Cart cart) throws Exception {
		
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		int rowCount=sqlSession.getMapper(CartMapper.class).updateCart(cart);
		sqlSession.close();
		
		return rowCount;
	}

	@Override
	public int deleteCart(int cartNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		int rowCount=sqlSession.getMapper(CartMapper.class).deleteCart(cartNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteCartAll(int userNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		int rowCount=sqlSession.getMapper(CartMapper.class).deleteCartAll(userNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public List<Cart> selectCartUserNoList(int userNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Cart> rowCount=sqlSession.getMapper(CartMapper.class).selectCartUserNoList(userNo);
		sqlSession.close();
		return rowCount;
	}



	
}
