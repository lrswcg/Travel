package main.service.impl;

import main.dao.CommentDao;
import main.entity.Comment;
import main.service.CommentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao dao;

    @Override
    public int insert(Comment comment) {
        if (comment!=null)
            return dao.insert(comment);
        return 0;
    }

    @Override
    public int update(Comment comment) {
        if (comment!=null)
            return dao.update(comment);
        return 0;
    }

    @Override
    public int delete(String id) {
        Comment comment=dao.getById(id);
        if (comment!=null)
            return dao.delete(id);
        return 0;
    }

    @Override
    public List<Comment> list() {
        return dao.list(null,null,null);
    }

    @Override
    public List<Comment> list(String noteId, Integer offset, Integer limit) {
        return dao.list(noteId, offset, limit);
    }

    @Override
    public int count(String noteId) {
        return dao.count(noteId);
    }
}
