package com.itwill.team2.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private Integer productNo;
	private String productName;
	private Integer productPrice;
	private Date productDate;
	private Integer productSales;
	private Category category;
	private Category subCategory;
	private List<Review> reviews;
	private List<Color> colors;
	private List<Size> sizes;
	private List<ProductImage> productImages;
	private List<Stock> stocks;
}
