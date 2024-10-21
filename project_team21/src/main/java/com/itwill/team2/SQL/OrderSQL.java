package com.itwill.team2.SQL;

public class OrderSQL {
	public final static String ORDER_INSERT = 
			"insert into orders(order_no, order_name, order_date, order_price, user_no) values (orders_order_no_SEQ.nextval, ?, sysdate, ?, ?)";
	public final static String ORDERITEM_INSERT = 
			"insert into order_item(order_item_no, order_item_qty, order_no, product_no) values(order_item_order_item_no_SEQ.nextval, ?, orders_order_no_SEQ.currval, ?)";
	public final static String ORDER_SELECT_BY_USER_NO = 
			"select order_no, order_name, order_date, order_price, user_no from orders where user_no = ?";
	public final static String ORDER_SELECT_WITH_ORDERITEM_BY_ORDER_NO = 
			"select o.order_no, o.order_name, o.order_date, o.order_price, o.user_no, oi.order_item_no, oi.order_item_qty, oi.product_no, p.product_name, p.product_price from orders o join order_item oi on o.order_no = oi.order_no  join  product p on oi.product_no = p.product_no where  o.order_no = ?";
	public final static String ORDER_DELETE_BY_ORDER_NO = 
			"delete from orders where order_no = ?";
	public final static String ORDERITEM_DELETE_BY_ORDER_NO = 
			"delete from order_item where order_no = ?";
	
}
