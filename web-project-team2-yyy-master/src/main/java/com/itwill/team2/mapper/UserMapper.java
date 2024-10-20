package com.itwill.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itwill.team2.domain.User;

public interface UserMapper {

   public int insertUser(User user) throws Exception;
   
   public int updateUser(User user) throws Exception;
   
   public int deleteByUserNo(int userNo) throws Exception;
   
   public User findUserByUserNo(int userNo);

   public List<User> findUserAll();
   
   public User loginUser(@Param("userId") String userId, @Param("userPassword") String userPassword) throws Exception;
   
   public int countByUserId(String userId) throws Exception; 
   
   //select 아이디찾기
   public String findUserId(@Param("userName")String userName, @Param("userPhone")String userPhone) throws Exception;
   
   //비밀번호 찾기
   public String findPassword(@Param("userId")String userId, @Param("userPhone")String userPhone) throws Exception;
   
   public User findUserById(String userId) throws Exception;
   
}

