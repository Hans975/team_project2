package com.itwill.team2.Mybatis;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.AdminDao;
import com.itwill.team2.domain.Admin;
import com.itwill.team2.mapper.AdminMapper;

public class AdminDaoImplMyBatis implements AdminDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public AdminDaoImplMyBatis() throws Exception{
		this.sqlSessionFactory=new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	@Override
    public int insert(Admin admin) throws Exception {
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        int rowCount = sqlSession.getMapper(AdminMapper.class).insert(admin);
        sqlSession.close();
        return rowCount;
    }
	
	 @Override
	    public int update(Admin admin) throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        int rowCount = sqlSession.getMapper(AdminMapper.class).update(admin);
	        sqlSession.close();
	        return rowCount;
	    }

	    @Override
	    public Admin select(Admin admin) throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        Admin result = sqlSession.getMapper(AdminMapper.class).select(admin);
	        sqlSession.close();
	        return result;
	    }
/*
	    public Admin selectByadminId(String adminId) throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        Admin result = sqlSession.getMapper(AdminMapper.class).selectByadminId(adminId);
	        sqlSession.close();
	        return result;
	    }
*/
	    @Override
	    public Admin selectByadminId(String adminId) throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        Admin result = sqlSession.getMapper(AdminMapper.class).selectByadminId(adminId); // List로 변경
	        sqlSession.close();
	        return result;
	    }

	    @Override
	    public List<Admin> selectAll() throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        List<Admin> result = sqlSession.getMapper(AdminMapper.class).selectAll();
	        sqlSession.close();
	        return result;
	    }

	    @Override
	    public int delete(Admin admin) throws Exception {
	        SqlSession sqlSession = sqlSessionFactory.openSession(true);
	        int rowCount = sqlSession.getMapper(AdminMapper.class).delete(admin);
	        sqlSession.close();
	        return rowCount;
	    }
	    
	    @Override
	    public Admin loginAdmin(String adminId, String adminPassword) throws Exception{
	    	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    	Admin loginAdmin = sqlSession.getMapper(AdminMapper.class).loginAdmin(adminId, adminPassword);
	    	sqlSession.close();
	    	return loginAdmin;
	    	
	    }
	    

}
