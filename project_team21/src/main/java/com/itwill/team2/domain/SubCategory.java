package com.itwill.team2.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SubCategory {
	private Integer categoryNo;
	private String subCategoryName;
}

