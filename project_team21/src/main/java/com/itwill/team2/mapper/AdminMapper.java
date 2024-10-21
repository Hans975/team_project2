package com.itwill.team2.mapper;

import java.util.List;

import com.itwill.team2.domain.Admin;

public interface AdminMapper {
	
	int insert (Admin admin) throws Exception;
	
	int update (Admin admin) throws Exception;
	
	int delete (Admin adminNo) throws Exception;
	
	Admin selectByadminId (String admin) throws Exception;
	// List로 반환하도록 수정
   // List<Admin> selectByadminId(String admin) throws Exception;
    
	Admin select(Admin admin) throws Exception;
	
	// 모든 admin 데이터 조회
    List<Admin> selectAll() throws Exception;
	
    public Admin loginAdmin(String adminId, String adminPassword) throws Exception;
    
}
