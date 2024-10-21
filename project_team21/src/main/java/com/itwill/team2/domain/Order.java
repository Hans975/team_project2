package com.itwill.team2.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Order {
	private int orderNo;
	private String orderName;
	private Date orderDate;
	private int orderPrice;
	/********FK*********/
	private User user;
	
	@Default
	List<OrderItem> orderItems = new ArrayList<OrderItem>();
}
