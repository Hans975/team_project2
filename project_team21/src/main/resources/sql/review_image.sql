/*
이름                널?       유형            
----------------- -------- ------------- 
REVIEW_IMAGE_NO   NOT NULL NUMBER(10)    
REVIEW_IMAGE_NAME          VARCHAR2(300) 
REVIEW_NO                  NUMBER(10) 
*/


/**********************review_image insert*****************/
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, 'image00.jpg', 6);

INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, 'image01.jpg', 6);

INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, 'image02.jpg', 6);


/**********************review_image update*****************/
UPDATE review_image
SET REVIEW_IMAGE_NAME = 'newImage.jpg'
WHERE REVIEW_IMAGE_NO = 1;


/**********************review_image select*****************/
// 특정 리뷰에 사용된 전체 사진 조회
SELECT REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO
FROM review_image
WHERE REVIEW_NO = 1;


/**********************review_image delete*****************/
// review_image 테이블에서 1개의 사진 삭제
DELETE FROM review_image
WHERE REVIEW_IMAGE_NO = 1;


// review_image 테이블에서 특정 리뷰에 사용된 사진 전체 삭제
DELETE FROM review_image
WHERE REVIEW_NO = 6;