package main.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.hibernate.validator.constraints.NotBlank;

import java.util.Date;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@JsonSerialize
public class TripNote {
    @NotBlank
    private String noteId;
    private User user;
    private String title;
    private String cover;
    @NotBlank
    private String location;
    @NotBlank
    private String content;
    private Date createTime;
    private Date updateTime;

    public TripNote() {
    }

    public TripNote(String noteId, User user, String title, String cover, String location, String content) {
        this.noteId = noteId;
        this.user = user;
        this.title = title;
        this.cover = cover;
        this.location = location;
        this.content = content;
    }

    public TripNote(String noteId, User user, String title, String cover, String location, String content, Date createTime, Date updateTime) {
        this.noteId = noteId;
        this.user = user;
        this.title = title;
        this.cover = cover;
        this.location = location;
        this.content = content;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getNoteId() {
        return noteId;
    }

    public void setNoteId(String noteId) {
        this.noteId = noteId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    @Override
    public String toString() {
        return "TripNote{" +
                "noteId='" + noteId + '\'' +
                ", user=" + user +
                ", title='" + title + '\'' +
                ", cover='" + cover + '\'' +
                ", location='" + location + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
