<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.itwill.team2.domain.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.ReviewService"%>
<%@include file="login_check.jspf" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리뷰 페이지</title>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	
	<link rel="stylesheet" href="./css/index.css?ver=3">
	<script src="./js/index.js"></script>


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
	
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f9f9f9;
	color: #333;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	max-width: 1200px;
	margin: 0 auto;
	padding: 50px 20px;
	border: 1px solid #ddd;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.menu {
	width: 25%;
	border-right: 1px solid #ddd;
	margin-top: 37px;
	padding-right: 23px;
}

.menu-header {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 20px;
	border-bottom: 2px solid #333;
	padding-bottom: 10px;
	color: #555;
}

.menu a {
	display: block;
	margin-bottom: 15px;
	padding: 15px;
	text-decoration: none;
	color: #333;
	border: 1px solid #ddd;
	text-align: center;
	font-weight: bold;
	background-color: #fff;
	transition: background-color 0.3s, color 0.3s;
}

.menu_user_modify {
	margin-top: 31px;
}

.menu a:hover {
	background-color: #333;
	color: #fff;
}

.main-content {
	width: 75%;
	padding-left: 40px;
	padding-top: 37px;
	background-color: #fdfdfd;
	
}

.review-container {
	max-width: 800px;
	margin: 30px auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.review-header {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
	margin-bottom: 20px;
}

.review-header .stars {
	color: #ffc107;
	margin-right: 15px;
	font-size: 24px;
}

.review-header .title {
	margin-top: 7px;
	font-size: 20px;
	font-weight: bold;
}

.review-content {
	font-size: 16px;
	line-height: 1.5;
	margin-bottom: 20px;
}

.review-images {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-top: 20px;
}

.review-images img {
	max-width: 150px;
	height: auto;
	border: 1px solid #ddd;
}

.review-footer {
	text-align: right;
	font-size: 14px;
	color: #777;
}

    .review-buttons {
        margin-top: 10px;
        text-align: right;
    }
    .edit-btn, .delete-btn {
        padding: 8px 15px;
        margin-left: 5px;
        border: none;
        border-radius: 5px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
    }
    .edit-btn {
        background-color: #333;
        color: #fff;
    }
    .delete-btn {
        background-color: #dc3545;
        color: #fff;
    }
    .edit-btn:hover {
        background-color: #0056b3;
    }
    .delete-btn:hover {
        background-color: #c82333;
    }
</style>
<script>
        function deleteReview(reviewNo) {
            if (confirm('리뷰를 삭제하시겠습니까?')) {
                var form = document.createElement('form');
                form.method = 'post';
                form.action = 'review_remove_action.jsp';
                var reviewNoInput = document.createElement('input');
                reviewNoInput.type = 'hidden';
                reviewNoInput.name = 'reviewNo';
                reviewNoInput.value = reviewNo;
                form.appendChild(reviewNoInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
        function editReview(reviewNo) {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'review_modify_form.jsp';
            var reviewNoInput = document.createElement('input');
            reviewNoInput.type = 'hidden';
            reviewNoInput.name = 'reviewNo';
            reviewNoInput.value = reviewNo;
            form.appendChild(reviewNoInput);
            document.body.appendChild(form);
            form.submit();
        }
        function userRemove() {
            // 확인과 취소 버튼이 있는 확인 창
            var confirmation = confirm('정말 회원탈퇴를 하시겠습니까?');
            
            if (confirmation) {  // 사용자가 확인을 눌렀을 때만 실행
                var form = document.createElement('form');
                form.method = 'post';
                form.action = 'user_remove_action.jsp';
                
                var userNoInput = document.createElement('input');
                userNoInput.type = 'hidden';
                userNoInput.name = 'userNo';
                userNoInput.value = '<%=userNo%>';
                
                form.appendChild(userNoInput);
                document.body.appendChild(form);
                form.submit();
            } else {
                // 사용자가 취소를 눌렀을 때는 아무런 동작도 하지 않음
                alert('회원탈퇴가 취소되었습니다.');
            }
        }
    </script>
    </head>
<body>
	<header>
        <!-- 로고 -->
        <jsp:include page="commonTop.jsp"/>
    </header>
	<div class="container">

		<div class="menu">
			<div class="menu-header"><a href="user_mypage.jsp">마이페이지</a></div>
			<a href="user_modify_form.jsp" class="menu_user_modify">회원정보 수정</a> 
			<a href="user_review_list.jsp" class="menu_user_review">나의 리뷰 관리</a> 
			<a href="#" onclick="userRemove()" class="menu_user_remove">회원탈퇴</a> 
			<a href="user_logout_action.jsp"  class="menu_user_logout">로그아웃</a>
		</div>



		<div class="main-content">
			<div class="menu-header">나의 리뷰 목록</div>
			<%-- 리뷰 목록 표시 시작 --%>
			<%
			ReviewService reviewService = new ReviewService();
			List<Review> reviews = reviewService.findReviewByUserNo(userNo);
			for (Review review : reviews) {
			%>
			<div class="review-container">
				<div class="review-header">
					<div class="stars">
						<%
						for (int i = 0; i < review.getReviewScore(); i++) {
						%>
						&#9733;
						<%
						}
						%>
					</div>
					<div class="title">
						<%=review.getReviewTitle()%>
					</div>
				</div>
				<div class="review-content">
					<%=review.getReviewContent()%>
				</div>
				<div class="review-images">
					<%
					if (review.getReviewImages() != null) {
					%>
					<%
					for (int i = 0; i < review.getReviewImages().size(); i++) {
					%>
					<img
						src="./reviewImage/<%=review.getReviewImages().get(i).getReviewImageName()%>"
						alt="리뷰 이미지">
					<%
					}
					%>
					<%
					}
					%>
				</div>
				<div class="review-footer">
                    작성일자: <%=review.getReviewDate()%>
                    <div class="review-buttons">
                        <button class="edit-btn" onclick="editReview(<%=review.getReviewNo()%>)">수정</button>
                        <button class="delete-btn" onclick="deleteReview(<%=review.getReviewNo()%>)">삭제</button>
                    </div>
                    
                </div>
			</div>
			<%
			}
			%>
			<%-- 리뷰 목록 표시 끝 --%>
		</div>
	</div>
</body>
</html>