/*
이름             널?       유형             
-------------- -------- -------------- 
REVIEW_NO      NOT NULL NUMBER(10)     
REVIEW_TITLE            VARCHAR2(100)  
REVIEW_CONTENT          VARCHAR2(2048) 
REVIEW_SCORE            NUMBER(1)      
REVIEW_DATE             DATE           
USER_NO                 NUMBER(10)     
PRODUCT_NO              NUMBER(10)     
*/


/**********************review insert*****************/
/*참조키 제약조건으로 인해 user테이블, prodcut테이블, category 테이블 데이터가 존재해야함*/
INSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '1번 리뷰', '1번리뷰 내용입니다', 5, SYSDATE, 1, 1);


INSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '2번 리뷰', '2번리뷰 내용입니다', 4, SYSDATE, 2, 2);


/**********************review update*****************/
UPDATE review
SET REVIEW_TITLE = '2번리뷰(수정)',
    REVIEW_CONTENT = '수정된 리뷰 내용입니다',
    REVIEW_SCORE = 4,
    REVIEW_DATE = SYSDATE
WHERE REVIEW_NO = 1;


/**********************review select*****************/
SELECT REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_DATE, USER_NO, PRODUCT_NO
FROM review
WHERE REVIEW_NO = 6;


/**********************review delete*****************/
DELETE FROM review WHERE REVIEW_NO = 5;



INSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '1번 리뷰', '딱 원하던 색감이라서 만족합니다!', 5, '아주 좋아요', SYSDATE, 1, 1);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '5점 1번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '5점 2번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '5점 3번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
iNSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '2번 리뷰', '저한테 너무 딱 맞아요 아주 굳!', 4, '좋아요', SYSDATE, 1, 1);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '4점 1번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '4점 2번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
iNSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '3번 리뷰', '그럭저럭 대충입기 좋겠네요.', 3, '보통이에요', SYSDATE, 1, 1);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '3점 1번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
iNSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '4번 리뷰', '생각보다는 별로네요.', 2, '싫어요', SYSDATE, 1, 1);
iNSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '5번 리뷰', '원하던 느낌이랑 많이 다르네요.. 참고하세요.', 1, '너무 싫어요', SYSDATE, 1, 1);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '1점 1번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
iNSERT INTO review (REVIEW_NO, REVIEW_TITLE, REVIEW_CONTENT, REVIEW_SCORE, REVIEW_SCORE_TEXT, REVIEW_DATE, USER_NO, PRODUCT_NO)
VALUES (REVIEW_REVIEW_NO_SEQ.NEXTVAL, '6번 리뷰', '대만족입니다. 핏이 맘에 들어요!!', 5, '아주 좋아요', SYSDATE, 1, 1);
INSERT INTO review_image (REVIEW_IMAGE_NO, REVIEW_IMAGE_NAME, REVIEW_NO)
VALUES (REVIEW_IMAGE_REVIEW_IMAGE_NO_SEQ.NEXTVAL, '5점 1번 사진.jpg', REVIEW_REVIEW_NO_SEQ.CURRVAL);
