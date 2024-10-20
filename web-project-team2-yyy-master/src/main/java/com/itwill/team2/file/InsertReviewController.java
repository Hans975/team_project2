package com.itwill.team2.file;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;

import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.Review;
import com.itwill.team2.domain.ReviewImage;
import com.itwill.team2.domain.User;
import com.itwill.team2.service.ProductService;
import com.itwill.team2.service.ReviewService;
import com.itwill.team2.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * 파일 업로드 HTTP 요청을 처리하는 서블릿
 * 
 * @fileSizeThreshold fileUpload 시에 메모리에 저장되는 임시 파일 크기를 정의 [자료형 : int]
 * @location 파일 업로드 시에 임시 저장 디렉터리를 지정한다. [자료형 : String]
 * @maxFileSize 업로드할 파일의 치대 크기를 지정한다. [자료형 : long]
 * @maxRequestSize request 시에 최대 크기를 지정한다. [자료형 : long]
 */
@MultipartConfig( fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/review_write")
public class InsertReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.sendRedirect("index.jsp");
			return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("user_login_form.jsp");
			return;
		}
		
		String reviewTitle=request.getParameter("reviewTitle");
		String reviewContent=request.getParameter("reviewContent");
		String reviewScoreStr=request.getParameter("reviewScore");
		String productNoStr=request.getParameter("productNo");
		String reviewScoreText = "";
		
		System.out.println("reviewTitle:"+reviewTitle);
		System.out.println("reviewContent:"+reviewContent);
		System.out.println("reviewScore:"+reviewScoreStr);
		System.out.println("productNoStr:"+productNoStr);
		
		/**설정 파일에서 업로드 디렉토리 경로를 로드
		Properties properties = new Properties();
		InputStream input = FileVO.class.getClassLoader().getResourceAsStream("upload.properties");
		properties.load(input);
		String directoryPath = properties.getProperty("UPLOAD_DIRECTORY");
		*/
		
		//아마 webapp 경로를 지정하는 코드?
		String directoryPath = getServletContext().getRealPath("/reviewImage");

		/**파일을 upload 할 directory 생성*/
		File uploadDirectory = new File(directoryPath);
		if (!uploadDirectory.exists()) {
			uploadDirectory.mkdirs();
		}
		/**파일 업로드 및 파일 정보 반환*/
		Collection<Part> fileParts = request.getParts();
		List<String> reviewImageNames = new ArrayList<>();
		
		for (Part filePart : fileParts) {
			System.out.println(">>>>>>>> filePart.getName(): "+filePart.getName());
			System.out.println(">>>>>>>> filePart.getSize(): "+filePart.getSize());
			if(!filePart.getName().equals("photos") || filePart.getSize()==0) continue;
			//파일 원본 이름, 확장자, 저장 이름 추출
			String originalName = filePart.getSubmittedFileName();
			String extension = FilenameUtils.getExtension(originalName);
			String savedName = UUID.randomUUID() + "_" + originalName;
			File uploadFile = new File(uploadDirectory, savedName);
			//파일 저장
			InputStream inputStream = filePart.getInputStream();
			OutputStream outputStream = Files.newOutputStream(uploadFile.toPath());
			inputStream.transferTo(outputStream);
			if (uploadFile != null) {		
		        reviewImageNames.add(savedName);
			}
		}
		
		try {
			
			// 세션으로 전달받은 userNo, form에서 전달받은 reviewScore, prodcutNo 정수형으로 변환
			int userNo = user.getUserNo();
	     	int reviewScore = Integer.parseInt(reviewScoreStr);
	     	int productNo = Integer.parseInt(productNoStr);
	     	
	        // 현재 날짜 설정
	        Date reviewDate = new Date(System.currentTimeMillis());
	        
	        // reviewScoreText에 입력될 값 판별
	        switch (reviewScore) {
				case 1: 
					reviewScoreText = "너무 싫어요";
					break;
				case 2:
					reviewScoreText = "싫어요";
					break;
				case 3:
					reviewScoreText = "보통이에요";
					break;
				case 4:
					reviewScoreText = "좋아요";
					break;
				case 5:
					reviewScoreText = "아주 좋아요";
					break;	
			}
	        
	        System.out.println(reviewScoreText);
	        
	        // 리뷰 객체 생성
	        Review review = Review.builder()
	        		//.reviewNo(reviewNo)
	                .reviewTitle(reviewTitle)
	                .reviewContent(reviewContent)
	                .reviewScore(reviewScore)
	                .reviewScoreText(reviewScoreText)
	                .reviewDate(reviewDate)
	                .user(User.builder().userNo(userNo).build())
	                .product(Product.builder().productNo(productNo).build())
	                .build();
	    
	        
	        // 리뷰 이미지 리스트 생성
	        
	     	List<ReviewImage> reviewImages = new ArrayList<>();
	     	for(String reviewImageName:reviewImageNames) {
	     		reviewImages.add(new ReviewImage(0, reviewImageName, review));
	     	}

	        // 리뷰 객체에 이미지 리스트 설정
	        review.setReviewImages(reviewImages);
	    
	        // 리뷰 데이터 저장
	        new ReviewService().insertReview(review);
	    
	        // 이후 처리 (성공 메시지, 리다이렉트 등)
	        response.sendRedirect("user_review_list.jsp");
	        
	    } catch(Exception e) {
	        e.printStackTrace(); // 로그 출력
	        System.out.println("잘못된 작성양식입니다: " + e.getMessage()); // 에러 메시지 출력
	        response.sendRedirect("review_write_form.jsp");
	        return;
	    }
		
		
	}

}
