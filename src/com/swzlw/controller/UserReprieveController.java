package com.swzlw.controller;

import com.swzlw.service.UserReprieveService;
import com.swzlw.model.UserReprieve;
import com.swzlw.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userReprieve")
public class UserReprieveController {
    @Resource
    private UserReprieveService userReprieveService;

    //分页条件查询客户流失暂缓措施
    @RequestMapping("/list")
    public String list(@RequestParam(value="lossId",required=false)String lossId,HttpServletResponse response)throws Exception{
    	//rows是easyUI传来的
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("lossId", lossId);
        List<UserReprieve> userReprieveList=userReprieveService.find(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.setExcludes(new String[]{"customerLoss"});//将saleChance去除不然会形成死循环
        JSONArray jsonArray=JSONArray.fromObject(userReprieveList,jsonConfig);
        result.put("rows", jsonArray);
        ResponseUtil.write(response, result);
        return null;
    }

    //添加或者修改用户流失暂缓措施
    @RequestMapping("/save")
    public String save(UserReprieve customerReprieve,HttpServletResponse response)throws Exception{
        int resultTotal=0;//操作的记录条数
        if(customerReprieve.getId()==null){
        	//获取不到id就说明是添加
            resultTotal=userReprieveService.add(customerReprieve);
        }else{
            resultTotal=userReprieveService.update(customerReprieve);
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

    //删除
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        userReprieveService.delete(Integer.parseInt(id));//这里是一条一条删除的，适可编辑表格
        JSONObject result=new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
