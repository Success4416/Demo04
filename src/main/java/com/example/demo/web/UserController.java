package com.example.demo.web;
import com.example.demo.mapper.UserMapper;
import com.example.demo.model.Area;
import com.example.demo.model.City;
import com.example.demo.model.Pro;
import com.example.demo.model.User;
import com.example.demo.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by hasee on 2017/8/30.
 */
@Controller
public class UserController{
    @Autowired
    private UserMapper mapper;
    @RequestMapping("list")
    public String  list(Model model, User user ,HttpServletRequest request){
        String page = request.getParameter("cpage")==null?"1":request.getParameter("cpage");
        Integer cpage = Integer.valueOf(page);
        Integer pageSize = 3;
        int count = this.mapper.count();
        Map map = new HashMap<>();
        map.put("totalPage",(cpage-1)*pageSize);
        map.put("pageSize",pageSize);
        List<User> userList=this.mapper.list(map);
        String url = "/list?1=1";
        model.addAttribute("userList",userList);
        PageUtil.page(request,cpage,pageSize,count,userList,url);
        return "user_list";
    }
    @RequestMapping("/switchClazzName")
    public String switchClazzName(Model model, User user ,HttpServletRequest request){
        String page = request.getParameter("cpage")==null?"1":request.getParameter("cpage");
        Integer cpage = Integer.valueOf(page);
        Integer pageSize = 3;
        int count = this.mapper.count();
        Map map = new HashMap<>();
        map.put("totalPage",(cpage-1)*pageSize);
        map.put("pageSize",pageSize);
        List<User> clazzList=this.mapper.list(map);
        String url = "/switchClazzName?1=1";
        model.addAttribute("clazzList",clazzList);
        PageUtil.page(request,cpage,pageSize,count,clazzList,url);
        return "clazz_list";
    }
    @RequestMapping("/switchScored")
    public String switchScored(Model model, User user ,HttpServletRequest request){
        String page = request.getParameter("cpage")==null?"1":request.getParameter("cpage");
        Integer cpage = Integer.valueOf(page);
        Integer pageSize = 3;
        int count = this.mapper.count();
        Map map = new HashMap<>();
        map.put("totalPage",(cpage-1)*pageSize);
        map.put("pageSize",pageSize);
        List<User> scoredList=this.mapper.list(map);
        String url = "/switchScored?1=1";
        model.addAttribute("scoredList",scoredList);
        PageUtil.page(request,cpage,pageSize,count,scoredList,url);
        return "scored_list";
    }
    @ResponseBody
    @RequestMapping("/toDel")
    public boolean toDel(Integer id){
        int count = this.mapper.toDel(id);
        return true;
    }
    @RequestMapping("/toUpdate")
    public String toUpdate(Model model,Integer id){
        User user = this.mapper.toUpdate(id);
        List<User> clazzList = this.mapper.allClazz();
        model.addAttribute("user",user);
        model.addAttribute("clazzList",clazzList);
        return "update";
    }
    @RequestMapping("/toInsert")
    public String toInsert(Model model){
        List<User> clazzList = this.mapper.allClazz();
        List<Pro> proList = this.mapper.proList();
        model.addAttribute("clazzList",clazzList);
        model.addAttribute("proList",proList);
        return "add";
    }
    @ResponseBody
    @RequestMapping("/doUpdate")
    public boolean doUpdate(User user){
        this.mapper.doUpdate(user);
        return true;
    }
    @ResponseBody
    @RequestMapping("/doInsert")
    public boolean doInsert(User user){
        int i =  this.mapper.doInsert(user);
        if(i>0){
            return true;
        }
        return false;
    }
    @ResponseBody
    @RequestMapping("/toLook")
    public User toLook(Integer id){
        User user =this.mapper.toLook(id);
        return user;
    }
    @ResponseBody
    @RequestMapping("/getCity")
    public List<City> getCity(Integer code){
        List<City> cityList =this.mapper.getCity(code);
        return cityList;
    }
    @ResponseBody
    @RequestMapping("/getArea")
    public List<Area> getArea(Integer code){
        List<Area> areaList =this.mapper.getArea(code);
        return areaList;
    }
}
