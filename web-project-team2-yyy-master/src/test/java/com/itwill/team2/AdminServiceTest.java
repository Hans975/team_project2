package com.itwill.team2;

import java.util.List;

import com.itwill.team2.domain.Admin;
import com.itwill.team2.service.AdminService;

public class AdminServiceTest {
	
	public static void main(String[] args) throws Exception{
		AdminService adminService=new AdminService();
		/*---insert
		Admin admin= Admin.builder()
				.adminId("admin")
				.password("1234")
				.name("admin")
				.build();
		*/
//		System.out.println(admin);
		//int result=adminService.create(admin);
	//	System.out.println(result);

		/*		---update
		Admin admin2=
				Admin.builder()
				.adminId("admin")
				.password("1111")
				.build();
		adminService.update(admin2);*/

		/*	---select
		List<Admin> adminList = adminService.selectAll();
        for (Admin admin : adminList) {
            System.out.println(admin);
        }
==>수정必		Admin admin3=adminService.selectByadminId("admin");
==>수정必		System.out.println(admin3);

		--- seletByadminId
		List<Admin> adminList = adminService.selectByadminId("admin");
		for (Admin admin : adminList) {
		    System.out.println(admin);
		}
		 */
		
		Admin admin=new Admin();
		admin.setAdminId("admin5");
		adminService.delete(admin);
		
		
		
		
		
		
	}

}
