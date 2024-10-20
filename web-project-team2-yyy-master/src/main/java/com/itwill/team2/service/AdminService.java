package com.itwill.team2.service;

import java.util.List;

import com.itwill.team2.Mybatis.AdminDaoImplMyBatis;
//import com.itwill.team2.Mybatis.AdminDaoImplMyBatis;
import com.itwill.team2.dao.AdminDao;
import com.itwill.team2.domain.Admin;
import com.itwill.team2.service.userException.PasswordMismatchException;
import com.itwill.team2.service.userException.UserNotFoundException;

public class AdminService {
	
	private AdminDao adminDao;
	
	public AdminService() throws Exception{
		
		adminDao=new AdminDaoImplMyBatis();
		
	}
	
	public int create(Admin admin) throws Exception{
		
		return adminDao.insert(admin);
		
	}
	
	public Admin loginAdmin(String adminId, String password) throws Exception{
			System.out.println("login with adminId : "+adminId + "and password : "+ password);
			Admin admin = adminDao.selectByadminId(adminId);
			if(admin == null) {
				throw new UserNotFoundException(adminId + " 는 존재하지않는 아이디 입니다.");
			}
			if(!admin.isMatchPassword(password)) {
				throw new PasswordMismatchException("패쓰워드가 일치하지않습니다.");
			}
			System.out.println("관리자 로그인 성공");
		return admin;
	}

	public Admin select(Admin adminId) throws Exception{
		
		return adminDao.select(adminId);
	}
	
	// 모든 admin 데이터 조회
    public List<Admin> selectAll() throws Exception {
        return adminDao.selectAll();
    }
	/*
	public Admin selectByadminId(String adminNo) throws Exception{
		
		return adminDao.selectByadminId(adminNo);
	}
	*/
    public Admin selectByadminId(String adminId) throws Exception {
        return adminDao.selectByadminId(adminId); // List<Admin> 반환
    }
    
	public int update(Admin admin) throws Exception{
		
		return adminDao.update(admin);
	}
	/*
	public int delete(String adminId) throws Exception{
		Admin admin=new Admin();
		admin.setAdminId(adminId);
		return adminDao.delete(admin);
	}*/
	public int delete(Admin admin) throws Exception {
	    return adminDao.delete(admin);
	}
	
}
