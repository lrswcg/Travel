package main.service.impl;

import main.dao.UserDao;
import main.entity.User;
import main.service.UserService;
import main.util.FileUtil;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.HttpRequestHandlerServlet;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Service
public class UserServiceImpl implements UserService {

    private final Logger log=LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    @Override
    public int insertUser(User user) {
        if (user==null)
            return 0;
        user.setPassword(encrypt(user.getPassword()));
        return userDao.insertUser(user);
    }

    @Override
    public int updateUser(User user) {
        if (user==null)
            return 0;
        return userDao.updateUser(user.getUserId(),user.getNickname(),user.getAvatar(),user.getSign());
    }


    @Override
    public int updateSign(User user, String sign) {
        if (user==null)
            return 0;
        try{
            if (userDao.updateUser(user.getUserId(),null,null,sign)==1)
                return 1;
            else
                return 0;
        }catch (Exception e){
            log.error(e.getMessage());
            return 0;
        }
    }

    @Override
    public int updateNickname(User user, String nickname) {
        if (user==null)
            return 0;
        try{
            if (userDao.updateUser(user.getUserId(),nickname,null,null)==1)
                return 1;
            else
                return 0;
        }catch (Exception e){
            log.error(e.getMessage());
            return 0;
        }
    }

    @Override
    public int deleteUser(String userId) {
        User user=userDao.getUserById(userId);
        if (user==null)
            return 0;
        return userDao.deleteUser(userId);
    }

    @Override
    public User getUserById(String userId) {
        return userDao.getUserById(userId);
    }

    @Override
    public User getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public User getUserByName(String nickname) {
        return userDao.getUserByName(nickname);
    }

    @Override
    public List<User> getUsers(int offset, int limit) {
        return userDao.getUsers(offset,limit);
    }

    @Override
    public User login(String email, String password) {
        User user=userDao.getUserByEmail(email);
        if (user!=null)
            if (encrypt(password).equals(user.getPassword()))
                return user;
        return null;
    }

    @Override
    public User singIn(User user, MultipartFile avatar) {
        if (userDao.getUserById(user.getUserId())!=null)
            return null;
        String filePath;
        if ("".equals(avatar.getOriginalFilename()))
            filePath="/img/avatar.jpg";
        else {
            HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
            filePath= FileUtil.uploadFile(session,avatar,"avatar");
        }
        user.setPassword(encrypt(user.getPassword()));
        user.setAvatar(filePath);
        user.setSign("个性签名");
        try{
            if (userDao.insertUser(user)==1)
                return user;
            else
                return null;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public int countUser() {
        return userDao.countUser();
    }

    @Override
    public User updateAvatar(User user, MultipartFile avatar) {
        if (userDao.getUserById(user.getUserId())==null)
            return null;
        String filePath;
        if ("".equals(avatar.getOriginalFilename()))
            filePath="";
        else {
            HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
            if (!"".equals(user.getAvatar()))
                FileUtil.deleteFile(session,user.getAvatar());
            filePath= FileUtil.uploadFile(session,avatar,"avatar");
        }
        user.setAvatar(filePath);
        try{
            if (userDao.updateUser(user.getUserId(),null,filePath,null)==1)
                return user;
            else
                return null;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    public String encrypt(String msg){
        if ("".equals(msg))
            return "";
        return DigestUtils.sha1Hex(msg);
    }
}
