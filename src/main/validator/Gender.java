package main.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Created by cnhhdn on 2017/6/14.
 */
@Constraint(validatedBy = GenderValidator.class)
@Target({METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
@Documented
public @interface Gender {
    String message() default "{main.validator.Gender}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
