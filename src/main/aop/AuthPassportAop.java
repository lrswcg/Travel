package main.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Component
@Aspect
public class AuthPassportAop {
    @Pointcut("@annotation(main.aop.AuthPassport)")
    public void authInterceptor(){}

    @Before("authInterceptor()")
    public void doBefore(JoinPoint joinPoint){
        HttpServletRequest request= ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

    }
}
