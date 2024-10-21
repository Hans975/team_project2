package com.itwill.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
이름                널?       유형            
----------------- -------- ------------- 
REVIEW_IMAGE_NO   NOT NULL NUMBER(10)    
REVIEW_IMAGE_NAME          VARCHAR2(300) 
REVIEW_NO                  NUMBER(10) 
*/

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewImage {
	
	private int reviewImageNo;
	private String reviewImageName;
	
	/**********FK*********/
	private Review review;
	
	
}
