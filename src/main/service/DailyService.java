package main.service;

import main.entity.Daily;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public interface DailyService {
    int insertDaily(Daily daily);
    Daily getDailyById(String dailyId);
    List<Daily> getDailyByUserId(String userId,int offset,int limit);
    int count(String userId);
}
