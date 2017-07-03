package main.controller;

import com.sun.deploy.net.URLEncoder;
import main.aop.LoginCheck;
import main.dto.ListResult;
import main.entity.Daily;
import main.entity.User;
import main.dto.BaseResult;
import main.exception.CustomException;
import main.service.DailyService;
import main.service.UserService;
import main.util.FileUtil;
import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.validator.constraints.Length;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Controller
public class DailyController {

    private final Logger log= LoggerFactory.getLogger(DailyController.class);

    @Autowired
    private DailyService dailyService;

    @Autowired
    private UserService userService;

    @LoginCheck
    @RequestMapping(value = "/daily/insert",method = RequestMethod.POST,produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public BaseResult<Daily> insertDaily(String userId, String content) throws IOException {
        if (content.length()>100)
            return new BaseResult<>("FAIL","评论过长");
        Daily daily=new Daily("D"+RandomStringUtils.random(11,true,true),userId,content) ;
        if (dailyService.insertDaily(daily)==1){
            return new BaseResult<>("SUCCESS",daily);
        }else
            return new BaseResult<>("FAIL","发布评论失败");
    }

    @RequestMapping(value = "/daily/uid/{userId}/p/{page}",method = RequestMethod.GET)
    @ResponseBody
    public ListResult<Daily> getDailyByUserId(@PathVariable("userId")String userId, @PathVariable("page")Integer page){
        if (userService.getUserById(userId)==null){
            return new ListResult<>("FAIL","用户不存在");
        }
        if (page!=null&&page>0){
            int limit=12;
            int total=dailyService.count(userId);
            int offset=(page-1)*limit;
            int next=page+1;
            if (offset>=total){
                return new ListResult<>("FAIL","没有更多内容");
            }
            List<Daily> list=dailyService.getDailyByUserId(userId,offset,limit);
            if(list==null)
                return new ListResult<>("FAIL","未知错误");
            ListResult<Daily> result=new ListResult<>("SUCCESS",list);
            result.setNext(next);
            return result;
        }else
            return new ListResult<>("FAIL","page不大于0");
    }


    @RequestMapping("/ueditor/index")
    public String ueditor(){
        return "ueditor";
    }

    @RequestMapping(value = "/trip/upload",produces = { "application/json;charset=UTF-8" })
    @ResponseBody
    public Map<String,String> uploadImage(@RequestParam(value = "upfile",required = false) MultipartFile upfile, String action,
                                          String notesId, HttpSession session, HttpServletRequest request){
        log.info(request.getRequestURI());
        String path=FileUtil.uploadFile(session,upfile,notesId);
        if (!"".equals(path)){
            String fileName=path.substring(path.lastIndexOf('/'));
            Map<String,String> result=new HashMap<>();
            result.put("state","SUCCESS");
            result.put("title",fileName);
            result.put("original",upfile.getOriginalFilename());
            result.put("type",fileName.substring(fileName.lastIndexOf(".")));
            result.put("url",path);
            return result;
        }
        return null;
    }
}
