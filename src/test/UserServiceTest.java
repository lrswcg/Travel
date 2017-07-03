import main.entity.User;
import main.service.UserService;
import main.util.FileUtil;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by cnhhdn on 2017/6/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(value = "classpath:spring/spring-*.xml")
public class UserServiceTest {
    private final Logger log= LoggerFactory.getLogger(UserServiceTest.class);

    @Autowired
    UserService userService;


    @Test
    public void deleteTest(){
        userService.deleteUser("1234567123");
    }

    @Test
    public void deleteFile(){
        String path="/upload/avatar/avatar1497428359103";
        System.out.println();

    }
}
