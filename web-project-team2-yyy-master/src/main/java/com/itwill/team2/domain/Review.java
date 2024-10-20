package com.itwill.team2.domain;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

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

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Review {
	
	private int reviewNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String reviewScoreText;
	private Date reviewDate;
	
	/**********FK*********/
	private User user;
	private Product product;
	
	
	/**********FK*********/ // 리뷰별로 여러장의 리뷰사진이 있는 경우를 대비해 list타입으로 선언
	@Default
	List<ReviewImage> reviewImages = new ArrayList<ReviewImage>();
	
	
}
