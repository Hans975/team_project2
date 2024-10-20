package com.itwill.team2.service;

import java.util.List;

import com.itwill.team2.Mybatis.CartDaoImplMyBatis;
import com.itwill.team2.dao.CartDao;
import com.itwill.team2.domain.Cart;

public class CartService {

		private CartDao cartDao;
		public CartService() throws Exception{
		cartDao=new CartDaoImplMyBatis();
		
		}
		public Cart findCart(int cartNo) throws Exception{
			return cartDao.findByCartNo(cartNo);
		}
		
		public int insertByCart(Cart cart) throws Exception{
		return cartDao.insertCart(cart);
		}
		
		public  int updateByCart(Cart cart) throws Exception{
		return cartDao.updateCart(cart);
		}
		
		
		 public int deleteByCart(int cartNo) throws Exception{
			 return cartDao.deleteCart(cartNo);
		 }
		
		
		public int deleteByCartAll(int userNo) throws Exception{
			return cartDao.deleteCartAll(userNo);
			
		}
		
		
		 public List<Cart> selectByCartUserNoList(int userNo) throws Exception{
			 return cartDao.selectCartUserNoList(userNo);
		 }
		
		

		
	
}
