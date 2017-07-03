package main.dao;

import main.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Repository
public interface CommentDao {
    int insert(Comment comment);
    int update(Comment comment);
    int delete(String id);
    Comment getById(String id);
    List<Comment> list(@Param("noteId") String noteId, @Param("offset") Integer offset,@Param("limit") Integer limit);
    int count(String noteId);
}
