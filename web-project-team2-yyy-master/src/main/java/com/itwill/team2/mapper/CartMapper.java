package com.itwill.team2.mapper;

import java.util.List;

import com.itwill.team2.domain.Cart;

public interface CartMapper {
	 Cart findByCartNo(int cartNo) throws Exception;
	 
	 int  insertCart(Cart cart) throws Exception;
		
		
	 int updateCart(Cart cart) throws Exception;
	
	
	 int deleteCart(int cartNo) throws Exception;
	
	
	 int deleteCartAll(int userNo) throws Exception;

	 
	 List<Cart>  selectCartUserNoList(int userNo) throws Exception;
	
	 

	
}
