package com.itwill.team2;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;
import com.itwill.team2.domain.User;
import com.itwill.team2.service.ReviewService;

public class ReviewServiceTest {

	public static void main(String[] args) throws Exception {
		ReviewService reviewService = new ReviewService();
		List<Review> reviews = reviewService.findReviewListByProductNoByDate(1);
		System.out.println(reviewService.findProductNoByReviewCount(1, 5));
		
		List<Review> reviews1 = reviewService.findReviewByProductNoOrderByScore(1);
  	  	for(int i = 0; i < reviews.size(); i++){
  	  		Review review = reviews.get(i);
	  	  	if (review.getReviewImages() != null && !review.getReviewImages().isEmpty()) {
	  	        // 첫 번째 이미지가 null이 아닌지 확인
	  	  		for (int j = 0; j < review.getReviewImages().size(); j++) {
	  	  			System.out.println(review.getReviewImages().get(j).getReviewImageName());
				}
	  	    }
  	  	}
//		List<ReviewImage> reviewImages = new ArrayList<>();
//		reviewImages.add(ReviewImage.builder().reviewImageName("image02.jpg").build());
//		reviewImages.add(ReviewImage.builder().reviewImageName("image03.jpg").build());
//		
//		rowCount = reviewService.insertReview(Review.builder()
//				.reviewTitle("10.10 리뷰테스트01")
//				.reviewContent("10.10 01번리뷰입니다.")
//				.reviewScore(3)
//				.user(User.builder().userNo(3).build())
//				.product(Product.builder().productNo(1).build())
//				.reviewImages(reviewImages)
//				.build());
//		System.out.println("======================create rowCount: "+rowCount);
//		
//		
//		rowCount = reviewService.deleteReviewByNo(12);
//		System.out.println("=================delete rowCount:" + rowCount);
		
//		rowCount = reviewService.deleteAllbyUser(3);
//		System.out.println("======================deleteAllbyUser rowCount: "+rowCount);
		
//		List<ReviewImage> newReviewImages = new ArrayList<>();
//		newReviewImages.add(ReviewImage.builder().reviewImageName("udpate01.jpg").review(Review.builder().reviewNo(6).build()).build());
//		newReviewImages.add(ReviewImage.builder().reviewImageName("update02.jpg").review(Review.builder().reviewNo(6).build()).build());
//		
//		rowCount = reviewService.updateReview(Review.builder()
//								.reviewNo(6)
//								.reviewTitle("sujung리뷰")
//								.reviewContent("sujung X sujung번리뷰입니다.")
//								.reviewScore(3)
//								.user(User.builder().userNo(2).build())
//								.product(Product.builder().productNo(2).build())
//								.reviewImages(newReviewImages)
//								.build());
//		
//		System.out.println("======================update rowCount: "+rowCount);
		
		
//		System.out.println("======================select reviewByProductNo:");
//		List<Review> reviewList = reviewService.findReviewListByProductNo(2);
//		for (Review review : reviewList) {
//			System.out.println(review);
//		}
		

		
//		 List<Review> reviewList =reviewService.findReviewByUserNo(1);
//		 
//		 for (Review review : reviewList) {
//		     System.out.println(review);
//		 }
		 
	

//		System.out.println(reviewService.findReviewDetail(11));
		
		
		
//		List<Review> reviewList =reviewService.findReviewListAll();
//		
//		for (Review review : reviewList) {
//			System.out.println(review);
//		}
		
		
		//별점순으로 나열된 리뷰리스트
		
//		List<Review> reviewList = reviewService.findReviewByProductNoOrderByScore(2);
//		
//		for(Review review : reviewList) {
//			System.out.println(review);
//		}
		
		
	}
}
