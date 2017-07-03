package main.service.impl;

import main.dao.DailyDao;
import main.entity.Daily;
import main.service.DailyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Service
public class DailyServiceImpl implements DailyService {

    @Autowired
    private DailyDao dailyDao;

    @Override
    public int insertDaily(Daily daily) {
        if (daily==null)
            return 0;
        return dailyDao.insertDaily(daily);
    }

    @Override
    public Daily getDailyById(String dailyId) {
        return dailyDao.getDailyById(dailyId);
    }

    @Override
    public List<Daily> getDailyByUserId(String userId, int offset, int limit) {
        return dailyDao.getDailysByUserId(userId,offset,limit);
    }

    @Override
    public int count(String userId) {
        return dailyDao.count(userId);
    }
}
