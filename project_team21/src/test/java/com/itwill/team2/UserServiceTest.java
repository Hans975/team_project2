package com.itwill.team2;

import java.util.List;

import com.itwill.team2.domain.User;
import com.itwill.team2.service.UserService;

public class UserServiceTest {

   public static void main(String[] args) throws Exception{
      UserService userService = new UserService();
      User user = new User();
      //유저 전체출력
      //리스트로 하니까 힙스페이스 없다고 빠꾸...?(읽어오는건되면서 출력을 못함) 해결완
      /*
       * List<User> users = userService.findAllUser(); for (User user2 : users) {
       * System.out.println(user2); }
       */
      
      //유저삭제 구현완
      /*
       * int userRemove = userService.remove(1);
       * System.out.println("유저삭제 수"+userRemove);
       * 
       * 
       * boolean duplicate = userService.isDuplicateId("user2"); //유저아이디 중복검사 구현완
       * System.out.println(duplicate);
       * 
       * int userUpdate = userService.update(new User(4,"test", "test", "test",
       * "test", "test", "test", null)); System.out.println(userUpdate); //유저 업데이트 구현완
       */
      //유저를 못읽어옴 결과가 null (로그인 구현하니 자동으로 구현완)
      //User userfind = userService.findUser("user2");
      //System.out.println(userfind);
      System.out.println(userService.findUserByUserNo(3));
      //아이디 불일치, 패스워드 불일치 둘다 구현완
      //User loginUser = userService.login("user2", "eee");
      //System.out.println(loginUser);
      
      /*//유저 생성 구현완
       * User newUser = new User(0,"test1", "test1", "test1", "test1", "test1",
       * "test1", null); int createUser = userService.create(newUser);
       * System.out.println(createUser);
       */
      
      
   }

}