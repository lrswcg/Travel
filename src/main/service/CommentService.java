package main.service;

import main.entity.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public interface CommentService {
    int insert(Comment comment);
    int update(Comment comment);
    int delete(String id);
    List<Comment> list();
    List<Comment> list(String noteId, Integer offset, Integer limit);
    int count(String noteId);
}
