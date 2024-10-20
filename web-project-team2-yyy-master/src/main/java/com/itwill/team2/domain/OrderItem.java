package com.itwill.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderItem {
	private int orderItemNo;
	private int orderItemQty;
	/************FK******************/
	private Order order;
	private Product product;
	private Color color;
	private Size size;
}	
