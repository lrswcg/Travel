package main.aop;

import main.entity.User;
import main.exception.CustomException;
import main.exception.LoginException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;

/**
 * Created by cnhhdn on 2017/6/19.
 */
@Component
@Aspect
public class LoginAop {
    private final Logger log= LoggerFactory.getLogger(LoginAop.class);

    @Around("execution(* main.controller.*.*(..)) && @annotation(check)")
    public Object doAround(ProceedingJoinPoint joinPoint,LoginCheck check) throws Throwable {
        HttpServletRequest request= ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpServletResponse response = null;
        for (Object param : joinPoint.getArgs()) {
            if (param instanceof HttpServletResponse) {
                response = (HttpServletResponse) param;
            }
        }
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        String url=request.getRequestURI();
        String ip=request.getRemoteAddr();
        log.info("Request From "+ip+": "+url);
        if (user==null){
            log.info("Access Denied");
            throw new LoginException("Access Denied");
        }else {
            log.info("Request Success");
            return joinPoint.proceed();
        }
    }
}
