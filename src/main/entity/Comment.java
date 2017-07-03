package main.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@JsonSerialize
public class Comment {
    private String id;
    private User user;
    private String noteId;
    private String content;
    private Date createTime;
    private Date updateTime;

    public Comment() {
    }

    public Comment(String id, User user, String noteId, String content) {
        this.id = id;
        this.user = user;
        this.noteId = noteId;
        this.content = content;
    }

    public Comment(String id, User user, String noteId, String content, Date createTime, Date updateTime) {
        this.id = id;
        this.user = user;
        this.noteId = noteId;
        this.content = content;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getNoteId() {
        return noteId;
    }

    public void setNoteId(String noteId) {
        this.noteId = noteId;
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
        return "Comment{" +
                "id='" + id + '\'' +
                ", user=" + user.toString() +
                ", noteId='" + noteId + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}
