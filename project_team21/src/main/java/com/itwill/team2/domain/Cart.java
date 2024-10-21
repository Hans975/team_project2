package com.itwill.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	private int  cartNo; 
	private int  cartQty;
//-------------pk----------------
	private User user;
	private Product product;
	private Size size;
	private Color color;
	
}
