package main.exception;

import com.alibaba.fastjson.JSON;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by cnhhdn on 2017/6/14.
 */
@Component
public class CustomExceptionResolver implements HandlerExceptionResolver {

    private final Logger log= LoggerFactory.getLogger(CustomException.class);

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        log.error(httpServletRequest.getRequestURI()+" error caused by "+e.getMessage());
        if (e instanceof LoginException){
            ModelAndView modelAndView=new ModelAndView("redirect:/login");
            modelAndView.addObject("error","请先登录");
            modelAndView.addObject("redirectUrl",httpServletRequest.getRequestURI());
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("error");
        modelAndView.addObject("exMsg",e.getMessage());
        modelAndView.addObject("exType",e.getClass().getSimpleName());
        return modelAndView;
        /*try {
            PrintWriter writer=httpServletResponse.getWriter();

            writer.write(JSON.toJSONString(e.getMessage()));
            writer.flush();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
        return null;*/
    }
}
