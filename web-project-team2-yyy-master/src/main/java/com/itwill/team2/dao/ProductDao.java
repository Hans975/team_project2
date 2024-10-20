package com.itwill.team2.dao;

import java.util.List;
import java.util.Map;

import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Size;



public interface ProductDao {
	
	List<Product> findProductByCategory(String categoryName) throws Exception;
	
	List<Product> findProductByCategory(Map<String, Category> categories) throws Exception;
	
	List<Product> findProductOrderByNo() throws Exception;

	Integer updateProductSales(int productNo, int quantity) throws Exception;

	
	List<Product> findProductSearchName(String productName) throws Exception;

	Integer insertProduct(Product product) throws Exception;

	Integer updateProduct(Product product) throws Exception;
	
	Product findProductStock(int productNo, int colorNo, int sizeNo) throws Exception;
	
	Integer updateProductStock(int stockQty, int productNo, int colorNo, int sizeNo) throws Exception;
	
	Integer deleteProduct(Integer productNo) throws Exception;
	
	Product findProductByNo(Integer productNo) throws Exception;
	
	List<Category> findCategoryAll() throws Exception;
	Integer insertCategory(Category category) throws Exception;
	Integer updateCategory(Category category) throws Exception;
	Integer deleteCategory(Integer categoryNo) throws Exception;
	
	List<Category> findSubCategoryAll() throws Exception;
	Integer insertSubCategory(Category category) throws Exception;
	Integer updateSubCategory(Category category) throws Exception;
	Integer deleteSubCategory(Integer categoryNo) throws Exception;
	
	List<Color> findColorAll() throws Exception;
	Integer insertColor(Color color) throws Exception;
	Integer updateColor(Color color) throws Exception;
	Integer deleteColor(Integer colorNo) throws Exception;
	
	
	List<Size> findSizeAll() throws Exception;
	Integer insertSize(Size size) throws Exception;
	Integer updateSize(Size size) throws Exception;
	Integer deleteSize(Integer sizeNo) throws Exception;
	
}
