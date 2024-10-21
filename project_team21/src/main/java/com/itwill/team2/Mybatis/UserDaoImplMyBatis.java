package com.itwill.team2.Mybatis;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.team2.dao.UserDao;
import com.itwill.team2.domain.User;
import com.itwill.team2.mapper.UserMapper;

public class UserDaoImplMyBatis implements UserDao{
   
   private SqlSessionFactory sqlSessionFactory;
   
   public UserDaoImplMyBatis() throws Exception{
      this.sqlSessionFactory = new SqlSessionFactoryBuilder()
            .build(Resources.getResourceAsStream("mybatis-config.xml"));
            
   }
   public User loginUser(String userId, String userPassword) throws Exception{
	   SqlSession sqlSession= sqlSessionFactory.openSession(true);
	      User loginuser = 
	            sqlSession.getMapper(UserMapper.class).loginUser(userId, userPassword);
	      return loginuser;
   }
   @Override
   public int updateUser(User user) throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : update() 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      int rowCount = sqlSession.getMapper(UserMapper.class).updateUser(user);
      sqlSession.close();
      return rowCount;
   }

   @Override
   public User findUserByUserNo(int userNo) throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : findUserList 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      User user=
            sqlSession.getMapper(UserMapper.class).findUserByUserNo(userNo);
      sqlSession.close();
      return user;
   }
   

   @Override
   public List<User> findUserAll() throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : findUserList 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      List<User> userList=
            sqlSession.getMapper(UserMapper.class).findUserAll();
      sqlSession.close();
      return userList;
   }

   @Override
   public int insertUser(User user) throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : insert() 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      int rowCount = 
            sqlSession.getMapper(UserMapper.class).insertUser(user);
      sqlSession.close();
      return rowCount;
   }

   @Override
   public int deleteByUserNo(int userNo) throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : delete() 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      int rowCount=
            sqlSession.getMapper(UserMapper.class).deleteByUserNo(userNo);
      sqlSession.close();
      return rowCount;
   }

   @Override
   public int countByUserId(String userId) throws Exception {
      //System.out.println("#### UserDaoImplMyBatis : countByUserId 호출  ");
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      int rowCount=
            sqlSession.getMapper(UserMapper.class).countByUserId(userId);
      sqlSession.close();
      return rowCount;
   }

   @Override
   public String findUserId(String userName, String userPhone) throws Exception {
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      String userid = 
            sqlSession.getMapper(UserMapper.class).findUserId(userName, userPhone);
      return userid;
   }

   @Override
   public String findPassword(String userId, String userPhone) throws Exception {
      SqlSession sqlSession= sqlSessionFactory.openSession(true);
      String userpassword = 
            sqlSession.getMapper(UserMapper.class).findPassword(userId, userPhone);
      return userpassword;
   }

   @Override
   public User findUserById(String userId) throws Exception {
	   SqlSession sqlSession= sqlSessionFactory.openSession(true);
	      User founduser = 
	            sqlSession.getMapper(UserMapper.class).findUserById(userId);
	      return founduser;
   }
   
   
   
}

