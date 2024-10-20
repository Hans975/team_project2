package com.itwill.team2.dao;

import java.util.List;

import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;

public interface ReviewDao {
	
	// 리뷰생성
	int insertReview(Review review) throws Exception;
	
	// 리뷰1건삭제
	int deleteReviewByNo(int reviewNo) throws Exception;
	
	// 유저가 작성한 리뷰 전체 삭제(회원탈퇴시 적용)
	int deleteAllByUserNo(int userNo) throws Exception;
	
	// 리뷰수정
	int updateReview(Review review) throws Exception;
	
	// 특정상품에 대한 사용자들의 리뷰리스트 출력(리뷰목록)
	List<Review> findReviewByProductNoByDate(int productNo) throws Exception;
	
	// 특정상품에 대한 사용자들의 리뷰리스트 출력(리뷰목록)
	List<Review> findReviewByProductNoByNew(int productNo) throws Exception;
	
	//사용자가 자신이 쓴 리뷰리스트 출력(리뷰목록)
	List<Review> findReviewByUserNo(int userNo) throws Exception;
	
	//별점순으로 나열된 리뷰리스트 출력
	List<Review> findReviewByProductNoOrderByScore(int productNo) throws Exception;
	
	// 전체 리뷰리스트 검색(관리자용)
	List<Review> findReviewListAll() throws Exception;
	
	
	// 상품리뷰에서 특정 리뷰 상세보기(리뷰상세)
	Review findReviewDetailByReviewNo(int reviewNo) throws Exception;
	
	// 특정 상품의 대한 별점 별 리뷰 갯수 
	int findProductNoByReviewCount(int productNo, int reviewScore) throws Exception;
	
	
}
