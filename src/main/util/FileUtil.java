package main.util;

import main.exception.CustomException;
import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by cnhhdn on 2017/6/13.
 */
public class FileUtil {

    public static String uploadFile(HttpSession session,MultipartFile file, String srcPath,String type){
        if (file.isEmpty())
            return "";
        String srcFileName=file.getOriginalFilename();
        String suffix=srcFileName.substring(srcFileName.lastIndexOf('.'));
        String dstFileName=type+new Date().getTime()+suffix;
        String result,path;
        if ("".equals(srcPath)||srcPath==null){
            path = session.getServletContext().getRealPath("/upload/"+type+"/");
            result="/upload/"+type+"/"+dstFileName;
        }else {
            path=session.getServletContext().getRealPath(srcPath);
            result=srcPath+dstFileName;
        }

        File dstFile=new File(path,dstFileName);
        if (!dstFile.exists()){
            dstFile.mkdirs();
        }
        try {
            file.transferTo(dstFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "";
        }
        return result;
    }
    public static String uploadFile(HttpSession session,MultipartFile file, String type){
        return uploadFile(session,file,null,type);
    }

    public static void deleteFile(HttpSession session,String path){
        String filePath = session.getServletContext().getRealPath("/")+path;
        File file=new File(filePath);
        if (file.exists())
            file.delete();
    }

    public static void imgMatch(String content,String path,String noteId){
        List<String> imgList=new ArrayList<>();
        Pattern pattern=Pattern.compile("<(img|IMG)(.*?)(>|></(img|IMG)>)");
        Matcher matcher=pattern.matcher(content);
        while(matcher.find()){
            String imgContent=matcher.group(2);
            Pattern imgPattern=Pattern.compile("(src|SRC)=(\'|\")(.*?)(\'|\")");
            Matcher imgMatcher=imgPattern.matcher(imgContent);
            if (imgMatcher.find()){
                String src=imgMatcher.group(3);
                if (!"".equals(src))
                    imgList.add(src);
            }
        }
        File file=new File(path);
        if (file.isDirectory()&&file.exists()){
            File[] files=file.listFiles();
            for (int i=0;i<files.length;i++){
                File subFile=files[i];
                if (subFile.getName().contains("cover")){
                    continue;
                }
                String subSrc="/upload/note/"+noteId+"/"+subFile.getName();
                if (!imgList.contains(subSrc)){
                    subFile.delete();
                }
            }
        }else
            throw new CustomException("文件夹不存在");
    }
}
