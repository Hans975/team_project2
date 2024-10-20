package com.itwill.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Stock {
	public Stock(int stockQty, Color color, Size size) {
        this.stockQty = stockQty;
        this.color = color;
        this.size = size;
    }
	private Integer stockNo;
	private Product product;
	private Color color;
	private Size size;
	private Integer stockQty;
}
