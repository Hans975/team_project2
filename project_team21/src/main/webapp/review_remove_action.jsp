<%@page import="java.io.File"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="com.itwill.team2.domain.Review"%>
<%@page import="com.itwill.team2.domain.ReviewImage"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%	
	if (request.getMethod().equalsIgnoreCase("GET")) {
	    response.sendRedirect("user_review_list.jsp");
	    return;
	}
	
	try {
		
		// 리뷰번호 받아오기
		String reviewNoStr = request.getParameter("reviewNo");
		
		// 리뷰번호 정수로 변환
		int reviewNo = Integer.parseInt(reviewNoStr);
		
		// ReviewService를 통해 리뷰객체정보 받기
        Review review = new ReviewService().findReviewDetail(reviewNo);
		
		// 리뷰객체에서 리뷰이미지정보 추출(리스트)
		List<ReviewImage> reviewImages = review.getReviewImages();
			
		// 리뷰삭제 진행
		new ReviewService().deleteReviewByNo(reviewNo);
		
		// 이미지 파일 삭제경로 지정
        String directoryPath = getServletContext().getRealPath("/reviewImage");
		
		// 서버(프로젝트)에서 사진삭제
		if(reviewImages != null) {
	        for (ReviewImage reviewImage : reviewImages) {
	            String filePath = Paths.get(directoryPath, reviewImage.getReviewImageName()).toString();
	            File file = new File(filePath);
	            if (file.exists()) {
	                file.delete(); // 파일 삭제
	            }
	        }
		}

		response.sendRedirect("user_review_list.jsp");
		
		
	}catch(Exception e){
        e.printStackTrace(); // 로그 출력
        out.println("잘못된 작성양식입니다: " + e.getMessage()); // 에러 메시지 출력
        return;	
	}
	
	
	
	

%>