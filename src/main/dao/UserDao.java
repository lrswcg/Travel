package main.dao;

import main.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/12.
 */
@Repository
public interface UserDao {
    int insertUser(User user);
    int updateUser(@Param("userId") String userId,@Param("nickname") String nickname,@Param("avatar") String avatar,@Param("sign") String sign);
    int deleteUser(String userId);
    int countUser();
    User getUserById(String userId);
    User getUserByEmail(String email);
    User getUserByName(String nickname);
    List<User> getUsers(@Param("offset") Integer offset, @Param("limit") Integer limit);
}
