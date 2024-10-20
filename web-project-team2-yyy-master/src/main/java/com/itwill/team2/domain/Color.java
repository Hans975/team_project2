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
public class Color {
	private Integer colorNo;
	private String colorName;
	private String colorCode;
	private Product product;
	
	public Color(int colorNo) {
        this.colorNo = colorNo;
    }
	
}
