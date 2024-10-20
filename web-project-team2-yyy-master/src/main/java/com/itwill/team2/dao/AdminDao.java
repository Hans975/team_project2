package com.itwill.team2.dao;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.domain.Admin;

public interface AdminDao {

	int insert(Admin admin) throws Exception;
	
	int update(Admin admin) throws Exception;

	int delete (Admin admin) throws Exception;
	
	Admin select (Admin admin) throws Exception;
	
	Admin selectByadminId (String admin) throws Exception;
	//List<Admin> selectByadminId(String adminId) throws Exception; // 수정: 여러 행이 반환되도록 List로 수정
	
	// 모든 admin 데이터 조회
    List<Admin> selectAll() throws Exception;
    
    Admin loginAdmin(String adminId, String password) throws Exception;
}
