--//남성 카테고리 전체 상품 리스트
--select p.product_no, p.product_name, p.product_price, pi.product_image_name from product p
--join product_image pi on p.product_no = pi.product_no
--join category c on p.category_no = c.category_no
--where category_name = '남성' AND pi.product_image_name LIKE 'TITLE_1%';

--//1번제품 색상 리스트 select (보류)
--select cr.color_code from product p
--join product_color pc on p.product_no = pc.product_no
--join color cr on pc.color_no = cr.color_no
--where p.product_no = 1;

--//남성 카테고리 전체 상품 리스트
select p.product_no, p.product_name, p.product_price, pi.product_image_name, cr.color_code from product p
join product_image pi on p.product_no = pi.product_no
join category c on p.category_no = c.category_no
join product_color pc on p.product_no = pc.product_no
join color cr on pc.color_no = cr.color_no
where category_name = '남성' AND pi.product_image_name LIKE 'TITLE_1%';


--//남성 상의 카테고리 전체 상품 리스트
--//하위 카테고리 테이블 생성을 고려한 (상위카테고리 + 하위카테고리)select
select p.product_no, p.product_name, p.product_price, pi.product_image_name, cr.color_code
from product p
join product_image pi on p.product_no = pi.product_no
join category c on p.category_no = c.category_no
join sub_category sc on p.sub_category_no = sc.sub_category_no
join product_color pc on p.product_no = pc.product_no
join color cr on pc.color_no = cr.color_no
where c.category_name = '남성' 
AND sc.sub_category_name = '상의' AND pi.product_image_name LIKE 'TITLE_1%';

--//상위 카테고리 테이블과 하위 카테고리 테이블은 반드시 나눠져야한다.

select category_no category_name from category;

select sub_category_no sub_category_name from sub_category;

--//1번상품 상세보기 select
select * from product p 
join product_image pi on p.product_no = pi.product_no
join category c on p.category_no = c.category_no
join sub_category sc on p.sub_category_no = sc.category_no
join product_color pc on p.product_no = pc.product_no
join color cr on pc.color_no = cr.color_no
join product_size ps on p.product_no = ps.product_no
join sizes s on ps.size_no = s.size_no
where p.product_no=1;

--//1번상품 상세보기 select (리뷰포함)
select p.product_name, p.product_price, cr.color_no, cr.color_name, 
        s.size_no, s.size_name, r.review_content, r.review_date, r.review_score, ri.review_image_name
from product p 
join product_image pi on p.product_no = pi.product_no
join category c on p.category_no = c.category_no
join sub_category sc on p.sub_category_no = sc.category_no
join product_color pc on p.product_no = pc.product_no
join color cr on pc.color_no = cr.color_no
join product_size ps on p.product_no = ps.product_no
join sizes s on ps.size_no = s.size_no
join review r on p.product_no = r.product_no
join review_image ri on r.review_no = ri.review_no
where p.product_no=1;

--//1번제품 1번색상 재고 (sum)
select sum(stock_qty) as sum_qty from stock
where product_no = 1 and color_no = 1;  
--//1번제품 1번색상 2번사이즈 재고 (sum)
select stock_qty from stock
where product_no = 1 and color_no = 1 and size_no = 2;