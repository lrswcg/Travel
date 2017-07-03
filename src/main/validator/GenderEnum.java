package main.validator;

/**
 * Created by cnhhdn on 2017/6/14.
 */
public enum GenderEnum {

    MALE("男"),
    FEMALE("女");

    private String gender;

    GenderEnum(String gender) {
        this.gender = gender;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
