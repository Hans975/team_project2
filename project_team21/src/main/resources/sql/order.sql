insert into users values(users_user_no_SEQ.nextval, '김진영', '9689', '9689', 'pre9689@naver.com', '010-3621-9689', '경기도 부천시 고강로 10-11 성진그린타운', '2동 101호', sysdate);

insert into orders(order_no, order_name, order_date, order_price, user_no) values (orders_order_no_SEQ.nextval, '니트 외 3개', sysdate, 150000, 1);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '1', orders_order_no_SEQ.currval, 1, 3, 3);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '1', orders_order_no_SEQ.currval, 2, 4, 2);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '1', orders_order_no_SEQ.currval, 3, 2, 3);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '1', orders_order_no_SEQ.currval, 4, 1, 2);

insert into orders(order_no, order_name, order_date, order_price, user_no) values (orders_order_no_SEQ.nextval, '흰티 외 2개', sysdate, 4500, 1);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '3', orders_order_no_SEQ.currval, 3, 2, 3);

insert into orders(order_no, order_name, order_date, order_price, user_no) values (orders_order_no_SEQ.nextval, '검은티 외 2개', sysdate, 3000, 1);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '3', orders_order_no_SEQ.currval, 4, 1, 2);

insert into orders(order_no, order_name, order_date, order_price, user_no) values (orders_order_no_SEQ.nextval, '맨투맨', sysdate, 2500, 1);
insert into order_item(order_item_no, order_item_qty, order_no, product_no, color_no, size_no) values(order_item_order_item_no_SEQ.nextval, '1', orders_order_no_SEQ.currval, 2, 4, 2);

select order_no, order_name, order_date, order_price, user_no from orders where user_no = 1;
select o.order_no, o.order_name, o.order_date, o.order_price, o.user_no, oi.order_item_no, oi.order_item_qty, oi.product_no, p.product_name, p.product_price, oi.color_no, oi.size_no from orders o join order_item oi on o.order_no = oi.order_no  join  product p on oi.product_no = p.product_no join color c on oi.color_no = c.color_no join sizes s on oi.size_no = s.size_no where  o.order_no = 1;
delete from order_item where order_no = 2;
delete from orders where order_no = 2;
