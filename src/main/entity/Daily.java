package main.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@JsonSerialize
public class Daily {
    @NotBlank
    private String dailyId;
    @NotBlank
    private String userId;
    @NotBlank
    @Length(min = 1,max = 100)
    private String content;
    private Date createTime;
    private Date updateTime;

    public Daily() {
    }

    public Daily(String dailyId, String userId, String content) {
        this.dailyId = dailyId;
        this.userId = userId;
        this.content = content;
    }

    public Daily(String dailyId, String userId, String content, Date createTime, Date updateTime) {
        this.dailyId = dailyId;
        this.userId = userId;
        this.content = content;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getDailyId() {
        return dailyId;
    }

    public void setDailyId(String dailyId) {
        this.dailyId = dailyId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
}
