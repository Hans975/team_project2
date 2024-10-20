package com.itwill.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;

public interface ReviewMapper {
	
	// 리뷰생성
	/***********review_Image 관련 메소드********/
	
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
	
	// 상품리뷰에서 특정 리뷰 상세보기(리뷰상세)
	Review findReviewDetailByReviewNo(int reviewNo) throws Exception;
	
	//별점순으로 나열한 리뷰 리스트
	List<Review> findReviewByProductNoOrderByScore(int productNo) throws Exception;
	
	// 전체 리뷰리스트 검색(관리자용)
	List<Review> findReviewListAll() throws Exception;
	
	
	/***********review_Image 관련 메소드********/
	
	// 리뷰이미지 업로드
	int insertReviewImage(ReviewImage reviewImage) throws Exception;
	
	int insertReviewImageForUpdate(ReviewImage reviewImage) throws Exception;
	
	// 리뷰이미지 1개 삭제
	int deleteReviewImageByReviewImageNo(int reviewImageNo) throws Exception;
	
	// 해당 리뷰에 업로드된 이미지 전체 삭제(리뷰 삭제시 적용)
	int deleteAllImageByReviewNo(int reviewNo) throws Exception;
	
	// 리뷰이미지 수정
	int updateReviewImage(ReviewImage reviewImage) throws Exception;
	
	// 특정 리뷰에 사용된 전체 사진 조회
	List<ReviewImage> findReviewImageByReviewNo(int reviewNo) throws Exception;
	
	// 특정 상품의 대한 별점 별 리뷰 갯수 
	int findProductNoByReviewCount(@Param("productNo") int productNo, @Param("reviewScore") int reviewScore) throws Exception;
}
