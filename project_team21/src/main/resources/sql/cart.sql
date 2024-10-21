/* 
public class Cart {
	private int  cartNo; 
	private int  cartQty;
//-------------pk----------------
	private int userNo;
	private int productNo;
  */
/*
 *  -------------------INSERT
 */
INSERT INTO Cart (cart_No, cart_Qty, user_No, product_No, color_no, size_no)
VALUES (cart_cart_no_SEQ.nextval, #{cartQty}, #{userNo}, #{productNo}, #{colorNo} ,#{sizeNo});

INSERT INTO Cart (cart_No, cart_Qty, user_No, product_No, color_no, size_no)
VALUES (cart_cart_no_SEQ.nextval, 2, 7, 1,1,3);
INSERT INTO Cart (cart_No, cart_Qty, user_No, product_No, color_no, size_no)
VALUES (cart_cart_no_SEQ.nextval, 3, 7, 2,1,3);
/*
 *  -------------------SELECT
 */
SELECT 
    c.cart_No, 
    c.cart_Qty, 
    u.user_No, 
    p.product_No,
    p.product_name,
    p.product_price,
    pi.product_Image_Name,
    s.size_no,
    co.color_no
FROM 
    Cart c
JOIN 							
    Product p ON c.product_no = p.product_no
JOIN 
    Users u ON c.user_no = u.user_no  
JOIN 
    Product_Image pi ON p.product_no = pi.product_no 

    JOIN 
    Sizes s ON c.size_no = s.size_no 
JOIN 
    Color co ON c.color_no = co.color_no 
WHERE 
    u.user_No = #{userNO};

----------------------------------------------------------
SELECT 
    c.cart_No, 
    c.cart_Qty, 
    u.user_No, 
    p.product_No,
    p.product_name,
    p.product_price,
    pi.product_Image_Name,
    s.size_no,
    co.color_no
FROM 
    Cart c
JOIN 							
    Product p ON c.product_no = p.product_no
JOIN 
    Users u ON c.user_no = u.user_no  
JOIN 
    Product_Image pi ON p.product_no = pi.product_no 

    JOIN 
    Sizes s ON c.size_no = s.size_no 
JOIN 
    Color co ON c.color_no = co.color_no 
WHERE 
    u.user_No = 1;
/*
 *  -------------------UPDATE
 */
--UPDATE Cart SET cart_Qty = #{cartQtu}
--WHERE user_No = #{userNo} AND product_No = #{productNo};

UPDATE Cart 
SET cart_Qty = #{cartQty}
WHERE cart_no = #{cartNo}

UPDATE Cart 
SET cart_Qty = 4
WHERE cart_no = 1



--UPDATE Cart SET cart_Qty = 2
--WHERE user_No = 1 AND product_No = 1;
--UPDATE Cart SET cart_Qty = 2
--WHERE user_No = 1 AND product_No = 2;
/*
 *  -------------------DELETE
 */
DELETE FROM Cart WHERE cart_No = #{cartNo} 

DELETE FROM Cart WHERE cart_No=1
/*
 * --------------userNo --> cartNoAll DELETE
 */
DELETE FROM Cart
WHERE user_No = #{userNo};

DELETE FROM Cart
WHERE user_No = 1;




 
 