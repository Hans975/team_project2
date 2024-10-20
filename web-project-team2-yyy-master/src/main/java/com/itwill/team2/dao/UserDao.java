package com.itwill.team2.dao;

import java.util.List;

import com.itwill.team2.domain.User;

public interface UserDao {
	
	// 회원추가(회원가입)
	int insertUser(User user) throws Exception;
	
	// 회원탈퇴(유저번호기준)
	int deleteByUserNo(int userNo) throws Exception;
		
	// 회원정보 수정
	int updateUser(User user) throws Exception;
	
	// 전체 회원리스트 출력(관리자전용)
	List<User> findUserAll() throws Exception;
	
	User loginUser(String userId, String userPassword) throws Exception;
	
	User findUserByUserNo(int userNo) throws Exception;
	
	// 해당 아이디가 회원테이블에 존재하는지 여부를판별(아이디중복체크)
	int countByUserId(String userId) throws Exception;


	// 아이디 찾기(유저이름,전화번호)
	String findUserId(String userName, String userPhone) throws Exception;
	
	
	// 비밀번호 찾기(유저 아이디,전화번호)
	String findPassword(String userId, String userPhone) throws Exception;

	
	// 회원정보 조회(마이페이지)
	User findUserById(String userId) throws Exception;
}
