package main.aop;

import main.exception.CustomException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;

/**
 * Created by cnhhdn on 2017/6/14.
 */
@Aspect
@Component
public class ValidatorAop {

    private final Logger log= LoggerFactory.getLogger(ValidatorAop.class);

    @Around("execution(* main.controller.*.*(..))&&args(..,bindingResult)")
    public Object doAround(ProceedingJoinPoint joinPoint, BindingResult bindingResult) throws Throwable {
        if (bindingResult.hasErrors()){
            String errorInfo="["+bindingResult.getFieldError().getField()+"]"+bindingResult.getFieldError().getDefaultMessage();
            log.error(errorInfo);
            throw new CustomException(errorInfo);
        }else{
            return joinPoint.proceed();
        }
    }
}
