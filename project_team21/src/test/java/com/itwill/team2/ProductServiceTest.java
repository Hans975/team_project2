
package com.itwill.team2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.ProductImage;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.Stock;
import com.itwill.team2.service.ProductService;

public class ProductServiceTest {
	public static void main(String[] args) throws Exception {
		ProductService productService = new ProductService();
//		List<Product> products = productService.productListOrderByNo();
//		for (Product product : products) {
//			System.out.println(product);
//		}
//		Category category = Category.builder().categoryName("남성").build();
//		List<Product> products = productService.productListByCategory(category);
//		System.out.println(products);
		
		
		Product product = productService.productDetail(1);
		System.out.println(product);
//		List<Color> colors = product.getColors();
//		List<Size> sizes = product.getSizes();
//		int sum = 0;
//		String productColor = null;
//		for(Color color : colors){
//    		//갈색   검은색
//            	for(int i = 0; i < product.getStocks().size(); i++){
//            		// 검정 L 53   검정 XL 40   갈색 L 15   갈색 XL 225
//            		if(color.getColorName().equals(product.getStocks().get(i).getColor().getColorName())){
//            			sum += product.getStocks().get(i).getStockQty();
//        				productColor = color.getColorName();
//            		} 
//            	} 
//            	System.out.print(sum+"	"+productColor+"	");
//            	System.out.println();
//            	sum = 0;
//    	}
//		for(int j = 0; j < product.getProductImages().size(); j++){
//    		//갈색   검은색
//	    	for(Size size : sizes){
//	    		// L   XL
//	        	for(int i = 0; i < product.getStocks().size(); i++){
//	        		// 검정 L 53   검정 XL 40   갈색 L 15   갈색 XL 225
//	        		if(size.getSizeName().equals(product.getStocks().get(i).getSize().getSizeName()) && product.getProductImages().get(j).getProductImageNo() == 1){
//	        			if (product.getStocks().get(i).getColor().getColorName().equals("BROWN") ) {
//	        				System.out.print(product.getStocks().get(i).getStockQty()); 
//			                System.out.print("	"+size.getSizeName()); 
//			                System.out.println();
//						}
//	        				
//	        		} 
//	        	} 
//	    	}
//		}
//		System.out.println(productService.categoryList());
//		System.out.println(productService.subCategoryList());
//		System.out.println(productService.colorList());
//		System.out.println(productService.sizeList());
//		
//		Map<String, Category> categories = new HashMap<>();
//		categories.put("category", Category.builder().categoryName("남성").build());
//		categories.put("sub_category", Category.builder().categoryName("상의").build());
//		
//		System.out.println(productService.productListByCategory(categories));
//		List<Color> colors = new ArrayList<Color>();
//		colors.add(Color.builder().colorNo(1).build());
//		colors.add(Color.builder().colorNo(2).build());
//		List<Size> sizes = new ArrayList<Size>();
//		sizes.add(Size.builder().sizeNo(1).build());
//		sizes.add(Size.builder().sizeNo(2).build());
//		sizes.add(Size.builder().sizeNo(3).build());
//		List<ProductImage> images = new ArrayList<>();
//		images.add(ProductImage.builder().productImageName("image.jpg").build());
//		
//		List<Stock> stocks = new ArrayList<>();
//		stocks.add(Stock.builder()
//						.color(Color.builder().colorNo(1).build())
//						.size(Size.builder().sizeNo(1).build())
//						.stockQty(11)
//						.build());
//		stocks.add(Stock.builder()
//				.color(Color.builder().colorNo(1).build())
//				.size(Size.builder().sizeNo(2).build())
//				.stockQty(22)
//				.build());
//		stocks.add(Stock.builder()
//				.color(Color.builder().colorNo(1).build())
//				.size(Size.builder().sizeNo(3).build())
//				.stockQty(33)
//				.build());
//		
//		Product product = Product.builder()
//									.productName("후드스웻셔츠")
//									.productPrice(49900)
//									.productSales(0)
//									.category(Category.builder().categoryNo(1).categoryName("남성").build())
//									.subCategory(Category.builder().categoryNo(2).categoryName("상의").build())
//									.colors(colors)
//									.sizes(sizes)
//									.productImages(new ArrayList<ProductImage>())
//									.stocks(stocks)
//									.build();
//		
//		System.out.println(productService.productDetail(productService.productInsert(product))); 
//		System.out.println(productService.productDetail(1));
		
		List<Product> productList = productService.productListSerchName("셔츠");
		for (Product product1 : productList) {
			System.out.println(product1);
		}
		
		productService.subCategoryInsert(Category.builder().categoryName("아동").build());
	}
	
}


