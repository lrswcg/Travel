package main.entity;


import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import main.validator.Gender;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;

import java.util.Date;

/**
 * Created by cnhhdn on 2017/6/12.
 */
@JsonSerialize
public class User {
    private String userId;
    @Email
    @NotBlank
    private String email;
    @NotBlank
    private String nickname;
    @NotBlank
    private String password;
    @Gender(message = "invalid gender")
    private String gender;
    private String avatar;
    private String sign;
    private Date createTime;
    private Date updateTime;

    public User() {
    }

    public User(String userId, String email, String nickname, String password, String gender, String avatar) {
        this.userId = userId;
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.gender = gender;
        this.avatar = avatar;
    }

    public User(String userId, String email, String nickname, String password, String gender, String avatar, String sign, Date createTime, Date updateTime) {
        this.userId = userId;
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.gender = gender;
        this.avatar = avatar;
        this.sign = sign;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        return getUserId() != null ? getUserId().equals(user.getUserId()) : user.getUserId() == null;

    }

    @Override
    public int hashCode() {
        return getUserId() != null ? getUserId().hashCode() : 0;
    }
}
