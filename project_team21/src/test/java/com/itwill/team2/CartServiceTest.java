package com.itwill.team2;

import java.util.Iterator;
import java.util.List;

import com.itwill.team2.domain.Cart;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.User;
import com.itwill.team2.service.CartService;



public class CartServiceTest {
	public static void main(String[] args) throws Exception {
		CartService cartService = new CartService();
//		List<Cart> carts = cartService.selectByCartUserNoList(1);
//		for (Cart cart2 : carts) {
//		System.out.println(cart2);
//	}
//	
//			System.out.println(cartService.findCart(1));
//			
//			Cart cart=Cart.builder()
//					.cartQty(1)
//					.user(User.builder().userNo(1).build())
//					.product(Product.builder().productNo(1).build())
//					.color(Color.builder().colorNo(1).build())
//					.size(Size.builder().sizeNo(1).build())
//					.build();
//					int rowCount = cartService.insertByCart(cart);
//			List<Cart> carts2 = cartService.selectByCartUserNoList(2);
//			for (Cart cart2 : carts2) {
//				System.out.println(cart2);
//			}
			Cart cart = cartService.findCart(9);
			System.out.println(cart);
					//업데이트
				
		

//				Cart cartup=new Cart(1, 5, new User(1, null, null, null, null, null, null, null)
//																	,new Product(1, null, null, null, null, null, null, null, null, null, null,null)
//																	,new Size(null, null,null)
//																	,new Color(null, null, null,null));
//				int result = cartService.updateByCart(cartup);
//				System.out.println(result);


		//카트 번호로 한개 삭제
//				int cartNo = 10;
//				cartService.deleteByCart(cartNo);
//
//			
//				//유저 번호로 카트 전체 삭제
//				int userno= 2;
//				int result1 = cartService.deleteByCartAll(userno);
        




	
	
			
//			Cart cart1=Cart.builder()
//					.cartQty(1)
//					.user(User.builder().userNo(1).build())
//					.product(Product.builder().productNo(1).build())
//					.color(Color.builder().colorNo(1).build())
//					.size(Size.builder().sizeNo(1).build())
//					.build();
//					int rowCount1 = cartService.insertByCart(cart);
			
			
					//업데이트
				
		

//				Cart cartup=new Cart(1, 5, new User(1, null, null, null, null, null, null, null)
//																	,new Product(1, null, null, null, null, null, null, null, null, null, null,null)
//																	,new Size(null, null,null)
//																	,new Color(null, null, null,null));
//				int result = cartService.updateByCart(cartup);
//				System.out.println(result);


		//카트 번호로 한개 삭제
//				int cartNo = 10;
//				cartService.deleteByCart(cartNo);
//
//			
//				//유저 번호로 카트 전체 삭제
//				int userno= 2;
//				int result1 = cartService.deleteByCartAll(userno);
        
	}
}
	