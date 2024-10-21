package com.itwill.team2.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Size {
	private Integer sizeNo;
	private String sizeName;
	private Product product;
	
	public Size(int sizeNo) {
        this.sizeNo = sizeNo;
    }
}
