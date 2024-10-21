package com.itwill.team2.Mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.CartDao;
import com.itwill.team2.dao.ProductDao;
import com.itwill.team2.domain.Cart;
import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.ProductImage;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.Stock;
import com.itwill.team2.mapper.CartMapper;
import com.itwill.team2.mapper.ProductMapper;

public class ProductDaoImplMyBatis implements ProductDao{
	private SqlSessionFactory sqlSessionFactory;
	
	public ProductDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	@Override
	public Integer updateProductSales(int productNo, int quantity) throws Exception {
	    SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    return sqlSession.getMapper(ProductMapper.class).updateProductSales(productNo, quantity);
	}

	@Override
	public List<Product> findProductByCategory(String categoryName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectProductByCategory(categoryName);
	}
	@Override
	public List<Product> findProductByCategory(Map<String, Category> categories) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectProductByCategories(categories);
	}
	
	@Override
	public List<Product> findProductOrderByNo() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectProductOrderByNo();
	}
	
	@Override
	public List<Product> findProductSearchName(String productName) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectProductSearchName(productName);
	}
	
	@Override
	public Product findProductByNo(Integer productNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectProductByNo(productNo);
	}
	
	@Override
	public Integer insertProduct(Product insertProduct) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.insertProduct(insertProduct);
		
		for (Color color : insertProduct.getColors()) {
			productMapper.insertProductColor(color);
		}
		
		for (Size size : insertProduct.getSizes()) {
			productMapper.insertProductSize(size);
		}
		
		for (ProductImage productImage : insertProduct.getProductImages()) {
			productMapper.insertProductImage(productImage);
		}
		
		for (Stock stock : insertProduct.getStocks()) {
			productMapper.insertProductStock(stock);
		}
		return insertProduct.getProductNo();
	}
	
	@Override
	public Integer updateProduct(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		int rowCount = productMapper.updateProduct(product);
		
		for (ProductImage productImage : product.getProductImages()) {
			productMapper.deleteProductImage(productImage.getProduct().getProductNo());
			productMapper.insertProductImageForupdate(productImage);
		}
		
		for (Color color : product.getColors()) {
			productMapper.deleteProductColor(color.getProduct().getProductNo());
			productMapper.insertProductColorForupdate(color);
		}
		
		for (Size size : product.getSizes()) {
			productMapper.deleteProductSize(size.getProduct().getProductNo());
			productMapper.insertProductSizeForupdate(size);
		}
		
		for(Stock stock :product.getStocks()) {
			productMapper.deleteProductStock(stock.getProduct().getProductNo());
			productMapper.insertProductStockForupdate(stock);
		}
		
		return rowCount;
	}
	
	@Override
	public Product findProductStock(int productNo, int colorNo, int sizeNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).findProductStock(productNo, colorNo, sizeNo);
	}

	@Override
	public Integer updateProductStock(int stockQty, int productNo, int colorNo, int sizeNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).updateProductStock(stockQty, productNo, colorNo, sizeNo);
	}
	
	@Override
	public Integer deleteProduct(Integer productNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).deleteProduct(productNo);
	}
	
	
	
	
	
	
	
	
//	CATEGORY CRUD 
	@Override
	public List<Category> findCategoryAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectCategoryAll();
	}
	@Override
	public Integer insertCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).insertCategory(category);
	}
	@Override
	public Integer updateCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).updateCategoryByNo(category);
	}
	@Override
	public Integer deleteCategory(Integer categoryNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).deleteCategoryByNo(categoryNo);
	}
	

//	SUB_CATEGORY CRUD
	@Override
	public List<Category> findSubCategoryAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectSubCategoryAll();
	}
	@Override
	public Integer insertSubCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).insertSubCategory(category);
	}
	@Override
	public Integer updateSubCategory(Category category) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).updateSubCategoryByNo(category);
	}
	@Override
	public Integer deleteSubCategory(Integer categoryNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).deleteSubCategoryByNo(categoryNo);
	}
	
	
//	COLOR CRUD
	@Override
	public List<Color> findColorAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectColorAll();
	}
	@Override
	public Integer insertColor(Color color) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).insertColor(color);
	}
	@Override
	public Integer updateColor(Color color) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).updateColorByNo(color);
	}
	@Override
	public Integer deleteColor(Integer colorNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).deleteColorByNo(colorNo);
	}
	
	
//	SIZE CRUD
	@Override
	public List<Size> findSizeAll() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).selectSizeAll();
	}
	@Override
	public Integer insertSize(Size size) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).insertSize(size);
	}
	@Override
	public Integer updateSize(Size size) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).updateSizeByNo(size);
	}
	@Override
	public Integer deleteSize(Integer sizeNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.getMapper(ProductMapper.class).deleteSizeByNo(sizeNo);
	}

	

	
	
	
}
