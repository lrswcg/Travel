package main.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by cnhhdn on 2017/6/14.
 */
public class GenderValidator implements ConstraintValidator<Gender,String> {
    @Override
    public void initialize(Gender gender) {
    }

    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if (s.equals(GenderEnum.MALE.getGender())||s.equals(GenderEnum.FEMALE.getGender()))
            return true;
        return false;
    }
}
