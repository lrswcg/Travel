package main.aop;

import java.lang.annotation.*;

/**
 * Created by cnhhdn on 2017/6/19.
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface LoginCheck {
    boolean value() default true;
}
