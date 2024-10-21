package com.itwill.team2.service;

import java.util.List;

import com.itwill.team2.Mybatis.ReviewDaoImplMyBatis;
import com.itwill.team2.dao.ReviewDao;
import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;

public class ReviewService {
   private ReviewDao reviewDao;
   
   public ReviewService() throws Exception{
      reviewDao = new ReviewDaoImplMyBatis();
   }
   
   //리뷰 생성
   public int insertReview(Review review) throws Exception {
      return reviewDao.insertReview(review);
   }
   
   //리뷰 1건 삭제
   public int deleteReviewByNo(int reviewNo) throws Exception {
      return reviewDao.deleteReviewByNo(reviewNo);
   }
   
   //유저가 작성한 리뷰 전체 삭제(+회원 탈퇴)
   public int deleteAllbyUser(int userNo) throws Exception {
      return reviewDao.deleteAllByUserNo(userNo);
   }
   
   //리뷰 업데이트
   public int updateReview(Review review) throws Exception {
      return reviewDao.updateReview(review);
   }
   
   //상품에 대한 사용자들의 리뷰 리스트 (날짜 순)
   public List<Review> findReviewListByProductNoByDate(int productNo) throws Exception {
      return reviewDao.findReviewByProductNoByDate(productNo);
   }
   //상품에 대한 사용자들의 리뷰 리스트 (최신 순)
   public List<Review> findReviewListByProductNoByNew(int productNo) throws Exception {
	   return reviewDao.findReviewByProductNoByNew(productNo);
   }
   
   //상품에 대한 사용자들의 리뷰 리스트(평점기준 정렬)
   public List<Review> findReviewByProductNoOrderByScore(int productNo) throws Exception {
	   return reviewDao.findReviewByProductNoOrderByScore(productNo);
   }

   //사용자가 자신이 쓴 리뷰리스트 출력(리뷰목록)
   public List<Review> findReviewByUserNo(int userNo) throws Exception {
	    return reviewDao.findReviewByUserNo(userNo);
   }
   
   
   // 전체 리뷰리스트 검색(관리자용)
   public List<Review> findReviewListAll() throws Exception{
	   return reviewDao.findReviewListAll();
   }
   
   //삼품 리뷰 상세
   public Review findReviewDetail(int reviewNo) throws Exception {
      return reviewDao.findReviewDetailByReviewNo(reviewNo);   
   }
   
   // 특정 상품의 대한 별점 별 리뷰 갯수 
   public int findProductNoByReviewCount(int productNo, int reviewScore) throws Exception{
	   return reviewDao.findProductNoByReviewCount(productNo, reviewScore);
   }
   
}
