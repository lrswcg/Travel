package main.aop;

import java.lang.annotation.*;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Documented
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
    Auth[] value();
}
