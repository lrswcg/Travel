package main.dao;

import main.entity.TripNote;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Repository
public interface TripNoteDao {
    int insert(TripNote tripNote);
    int update(TripNote tripNote);
    int delete(String id);
    TripNote getById(String id);
    List<TripNote> list(@Param("userId") String userId,@Param("location") String location,@Param("offset") Integer offset, @Param("limit") Integer limit);
    List<String> location(String userId);
    int count(@Param("userId") String userId);
}
