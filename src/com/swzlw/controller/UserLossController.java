package com.swzlw.controller;

import com.swzlw.service.UserLossService;
import com.swzlw.model.PageBean;
import com.swzlw.model.UserLoss;
import com.swzlw.util.DateUtil;
import com.swzlw.util.ResponseUtil;
import com.swzlw.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userLoss")
public class UserLossController {

    @Resource
    private UserLossService userLossService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:鍏佽杈撳叆绌哄�硷紝false:涓嶈兘涓虹┖鍊�
    }

    //分页条件查询暂缓移除的用户，确认移除的客户不在这里查
    @RequestMapping("/list1")
    public String list1(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, UserLoss s_userLoss, HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        //rows是easyUI传来的
        Map<String, Object> map=new HashMap<>();
        map.put("userName", StringUtil.formatLike(s_userLoss.getUserName()));//杩欓噷灏佽浜嗘柟娉曪紝鍦ㄦ暟鎹袱绔坊鍔�%鐢ㄤ簬妯＄硦鏌ヨ
      //这个直接从前台传默认值，不同页面的默认值不一样，保证有的页面只显示已移除，有的显示的暂缓移除
        map.put("removeState", "暂缓移除");
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<UserLoss> userLossList=userLossService.find(map);
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject result=new JSONObject();
        Long total=userLossService.getTotal(map);
        JSONArray jsonArray=JSONArray.fromObject(userLossList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    //分页条件查询确认移除的用户
    @RequestMapping("/list2")
    public String list2(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, String confirmLossDatefrom, String confirmLossDateto, UserLoss s_userLoss, HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        //rows鏄痚asyUI浼犳潵鐨�
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("userName", StringUtil.formatLike(s_userLoss.getUserName()));//杩欓噷灏佽浜嗘柟娉曪紝鍦ㄦ暟鎹袱绔坊鍔�%鐢ㄤ簬妯＄硦鏌ヨ
        map.put("confirmLossDatefrom", confirmLossDatefrom);
        map.put("confirmLossDateto", confirmLossDateto);
        map.put("removeState", "确认移除");
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<UserLoss> userLossList=userLossService.find(map);
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject result=new JSONObject();
        Long total=userLossService.getTotal(map);
        JSONArray jsonArray=JSONArray.fromObject(userLossList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    //到时候点击暂缓移除的时候需要把具体信息显示出来，所以通过这个方法来查找实体
    //通过id查找实体
    @RequestMapping("/findById")
    public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        UserLoss userLoss=userLossService.findById(Integer.parseInt(id));
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject jsonObject=JSONObject.fromObject(userLoss,jsonConfig);
        ResponseUtil.write(response, jsonObject);
        return null;
    }

    //确认客户流失
    @RequestMapping("/confirmLoss")
    public String confirmLoss(int id,String lossReason,HttpServletResponse response)throws Exception{
        UserLoss userLoss=new UserLoss();
        userLoss.setId(id);
        userLoss.setLossReason(lossReason);
        //Date date=new Date();
        //Timestamp t=new Timestamp(date.getTime());
        //Date date=DateUtil.getNowDateShort();
        //java.util.Date udate = new java.util.Date();
        //java.sql.Date sdate = new java.sql.Date(udate.getTime());
        userLoss.setConfirmLossDate(DateUtil.dateToStr());
        userLoss.setRemoveState("确认移除");
        userLossService.update(userLoss);
        JSONObject result=new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
