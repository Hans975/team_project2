package com.itwill.team2.service;

import java.util.List;

import com.itwill.team2.Mybatis.UserDaoImplMyBatis;
import com.itwill.team2.dao.UserDao;
import com.itwill.team2.domain.User;
import com.itwill.team2.service.userException.ExistedUserException;
import com.itwill.team2.service.userException.PasswordMismatchException;
import com.itwill.team2.service.userException.UserNotFoundException;

public class UserService {
   private UserDao userDao;
   
   public UserService() throws Exception{
      userDao= new UserDaoImplMyBatis();
   }
   
   /*
    * 회원가입
    */
   public int create(User user) throws Exception {
      // 1.아이디중복체크
      if (userDao.countByUserId(user.getUserId())>0) {
         throw new ExistedUserException(user.getUserId() + " 는 이미존재하는 아이디입니다.");
      }
      return userDao.insertUser(user);

   }
   
   public User login(String userId, String password) throws Exception {
      // 1.아이디존재여부
      System.out.println("Attempting to login with userId: " + userId + " and password: " + password);
      User user = userDao.findUserById(userId); // 아이디로 사용자 찾기
      if (user == null) {
         throw new UserNotFoundException(userId + " 는 존재하지않는 아이디 입니다.");
      }
      // 2.패쓰워드일치여부
      if (!user.isMatchPassword(password)) {
         throw new PasswordMismatchException("패쓰워드가 일치하지않습니다.");
      }
      System.out.println("로그인 성공");
      return user;
   }
   /*
    * 회원상세보기
    */
   public User findUser(String userId)throws Exception{
      return userDao.findUserById(userId);
   }
   /*
    * 회원수정
    */
   public int update(User user)throws Exception{
      return userDao.updateUser(user);
   }
   
   /*
    * 회원탈퇴
    */
   public int remove(int userNo)throws Exception{
      return userDao.deleteByUserNo(userNo);
   }
   public boolean isDuplicateId(String userId) throws Exception {
      int count=userDao.countByUserId(userId);
      boolean isExist = false;
      if(count>0) {
         isExist=true;
      }
      return isExist;
   }
   public List<User> findAllUser() throws Exception{
      return userDao.findUserAll();
   }
   public String findUserId(String userName, String userPhone) throws Exception {
      String userId = userDao.findUserId(userName, userPhone);
      return userId;
   }
   public String findPassword(String userId, String userPhone) throws Exception {
      String password = userDao.findPassword(userId, userPhone);
      return password;
   }
   public User findUserByUserNo(int userNo) throws Exception{
      User user = userDao.findUserByUserNo(userNo);
      return user;
   }
   
   
}