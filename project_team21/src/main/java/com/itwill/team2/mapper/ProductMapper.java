package com.itwill.team2.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.ProductImage;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.Stock;

public interface ProductMapper {
	//selectCategory
	List<Product> selectProductByCategory(String categoryName) throws Exception;
	List<Product> selectProductByCategories(Map<String, Category> categories) throws Exception;
	
	//select NO ESC
	List<Product> selectProductOrderByNo() throws Exception;
	
	// 판매 수량을 업데이트하는 메서드 (기존 값에 추가)
	Integer updateProductSales(@Param("productNo") int productNo, @Param("quantity") int quantity) throws Exception;

	
	//select PRODUCT NAME search
	List<Product> selectProductSearchName(String productName) throws Exception;
	
	//select one
	Product selectProductByNo(Integer productNo) throws Exception;
	
	//insert product
	Integer insertProduct(Product product) throws Exception;
	Integer insertProductImage(ProductImage productImage) throws Exception;
	Integer insertProductColor(Color color) throws Exception;
	Integer insertProductSize(Size size) throws Exception;
	Integer insertProductStock(Stock stock) throws Exception;
	
	//update product
	Integer updateProductSales(Product product) throws Exception;
	Integer updateProduct(Product product) throws Exception;
	Integer	insertProductImageForupdate(ProductImage productImage) throws Exception;
	Integer	insertProductColorForupdate(Color color) throws Exception;
	Integer	insertProductSizeForupdate(Size size) throws Exception;
	Integer	insertProductStockForupdate(Stock stock) throws Exception;
	//구매 후 select product stock 출력 후 update stock
	Product findProductStock(@Param("productNo") int productNo,@Param("colorNo") int colorNo,@Param("sizeNo") int sizeNo) throws Exception;
	Integer updateProductStock(@Param("stockQty")int stockQty,@Param("productNo") int productNo,@Param("colorNo") int colorNo,@Param("sizeNo") int sizeNo) throws Exception;
	//delete product
	Integer deleteProduct(Integer productNo) throws Exception;
	Integer deleteProductImage(Integer productNo) throws Exception;
	Integer deleteProductColor(Integer productNo) throws Exception;
	Integer deleteProductSize(Integer productNo) throws Exception;
	Integer deleteProductStock(Integer productNo) throws Exception;
	
	
	
	
	
//	category table CRUD
	List<Category> selectCategoryAll() throws Exception;
	Integer insertCategory(Category category) throws Exception;
	Integer updateCategoryByNo(Category category) throws Exception;
	Integer deleteCategoryByNo(Integer categoryNo) throws Exception;
	
//	sub category table CRUD
	List<Category> selectSubCategoryAll() throws Exception;
	Integer insertSubCategory(Category category) throws Exception;
	Integer updateSubCategoryByNo(Category category) throws Exception;
	Integer deleteSubCategoryByNo(Integer categoryNo) throws Exception;
	
//	color table CRUD
	List<Color> selectColorAll() throws Exception;
	Integer insertColor(Color color) throws Exception;
	Integer updateColorByNo(Color color) throws Exception;
	Integer deleteColorByNo(Integer colorNo) throws Exception;
	
//	size table CRUD
	List<Size> selectSizeAll() throws Exception;
	Integer insertSize(Size size) throws Exception;
	Integer updateSizeByNo(Size size) throws Exception;
	Integer deleteSizeByNo(Integer sizeNo) throws Exception;
	
	
}
