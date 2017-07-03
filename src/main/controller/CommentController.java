package main.controller;

import com.sun.org.glassfish.external.statistics.annotations.Reset;
import main.aop.LoginCheck;
import main.dao.CommentDao;
import main.dto.BaseResult;
import main.dto.ListResult;
import main.entity.Comment;
import main.entity.User;
import main.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Controller
@RequestMapping(value = "/comment")
public class CommentController {

    @Autowired
    private CommentService service;

    @LoginCheck
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    @ResponseBody
    public BaseResult<Object> insert(Comment comment, HttpSession session){
        comment.setUser((User) session.getAttribute("user"));
        if (service.insert(comment)==0)
            return new BaseResult<>("FAIL","添加失败");
        else
            return new BaseResult<>("SUCCESS","添加成功");
    }

    @LoginCheck
    @RequestMapping(value = "/nid/{noteId}/p/{page}",method = RequestMethod.GET)
    @ResponseBody
    public ListResult<Comment> getDailyByUserId(@PathVariable("noteId")String noteId, @PathVariable("page")Integer page){
        if (page!=null&&page>0){
            int limit=12;
            int total=service.count(noteId);
            int offset=(page-1)*limit;
            int next=page+1;
            if (offset>=total){
                return new ListResult<>("FAIL","没有更多内容");
            }
            List<Comment> list=service.list(noteId,offset,limit);
            if(list==null)
                return new ListResult<>("FAIL","未知错误");
            ListResult<Comment> result=new ListResult<>("SUCCESS",list);
            result.setNext(next);
            return result;
        }else
            return new ListResult<>("FAIL","page不大于0");
    }
}
