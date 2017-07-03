package main.service.impl;

import main.dao.TripNoteDao;
import main.entity.TripNote;
import main.service.TripNoteService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Service
public class TripNoteServiceImpl implements TripNoteService {

    @Autowired
    private TripNoteDao dao;

    @Override
    public int insert(TripNote tripNote) {
        if (tripNote==null)
            return 0;
        return dao.insert(tripNote);
    }

    @Override
    public int update(TripNote tripNote) {
        if (tripNote==null)
            return 0;
        return dao.update(tripNote);
    }

    @Override
    public int delete(String id) {
        TripNote note=dao.getById(id);
        if (note==null)
            return 0;
        return dao.delete(id);
    }

    @Override
    public TripNote getById(String id) {
        return dao.getById(id);
    }

    @Override
    public List<TripNote> list() {
        return dao.list(null,null,null,null);
    }

    @Override
    public List<TripNote> list(String userId) {
        return dao.list(userId,null,null,null);
    }

    @Override
    public List<TripNote> list(String userId, String location) {
        return dao.list(userId, location,null,null);
    }

    @Override
    public List<TripNote> list( int offset,  int limit) {
        return dao.list(null,null,offset,limit);
    }

    @Override
    public List<TripNote> list(String userId,  int offset,  int limit) {
        return dao.list(userId, null,offset, limit);
    }

    @Override
    public List<TripNote> list(String userId, String location,  int offset,  int limit) {
        return dao.list(userId,location,offset,limit);
    }

    @Override
    public int count() {
        return dao.count(null);
    }

    @Override
    public int count(String userId) {
        return dao.count(userId);
    }

    @Override
    public List<String> location(String userId) {
        return dao.location(userId);
    }
}
