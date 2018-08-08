package com.swzlw.controller;

import com.swzlw.model.PageBean;
import com.swzlw.model.User;
import com.swzlw.service.UserService;
import com.swzlw.model.UserGc;
import com.swzlw.model.UserGx;
import com.swzlw.util.ResponseUtil;
import com.swzlw.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    //登录
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request)throws Exception{
        User resultUser=userService.login(user);
        if(resultUser==null){
            request.setAttribute("user",user);
            request.setAttribute("errorMsg","用户名或密码错误!");
            return "login";
        }else{
            HttpSession session=request.getSession();
            session.setAttribute("currentUser",resultUser);
            return "redirect:/main.jsp";
        }
    }
    
    //注册
    @RequestMapping("/register")
    public String register(@RequestParam(value="userName",required=false)String userName,
    		@RequestParam(value="password",required=false)String password,
    		@RequestParam(value="trueName",required=false)String trueName,
    		@RequestParam(value="roleName",required=false)String roleName,
    		@RequestParam(value="isSchool",required=false)String isSchool,
    		@RequestParam(value="institute",required=false)String institute,
    		@RequestParam(value="email",required=false)String email,
    		@RequestParam(value="phone",required=false)String phone,HttpServletRequest request)throws Exception{
    	int resultTotal=0;//操作的记录条数
    	User user=new User(null, userName, password, trueName,"/photo", email, phone,
    			isSchool, institute, roleName, 0);
        user.setRoleName("普通用户");
        resultTotal=userService.add(user);
        /*JSONObject result=new JSONObject();
        if(resultTotal>0){
            result.put("success", true);
        }else{
            result.put("success", false);
        }*/
        //ResponseUtil.write(response, result);
        User resultUser=userService.login(user);
        if(resultUser==null){
            request.setAttribute("user",user);
            request.setAttribute("errorMsg","用户名或密码错误!");
            return "login";
        }else{
            HttpSession session=request.getSession();
            session.setAttribute("currentUser",resultUser);
            return "redirect:/main.jsp";
        }
    }

    //分页条件查询用户
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, User s_user, HttpServletResponse response)throws Exception{
        //rows鏄痚asyUI浼犳潵鐨�
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("userName", StringUtil.formatLike(s_user.getUserName()));//鐢ㄦ埛鍚�
        map.put("isSchool", StringUtil.formatLike(s_user.getIsSchool()));//鏈牎浜哄憳
        map.put("institute", StringUtil.formatLike(s_user.getInstitute()));//鎵�灞炲闄�
        map.put("roleName", StringUtil.formatLike(s_user.getRoleName()));//鐢ㄦ埛绫诲瀷
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<User> userList=userService.find(map);
        Long total=userService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(userList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    //添加或者修改用户
    @RequestMapping("/save")
    public String save(User user,HttpServletResponse response)throws Exception{
        int resultTotal=0;//操作的记录条数
        user.setPic("/photo");
        user.setRefuseTime(0);
        user.setRoleName("普通用户");
        if(user.getId()==null){
        	//获取不到id就说明是添加
            resultTotal=userService.add(user);
        }else{
            resultTotal=userService.update(user);
        }
        JSONObject result=new JSONObject();
        if(resultTotal>0){
            result.put("success", true);
        }else{
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    //删除用户
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception {
        String []idsStr=ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            userService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }

    //通过id查找实体,用于查看功能
    @RequestMapping("/findById")
    public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        User user=userService.findById(Integer.parseInt(id));
        JSONObject jsonObject=JSONObject.fromObject(user);
        ResponseUtil.write(response, jsonObject);
        return null;
    }

    //查询用户贡献分析
    @RequestMapping("/findUserGx")
    public String findUserGx(@RequestParam(value="page",required=false)String page,@RequestParam(value="rows",required=false)String rows,String name,HttpServletResponse response)throws Exception{
        //rows鏄痚asyUI浼犳潵鐨�
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("userName", StringUtil.formatLike(name));//瀹㈡埛鍚嶇О
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<UserGx> userGxList=userService.findUserGx(map);
        Long total=userService .getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(userGxList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    //查询用户分析构成
    @RequestMapping("/findUserGc")
    public String findUserGc(HttpServletResponse response) throws Exception{
        List<UserGc> userGcList=userService.findUserGc();
        JSONArray jsonArray=JSONArray.fromObject(userGcList);
        ResponseUtil.write(response, jsonArray);
        return null;
    }

    /*//获取学院信息,下拉框里面用到的
    @RequestMapping("/instituteComboList")
    public String instituteComboList(HttpServletResponse response)throws Exception{
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("roleName", "瀹㈡埛缁忕悊");
        List<User> userList=userService.find(map);
        JSONArray row=JSONArray.fromObject(userList);
        ResponseUtil.write(response, row);
        return null;
    }*/


    //修改密码操作
    @RequestMapping("/modifyPassword")//newPassword瑕佸拰鍓嶇鐨勫弬鏁板悕鐩稿悓锛屼笉鐒舵暟鎹紶涓嶈繃鏉�
    public String modifyPassword(Integer id,String newPassword,HttpServletResponse response)throws Exception{
        User user=new User();
        user.setId(id);
        user.setPassword(newPassword);
        int resultTotal=userService.update(user);
        JSONObject result=new JSONObject();
        if(resultTotal>0){
            result.put("success", true);
        }else{
            result.put("success", false);
        }
        ResponseUtil.write(response, result);
        return null;
    }

    //退出系统
    @RequestMapping("/logout")
    public String logout(HttpSession session)throws Exception{
        session.invalidate();//清空缓存
        return "redirect:/login.jsp";
    }

}
