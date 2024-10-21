DROP TABLE product_image CASCADE CONSTRAINTS;
DROP TABLE stock CASCADE CONSTRAINTS;
DROP TABLE product_size CASCADE CONSTRAINTS;
DROP TABLE product_color CASCADE CONSTRAINTS;
DROP TABLE review_image CASCADE CONSTRAINTS;
DROP TABLE admin CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE order_Item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE sizes CASCADE CONSTRAINTS;
DROP TABLE color CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE sub_category CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;

CREATE TABLE users(
		user_no                       		NUMBER(10)		 NULL ,
		user_name                     		VARCHAR2(50)		 NULL ,
		user_id                       		VARCHAR2(100)		 NULL ,
		user_password                 		VARCHAR2(100)		 NULL ,
		user_email                    		VARCHAR2(100)		 NULL ,
		user_phone                    		VARCHAR2(100)		 NULL ,
		user_address                  		VARCHAR2(100)		 NULL ,
		user_detail_address           		VARCHAR2(100)		 NULL ,
		user_create_date              		DATE		 DEFAULT sysdate		 NULL 
);

DROP SEQUENCE users_user_no_SEQ;

CREATE SEQUENCE users_user_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE category(
		category_no                   		NUMBER(10)		 NULL ,
		category_name                 		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE category_category_no_SEQ;

CREATE SEQUENCE category_category_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE sub_category(
		sub_category_no               		NUMBER(10)		 NULL ,
		sub_category_name             		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE sub_category_sub_category_no_SEQ;

CREATE SEQUENCE sub_category_sub_category_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product(
		product_no                    		NUMBER(10)		 NULL ,
		product_name                  		VARCHAR2(300)		 NULL ,
		product_price                 		NUMBER(10)		 NULL ,
		product_date                  		DATE		 DEFAULT sysdate		 NULL ,
		product_sales                 		NUMBER(10)		 NULL ,
		category_no                   		NUMBER(10)		 NULL ,
		sub_category_no               		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_product_no_SEQ;

CREATE SEQUENCE product_product_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE color(
		color_no                      		NUMBER(10)		 NULL ,
		color_name                    		VARCHAR2(100)		 NULL ,
		color_code                    		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE color_color_no_SEQ;

CREATE SEQUENCE color_color_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE sizes(
		size_no                       		NUMBER(10)		 NULL ,
		size_name                     		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE sizes_size_no_SEQ;

CREATE SEQUENCE sizes_size_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NULL ,
		cart_qty                      		NUMBER(10)		 NULL ,
		user_no                       		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		color_no                      		NUMBER(10)		 NULL ,
		size_no                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_cart_no_SEQ;

CREATE SEQUENCE cart_cart_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		order_no                      		NUMBER(10)		 NULL ,
		order_name                    		VARCHAR2(300)		 NULL ,
		order_date                    		DATE		 DEFAULT sysdate		 NULL ,
		order_price                   		NUMBER(10)		 NULL ,
		user_no                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE orders_order_no_SEQ;

CREATE SEQUENCE orders_order_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE order_Item(
		order_item_no                 		NUMBER(10)		 NULL ,
		order_item_qty                		NUMBER(10)		 NULL ,
		order_no                      		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		color_no                      		NUMBER(10)		 NULL ,
		size_no                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_Item_order_item_no_SEQ;

CREATE SEQUENCE order_Item_order_item_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		review_no                     		NUMBER(10)		 NULL ,
		review_title                  		VARCHAR2(100)		 NULL ,
		review_content                		VARCHAR2(2048)		 NULL ,
		review_score                  		NUMBER(1)		 NULL ,
		review_score_text             		VARCHAR2(100)		 NULL ,
		review_date                   		DATE		 DEFAULT sysdate		 NULL ,
		user_no                       		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_review_no_SEQ;

CREATE SEQUENCE review_review_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE admin(
		admin_no                      		NUMBER(10)		 NULL ,
		admin_id                      		VARCHAR2(100)		 NULL ,
		admin_password                		VARCHAR2(100)		 NULL ,
		admin_name                    		VARCHAR2(50)		 NULL 
);

DROP SEQUENCE admin_admin_no_SEQ;

CREATE SEQUENCE admin_admin_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review_image(
		review_image_no               		NUMBER(10)		 NULL ,
		review_image_name             		VARCHAR2(300)		 NULL ,
		review_no                     		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_image_review_image_no_SEQ;

CREATE SEQUENCE review_image_review_image_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_color(
		product_color_no              		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		color_no                      		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_color_product_color_no_SEQ;

CREATE SEQUENCE product_color_product_color_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_size(
		product_size_no               		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		size_no                       		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_size_product_size_no_SEQ;

CREATE SEQUENCE product_size_product_size_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE stock(
		stock_no                      		NUMBER(10)		 NULL ,
		product_no                    		NUMBER(10)		 NULL ,
		color_no                      		NUMBER(10)		 NULL ,
		size_no                       		NUMBER(10)		 NULL ,
		stock_qty                     		NUMBER(10)		 NULL 
);

DROP SEQUENCE stock_stock_no_SEQ;

CREATE SEQUENCE stock_stock_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product_image(
		product_image_no              		NUMBER(10)		 NULL ,
		product_image_name            		VARCHAR2(300)		 NULL ,
		product_no                    		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_image_product_image_no_SEQ;

CREATE SEQUENCE product_image_product_image_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE users ADD CONSTRAINT IDX_users_PK PRIMARY KEY (user_no);

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (category_no);

ALTER TABLE sub_category ADD CONSTRAINT IDX_sub_category_PK PRIMARY KEY (sub_category_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (category_no) REFERENCES category (category_no) ON DELETE CASCADE;
ALTER TABLE product ADD CONSTRAINT IDX_product_FK1 FOREIGN KEY (sub_category_no) REFERENCES sub_category (sub_category_no) ON DELETE CASCADE;

ALTER TABLE color ADD CONSTRAINT IDX_color_PK PRIMARY KEY (color_no);

ALTER TABLE sizes ADD CONSTRAINT IDX_sizes_PK PRIMARY KEY (size_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK2 FOREIGN KEY (color_no) REFERENCES color (color_no) ON DELETE CASCADE;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK3 FOREIGN KEY (size_no) REFERENCES sizes (size_no) ON DELETE CASCADE;

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (order_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no) ON DELETE CASCADE;

ALTER TABLE order_Item ADD CONSTRAINT IDX_order_Item_PK PRIMARY KEY (order_item_no);
ALTER TABLE order_Item ADD CONSTRAINT IDX_order_Item_FK0 FOREIGN KEY (order_no) REFERENCES orders (order_no) ON DELETE CASCADE;
ALTER TABLE order_Item ADD CONSTRAINT IDX_order_Item_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE order_Item ADD CONSTRAINT IDX_order_Item_FK2 FOREIGN KEY (color_no) REFERENCES color (color_no) ON DELETE CASCADE;
ALTER TABLE order_Item ADD CONSTRAINT IDX_order_Item_FK3 FOREIGN KEY (size_no) REFERENCES sizes (size_no) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (review_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (user_no) REFERENCES users (user_no) ON DELETE CASCADE;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;

ALTER TABLE admin ADD CONSTRAINT IDX_admin_PK PRIMARY KEY (admin_no);

ALTER TABLE review_image ADD CONSTRAINT IDX_review_image_PK PRIMARY KEY (review_image_no);
ALTER TABLE review_image ADD CONSTRAINT IDX_review_image_FK0 FOREIGN KEY (review_no) REFERENCES review (review_no) ON DELETE CASCADE;

ALTER TABLE product_color ADD CONSTRAINT IDX_product_color_PK PRIMARY KEY (product_color_no);
ALTER TABLE product_color ADD CONSTRAINT IDX_product_color_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE product_color ADD CONSTRAINT IDX_product_color_FK1 FOREIGN KEY (color_no) REFERENCES color (color_no) ON DELETE CASCADE;

ALTER TABLE product_size ADD CONSTRAINT IDX_product_size_PK PRIMARY KEY (product_size_no);
ALTER TABLE product_size ADD CONSTRAINT IDX_product_size_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE product_size ADD CONSTRAINT IDX_product_size_FK1 FOREIGN KEY (size_no) REFERENCES sizes (size_no) ON DELETE CASCADE;

ALTER TABLE stock ADD CONSTRAINT IDX_stock_PK PRIMARY KEY (stock_no);
ALTER TABLE stock ADD CONSTRAINT IDX_stock_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
ALTER TABLE stock ADD CONSTRAINT IDX_stock_FK1 FOREIGN KEY (size_no) REFERENCES sizes (size_no) ON DELETE CASCADE;
ALTER TABLE stock ADD CONSTRAINT IDX_stock_FK2 FOREIGN KEY (color_no) REFERENCES color (color_no) ON DELETE CASCADE;

ALTER TABLE product_image ADD CONSTRAINT IDX_product_image_PK PRIMARY KEY (product_image_no);
ALTER TABLE product_image ADD CONSTRAINT IDX_product_image_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no) ON DELETE CASCADE;
