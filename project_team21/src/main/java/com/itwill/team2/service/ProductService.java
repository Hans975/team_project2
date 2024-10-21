package com.itwill.team2.service;

import java.util.List;
import java.util.Map;

import com.itwill.team2.Mybatis.ProductDaoImplMyBatis;
import com.itwill.team2.dao.ProductDao;
import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Size;

public class ProductService {
	ProductDao productDao; 
	
	public ProductService() throws Exception {
		productDao = new ProductDaoImplMyBatis();
	}
	
	public List<Product> productListByCategory(String categoryName) throws Exception{ 
		return productDao.findProductByCategory(categoryName);
	}
	
	public List<Product> productListByCategory(Map<String, Category> categories) throws Exception{ 
		return productDao.findProductByCategory(categories);
	}
	
	public List<Product> productListOrderByNo() throws Exception{
		return productDao.findProductOrderByNo();
	}
	
	public List<Product> productListSerchName(String productName) throws Exception{
		return productDao.findProductSearchName(productName);
	}
	
	public Product productDetail(Integer productNo) throws Exception{
		return productDao.findProductByNo(productNo);
	}
	
	public Integer productInsert(Product insertProduct) throws Exception{
		return productDao.insertProduct(insertProduct);
	}
	
	public Integer productUpdate(Product product) throws Exception{
		return productDao.updateProduct(product);
	}
	
	public Integer updateProductSales(int productNo, int quantity) throws Exception{
		return productDao.updateProductSales(productNo, quantity);
	}
	
	public Product productStock(int productNo, int colorNo, int sizeNo) throws Exception{
		return productDao.findProductStock(productNo, colorNo, sizeNo);
	}
	
	public Integer productUpdateStock(int stockQty, int productNo, int colorNo, int sizeNo) throws Exception{
		return productDao.updateProductStock(stockQty, productNo, colorNo, sizeNo);
	}
	
	public Integer productDelete(Integer productNo) throws Exception{
		return productDao.deleteProduct(productNo);
	}
	
	
	
	
	
//	CATEGORY CRUD SERVICE
	public List<Category> categoryList() throws Exception{
		return productDao.findCategoryAll();
	}
	public Integer categoryInsert(Category category) throws Exception{
		return productDao.insertCategory(category);
	}
	public Integer categoryUpdate(Category category) throws Exception{
		return productDao.updateCategory(category);
	}
	public Integer categoryDelete(Integer categoryNo) throws Exception{
		return productDao.deleteCategory(categoryNo);
	}
	
	
	
	
	
//	SUB_CATEGORY CRUD SERVICE
	public List<Category> subCategoryList() throws Exception{
		return productDao.findSubCategoryAll();
	}
	public Integer subCategoryInsert(Category category) throws Exception{
		return productDao.insertSubCategory(category);
	}
	public Integer subCategoryUpdate(Category category) throws Exception{
		return productDao.updateSubCategory(category);
	}
	public Integer subCategoryDelete(Integer categoryNo) throws Exception{
		return productDao.deleteSubCategory(categoryNo);
	}
	
	
//	COLOR CRUD SERVICE
	public List<Color> colorList() throws Exception {
		return productDao.findColorAll();
	}
	public Integer colorInsert(Color color) throws Exception{
		return productDao.insertColor(color);
	}
	public Integer colorUpdate(Color color) throws Exception{
		return productDao.updateColor(color);
	}
	public Integer colorDelete(Integer colorNo) throws Exception{
		return productDao.deleteColor(colorNo);
	}
	
//	SIZES CRUD SERVICE
	public List<Size> sizeList() throws Exception {
		return productDao.findSizeAll();
	}
	public Integer SizeInsert(Size size) throws Exception{
		return productDao.insertSize(size);
	}
	public Integer SizeUpdate(Size size) throws Exception{
		return productDao.updateSize(size);
	}
	public Integer SizeDelete(Integer sizeNo) throws Exception{
		return productDao.deleteSize(sizeNo);
	}
}
