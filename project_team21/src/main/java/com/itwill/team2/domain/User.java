package com.itwill.team2.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

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

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	private String userDetailAddress;
	private Date userCreateDate;
	
	
	public boolean isMatchPassword(String password){
		boolean isMatch=false;
		if(this.userPassword.equals(password)){
			isMatch=true;
		}
		return isMatch;
	}

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}

	

}