import main.dao.TripNoteDao;
import main.entity.TripNote;
import main.service.TripNoteService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by cnhhdn on 2017/6/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring-*xml")
public class NoteDaoTest {
    private final Logger log= LoggerFactory.getLogger(NoteDaoTest.class);

    @Autowired
    TripNoteService service;

    @Test
    public void list(){
        List<TripNote> list=service.list("xYnF481qKNX",0,10);
        log.info(list.size()+"");
        for (TripNote note:list) {
            log.info(note.toString());
        }
    }
}
