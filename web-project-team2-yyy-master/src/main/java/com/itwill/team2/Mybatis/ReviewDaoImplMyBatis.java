package com.itwill.team2.Mybatis;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.ReviewDao;
import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;
import com.itwill.team2.mapper.ReviewMapper;

public class ReviewDaoImplMyBatis implements ReviewDao{
	
	private SqlSessionFactory sqlSessionFactory;
	
	public ReviewDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public int insertReview(Review review) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper=sqlSession.getMapper(ReviewMapper.class);
		int rowCount = reviewMapper.insertReview(review);
		List<ReviewImage> reviewImages = review.getReviewImages();
		for(ReviewImage reviewImage : reviewImages) {

			reviewMapper.insertReviewImage(reviewImage);
		}
		sqlSession.commit();
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteReviewByNo(int reviewNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		sqlSession.getMapper(ReviewMapper.class).deleteAllImageByReviewNo(reviewNo);
		int rowCount=sqlSession.getMapper(ReviewMapper.class).deleteReviewByNo(reviewNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteAllByUserNo(int userNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Review> userReviews = sqlSession.getMapper(ReviewMapper.class).findReviewByUserNo(userNo);
		for(Review review : userReviews) {
			sqlSession.getMapper(ReviewMapper.class).deleteAllImageByReviewNo(review.getReviewNo());
		}
		int rowCount=sqlSession.getMapper(ReviewMapper.class).deleteAllByUserNo(userNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int updateReview(Review review) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int rowCount=reviewMapper.updateReview(review);
		
		// 업데이트 전 리뷰 이미지 초기화(삭제)
		reviewMapper.deleteAllImageByReviewNo(review.getReviewNo());
		
		// 리뷰 이미지 테이블 다시 insert 진행
		List<ReviewImage> reviewImages = review.getReviewImages();
		for(ReviewImage reviewImage : reviewImages) {
			reviewImage.setReview(Review.builder().reviewNo(review.getReviewNo()).build());
			reviewMapper.insertReviewImageForUpdate(reviewImage);
		}
		
		sqlSession.commit();
		sqlSession.close();
		return rowCount;
		
	}

	@Override
	public List<Review> findReviewByProductNoByDate(int productNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Review> reviewList=sqlSession.getMapper(ReviewMapper.class).findReviewByProductNoByDate(productNo);
		sqlSession.close();
		return reviewList;
	}
	
	@Override
	public List<Review> findReviewByProductNoByNew(int productNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Review> reviewList=sqlSession.getMapper(ReviewMapper.class).findReviewByProductNoByNew(productNo);
		sqlSession.close();
		return reviewList;
	}
	
	@Override
	public List<Review> findReviewByUserNo(int userNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Review> reviewList=sqlSession.getMapper(ReviewMapper.class).findReviewByUserNo(userNo);
		sqlSession.close();
		return reviewList;
	}

	@Override
	public Review findReviewDetailByReviewNo(int reviewNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		Review review = sqlSession.getMapper(ReviewMapper.class).findReviewDetailByReviewNo(reviewNo);
		sqlSession.close();
		return review;
	}
	
	@Override
	public List<Review> findReviewByProductNoOrderByScore(int productNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<Review> reviewList = sqlSession.getMapper(ReviewMapper.class).findReviewByProductNoOrderByScore(productNo);
		sqlSession.close();
		return reviewList;
	}

	@Override
	public List<Review> findReviewListAll() throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		List<Review> reviewLists=sqlSession.getMapper(ReviewMapper.class).findReviewListAll();
		sqlSession.close();
		return reviewLists;
	}

	@Override
	public int findProductNoByReviewCount(int productNo, int reviewScore) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int reviewCount = sqlSession.getMapper(ReviewMapper.class).findProductNoByReviewCount(productNo, reviewScore);
		return reviewCount;
	}

	
	
	
	
	
}