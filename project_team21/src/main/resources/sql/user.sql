/*
이름               널?       유형            
---------------- -------- ------------- 
USER_NO          NOT NULL NUMBER(10)    
USER_NAME                 VARCHAR2(50)  
USER_ID                   VARCHAR2(100) 
USER_PASSWORD             VARCHAR2(100) 
USER_EMAIL                VARCHAR2(100) 
USER_PHONE                VARCHAR2(100) 
USER_ADDRESS              VARCHAR2(100) 
USER_CREATE_DATE          DATE     
*/

/**********************user insert*****************/
INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저1', 'user1', 'qqq', 'user1@example.com', '111-111-1111','서울시 일구 일동','1번지' ,SYSDATE);

INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저2', 'user2', 'www', 'user2@example.com', '222-222-2222', '서울시 이구 이동', '2번지', SYSDATE);

INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저3', 'user3', 'eee', 'user3@example.com', '333-333-3333', '서울시 삼구 삼동', '3번지', SYSDATE);

INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저4', 'user4', 'rrr', 'user4@example.com', '444-444-4444', '서울시 사구 사동', '4번지', SYSDATE);

INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저5', 'user5', 'aaa', 'user5@example.com', '555-555-5555', '서울시 오구 오동', '5번지', SYSDATE);

INSERT INTO users (USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_DETAIL_ADDRESS, USER_CREATE_DATE) VALUES (users_user_no_SEQ.NEXTVAL, '유저6', 'user6', 'sss', 'user6@example.com', '666-666-6666', '서울시 육구 육동', '6번지', SYSDATE);


/**********************user udpate*****************/
UPDATE users SET    
    USER_NAME = '유저2 업데이트', 
    USER_PASSWORD = 'newPassword2', 
    USER_EMAIL = 'updated_user2@example.com', 
    USER_PHONE = '222-222-2223', 
    USER_ADDRESS = '이문구 이일동 업데이트', 
    USER_CREATE_DATE = SYSDATE 
WHERE USER_NO = 1;


/**********************user select*****************/
// users 테이블에 동일한 아이디가 존재하는지 확인
SELECT COUNT(*) FROM users WHERE USER_ID = 'user1';


// user 한사람의 전체 정보 검색
SELECT USER_NO, USER_NAME, USER_ID, USER_PASSWORD, USER_EMAIL, USER_PHONE, USER_ADDRESS, USER_CREATE_DATE FROM users WHERE USER_ID = 'user1';


/**********************user delete*****************/
DELETE FROM users WHERE USER_NO = 1;



