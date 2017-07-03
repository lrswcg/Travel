package main.dao;

import main.entity.Daily;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Repository
public interface DailyDao {
    int insertDaily(Daily daily);
    Daily getDailyById(String dailyId);
    List<Daily> getDailysByUserId(@Param("userId") String UserId, @Param("offset") Integer offset, @Param("limit") Integer limit);
    int count(String userId);
}
