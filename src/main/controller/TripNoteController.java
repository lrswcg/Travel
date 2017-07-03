package main.controller;

import main.aop.LoginCheck;
import main.dto.ListResult;
import main.entity.Comment;
import main.entity.TripNote;
import main.entity.User;
import main.exception.CustomException;
import main.service.CommentService;
import main.service.TripNoteService;
import main.service.UserService;
import main.util.FileUtil;
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
import java.io.File;
import java.util.*;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Controller
@RequestMapping("/note")
public class TripNoteController {

    private final Logger log= LoggerFactory.getLogger(TripNoteController.class);

    @Autowired
    private TripNoteService service;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @LoginCheck
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insert( ModelMap model, HttpSession session, @Valid TripNote note, BindingResult bindingResult){
        note.setUser((User)session.getAttribute("user"));
        String path = session.getServletContext().getRealPath("/upload/note/"+note.getNoteId()+"/");
        FileUtil.imgMatch(note.getContent(),path,note.getNoteId());
        if(service.insert(note)==0){
            model.addAttribute("error","发布失败");
            return "addNote";
        }
        model.addAttribute("note",note);
        return "redirect:/user";
    }

    @LoginCheck
    @RequestMapping(value = "/insert",method = RequestMethod.GET)
    public String insert(ModelMap model){
        return "addNote";
    }

    @RequestMapping(value = "/nid/{id}",method = RequestMethod.GET)
    public String getById(@PathVariable("id") String id, ModelMap model, HttpServletRequest request){
        TripNote note=service.getById(id);
        if (note==null){
            throw new CustomException("游记不存在");
        }
        List<Comment> commentList=commentService.list(id,0,12);
        model.addAttribute("note",note);
        model.addAttribute("cList",commentList);
        return "notePage";
    }

    @RequestMapping(value = "/uid/{userId}/p/{page}",method = RequestMethod.GET)
    @ResponseBody
    public ListResult<TripNote> getNoteByUserId(@PathVariable("userId")String userId, @PathVariable("page")Integer page){
        if (userService.getUserById(userId)==null){
            return new ListResult<>("FAIL","用户不存在");
        }
        if (page!=null&&page>0){
            int limit=12;
            int total=service.count(userId);
            int offset=(page-1)*limit;
            int next=page+1;
            if (offset>=total){
                return new ListResult<>("FAIL","没有更多内容");
            }
            List<TripNote> list=service.list(userId,offset,limit);
            if(list==null)
                return new ListResult<>("FAIL","未知错误");
            ListResult<TripNote> result=new ListResult<>("SUCCESS",list);
            result.setNext(next);
            return result;
        }else
            return new ListResult<>("FAIL","page不大于0");
    }

    @RequestMapping(value = "/list/p/{page}",method = RequestMethod.GET)
    @ResponseBody
    public ListResult<TripNote> list(@PathVariable("page")Integer page){
        if (page!=null&&page>0){
            int limit=12;
            int total=service.count();
            int offset=(page-1)*limit;
            int next=page+1;
            if (offset>=total){
                return new ListResult<>("FAIL","没有更多内容");
            }
            List<TripNote> list=service.list(offset,limit);
            if(list==null)
                return new ListResult<>("FAIL","未知错误");
            ListResult<TripNote> result=new ListResult<>("SUCCESS",list);
            result.setNext(next);
            return result;
        }else
            return new ListResult<>("FAIL","page不大于0");
    }

    @LoginCheck
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> uploadImage(MultipartFile image,String noteId,HttpSession session){
        String path=FileUtil.uploadFile(session,image,"/upload/note/"+noteId+"/","content");
        Map<String,String> map=new HashMap<>();
        if ("".equals(path)){
            map.put("message","FAIL");
            map.put("error","上传失败");
        }else {
            map.put("message","SUCCESS");
            map.put("data",path);
        }
        return map;
    }
    @LoginCheck
    @RequestMapping(value = "/cover",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> uploadCover(MultipartFile image,String noteId,HttpSession session){
        String path=FileUtil.uploadFile(session,image,"/upload/note/"+noteId+"/","cover");
        Map<String,String> map=new HashMap<>();
        if ("".equals(path)){
            map.put("message","FAIL");
            map.put("error","上传失败");
        }else {
            map.put("message","SUCCESS");
            map.put("data",path);
        }
        return map;
    }

    @RequestMapping(value = "/uid/{userId}/l/{location}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getImageByLocation(@PathVariable String userId,@PathVariable String location,HttpSession session){
        List<TripNote> list=service.list(userId,location);
        Map<String,Object> map=new HashMap<>();
        if(list==null||list.size()<=0){
            map.put("message","FAIL");
            map.put("error","请求失败");
        }else{
            List<String> retList=new ArrayList<>();
            for (int i=0;i<list.size();i++){
                TripNote note=list.get(i);
                String path=session.getServletContext().getRealPath("/upload/note/"+note.getNoteId()+"/");
                File dic=new File(path);
                if (dic.exists()&&dic.isDirectory()){
                    String[] filename=dic.list();
                    String[] url=new String[filename.length-1];
                    int count=0;
                    for (int j = 0; j < filename.length; j++) {
                        if (!filename[j].contains("cover")){
                            url[count]="/upload/note/"+note.getNoteId()+"/"+filename[j];
                            count++;
                        }
                    }
                    retList.addAll(Arrays.asList(url));
                }else
                    throw new CustomException("error");
            }
            map.put("message","SUCCESS");
            map.put("data",retList);
        }
        return map;
    }

}
