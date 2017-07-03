package main.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.sun.deploy.net.URLEncoder;
import main.aop.LoginCheck;
import main.entity.Daily;
import main.entity.TripNote;
import main.entity.User;
import main.exception.CustomException;
import main.service.DailyService;
import main.service.TripNoteService;
import main.service.UserService;
import main.util.FileUtil;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cnhhdn on 2017/6/13.
 */
@Controller
public class UserController {

    private final Logger log= LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private TripNoteService noteService;

    @Autowired
    private DailyService dailyService;

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String indexPage(ModelMap model){
        List<TripNote> list=noteService.list(0,12);
        model.addAttribute("list",list);
        return "index";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String loginPage(@RequestParam(required = false) String redirectUrl, ModelMap model,HttpSession session){
        if (session.getAttribute("user")!=null)
            return "redirect:/";
        if (!"".equals(redirectUrl))
            model.addAttribute("redirectUrl",redirectUrl);
        return "login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String email,String password,@RequestParam(required = false)String redirectUrl,
                        @RequestParam(required = false)String error, ModelMap model,HttpSession session){
        if (session.getAttribute("user")!=null)
            return "redirect:/";
        User user=userService.login(email,password);
        if (user==null){
            model.addAttribute("error","用户名或密码错误");
            model.addAttribute("redirectUrl",redirectUrl);
            return "login";
        }
        session.setAttribute("user",user);
        if (!"".equals(redirectUrl))
            return "redirect:"+redirectUrl;
        return "redirect:/user";
    }

    @LoginCheck
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        if (session.getAttribute("user")!=null)
            session.setAttribute("user",null);
        return "redirect:/";
    }


    @RequestMapping(value = "/signIn",method = RequestMethod.POST)
    public String signIn(@RequestParam(name = "file",required = false) MultipartFile file, ModelMap model, HttpSession session, @Valid User user, BindingResult bindingResult){
        user.setUserId("U"+RandomStringUtils.random(11,true,true));
        user=userService.singIn(user,file);
        if (user==null){
            model.addAttribute("error","邮箱已存在");
            return "signIn";
        }
        session.setAttribute("user",user);
        return "redirect:/user";
    }

    @RequestMapping(value = "/signIn",method = RequestMethod.GET)
    public String signInPage(){
        return "signIn";
    }

    @RequestMapping(value = "/user/uid/{userId}",method = RequestMethod.GET)
    public String userPage(@PathVariable String userId, ModelMap model,HttpSession session){
        User user=userService.getUserById(userId);
        if (user==null)
            throw new CustomException("用户不存在");
        User loginUser= (User) session.getAttribute("user");
        if (loginUser!=null&&loginUser.getUserId().equals(userId)){
            return "redirect:/user";
        }
        List<Daily> dList=dailyService.getDailyByUserId(userId,0,12);
        List<TripNote> nList=noteService.list(userId,0,12);
        List<String> lList=noteService.location(user.getUserId());
        model.addAttribute("flag",true);
        model.addAttribute("user",user);
        model.addAttribute("dList",dList);
        model.addAttribute("nList",nList);
        model.addAttribute("lList",lList);
        return "userCenter";
    }

    @LoginCheck
    @RequestMapping(value = "/user",method = RequestMethod.GET)
    public String userCenter( ModelMap model,HttpSession session){
        User user= (User) session.getAttribute("user");
        List<Daily> dList=dailyService.getDailyByUserId(user.getUserId(),0,12);
        List<TripNote> nList=noteService.list(user.getUserId(),0,12);
        List<String> lList=noteService.location(user.getUserId());
        model.addAttribute("flag",false);
        model.addAttribute("user",user);
        model.addAttribute("dList",dList);
        model.addAttribute("nList",nList);
        model.addAttribute("lList",lList);
        return "userCenter";
    }

    @LoginCheck
    @ResponseBody
    @RequestMapping(value = "/user/updateAvatar",method = RequestMethod.POST)
    public Map<String,String> updateAvatar(@RequestParam(value = "file") MultipartFile file , HttpSession session){
        User user= (User) session.getAttribute("user");
        user=userService.updateAvatar(user,file);
        Map<String,String> map=new HashMap<>();
        if (user==null){
            map.put("message","FAIL");
            map.put("error","更新头像失败");
        }else {
            map.put("message","SUCCESS");
            map.put("data",user.getAvatar());
            session.setAttribute("user",user);
        }
        return map;
    }

    @LoginCheck
    @ResponseBody
    @RequestMapping(value = "/user/updateSign",method = RequestMethod.POST)
    public Map<String,String> updateSign(String sign ,HttpSession session){
        User user= (User) session.getAttribute("user");
        Map<String,String> map=new HashMap<>();
        if (userService.updateSign(user,sign)==0){
            map.put("message","FAIL");
            map.put("error","更新签名失败");
        }else {
            map.put("message","SUCCESS");
            user.setSign(sign);
            map.put("data",user.getSign());
            session.setAttribute("user",user);
        }
        return map;
    }

    @LoginCheck
    @ResponseBody
    @RequestMapping(value = "/user/updateName",method = RequestMethod.POST)
    public Map<String,String> updateNickname(String nickname ,HttpSession session){
        User user= (User) session.getAttribute("user");
        Map<String,String> map=new HashMap<>();
        if (userService.updateNickname(user,nickname)==0){
            map.put("message","FAIL");
            map.put("error","更新昵称失败");
        }else {
            map.put("message","SUCCESS");
            user.setNickname(nickname);
            map.put("data",user.getNickname());
            session.setAttribute("user",user);
        }
        return map;
    }

    @RequestMapping(value = "/user/list",method = RequestMethod.GET)
    public String list(int offset,int limit,ModelMap model){
        int total=userService.countUser();
        if (offset>=total){
            throw new CustomException("页数错误");
        }
        int pre=offset-limit<0?0:offset-limit;
        int next=offset+limit>total?total:offset+limit;
        int totalPage=Math.round((float) total/(float) limit);
        model.addAttribute("pre",pre);
        model.addAttribute("next",next);
        model.addAttribute("totalPage",totalPage);
        return "list";
    }
}
