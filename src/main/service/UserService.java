package main.service;

import main.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public interface UserService {
    int insertUser(User user);
    int updateUser(User user);
    User updateAvatar(User user,MultipartFile avatar);
    int updateSign(User user,String sign);
    int updateNickname(User user,String nickname);
    int deleteUser(String userId);
    User getUserById(String userId);
    User getUserByEmail(String email);
    User getUserByName(String nickname);
    List<User> getUsers(int offset,int limit);
    User login(String userId,String password);
    User singIn(User user, MultipartFile avatar);
    int countUser();
}
