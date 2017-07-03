package main.service;

import main.entity.TripNote;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public interface TripNoteService {
    int insert(TripNote tripNote);
    int update(TripNote tripNote);
    int delete(String id);
    TripNote getById(String id);
    List<TripNote> list();
    List<TripNote> list(String userId);
    List<TripNote> list(String userId,String location);
    List<TripNote> list(int offset, int limit);
    List<TripNote> list(String userId,int offset,  int limit);
    List<TripNote> list(String userId,String location,int offset,int limit);
    int count();
    int count(String userId);
    List<String> location(String userId);
}
