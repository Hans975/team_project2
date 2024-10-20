<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itwill.team2.service.ReviewService"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@page import="com.itwill.team2.service.UserService"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="com.itwill.team2.domain.User"%>
<%@page import="com.itwill.team2.domain.Review"%>
<%@page import="com.itwill.team2.domain.ReviewImage"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%-- <%@include file="login_check.jspf" %>  --%>
<% 
    if (request.getMethod().equalsIgnoreCase("GET")) {
        response.sendRedirect("review_test_form.jsp");
        return;
    }

    try {
        // 리뷰 제목, 내용, 점수 받기
        String reviewTitle = request.getParameter("reviewTitle");
        String reviewContent = request.getParameter("reviewContent");
        String reviewScoreStr = request.getParameter("reviewScore");
        String userId = request.getParameter("userId");
        String productNoStr = request.getParameter("productNo");
        String reviewImageNames = request.getParameter("reviewImageNames");
        
     	int reviewScore = Integer.parseInt(reviewScoreStr);
     	int productNo = Integer.parseInt(productNoStr);
     	
        // 현재 날짜 설정
        Date reviewDate = new Date(System.currentTimeMillis());
        
        
        // 사용자와 상품 정보 가져오기	
        User reviewUser = new UserService().findUser(userId);
        //Product product = new ProductService().productDetail(productNo);
    
        // 리뷰 객체 생성
        Review review = Review.builder()
                .reviewTitle(reviewTitle)
                .reviewContent(reviewContent)
                .reviewScore(reviewScore)
                .reviewDate(reviewDate)
                .user(User.builder().userNo(reviewUser.getUserNo()).build())
                .product(Product.builder().productNo(productNo).build())
                .build();
    
        
        // 리뷰 이미지 리스트 생성
        List<ReviewImage> reviewImages = new ArrayList<ReviewImage>();
        
        // 입력받은 리뷰이미지 갯수에맞게 분할하여 reviewImages에 저장
        if (reviewImageNames != null && !reviewImageNames.isEmpty()) {
            String[] imageNamesArray = reviewImageNames.split(",");
            for (String imageName : imageNamesArray) {
                ReviewImage reviewImage = new ReviewImage();
                reviewImage.setReviewImageName(imageName.trim()); // 공백 제거
                reviewImages.add(reviewImage);
            }
        }
   		
        
        // 리뷰 객체에 이미지 리스트 설정
        review.setReviewImages(reviewImages);
    
        // 리뷰 데이터 저장
        new ReviewService().insertReview(review);
    
        // 이후 처리 (성공 메시지, 리다이렉트 등)
        response.sendRedirect("review_list.jsp");
        
    } catch(Exception e) {
        e.printStackTrace(); // 로그 출력
        out.println("잘못된 작성양식입니다: " + e.getMessage()); // 에러 메시지 출력
        return;
    }
%>
