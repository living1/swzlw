package com.swzlw.controller;

import com.swzlw.service.LostService;
import com.swzlw.service.UserLossService;
import com.swzlw.service.UserService;
import com.swzlw.model.Lost;
import com.swzlw.model.LostGc;
import com.swzlw.model.PageBean;
import com.swzlw.model.User;
import com.swzlw.model.UserLoss;
import com.swzlw.util.ResponseUtil;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/lost")
public class LostController {

    @Resource
    private LostService lostService;
    
    @Resource
	private UserService userService;
	
	@Resource
	private UserLossService userLossService;

    @InitBinder//时间从前台过来是字符串的形式，绑定了这个方法就能将它转换成日期对象
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:鍏佽杈撳叆绌哄�硷紝false:涓嶈兘涓虹┖鍊�
    }

    //查询用户的历史拾物
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false)String page, @RequestParam(value="rows",required=false)String rows, @RequestParam(value="pickId",required=false)String pickId, HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        //rows是easyUI传来的
        Map<String, Object> map=new HashMap<>();
        map.put("pickId", Integer.parseInt(pickId));
        map.put("checkState","通过");
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Lost> lostList=lostService.find(map);
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.setExcludes(new String[]{"pickMan","owner"});//灏唖aleChance鍘婚櫎涓嶇劧浼氬舰鎴愭寰幆
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject result=new JSONObject();
        Long total=lostService.getTotal(map);
        JSONArray jsonArray=JSONArray.fromObject(lostList,jsonConfig);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }
    
    //分页条件查询失物信息
    @RequestMapping("/list1")
    public String list1(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, Lost s_lost, HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("lostName",s_lost.getLostName());
        map.put("address",s_lost.getAddress());
        map.put("outline",s_lost.getOutline());
        map.put("checkState",s_lost.getCheckState());
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<Lost> lostList=lostService.find(map);
        Long total=lostService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(lostList);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    //通过id查找实体
    @RequestMapping("/findById")
    public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        Lost lost=lostService.findById(Integer.parseInt(id));
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor("yyyy-MM-dd"));
        JSONObject jsonObject=JSONObject.fromObject(lost,jsonConfig);
        ResponseUtil.write(response, jsonObject);
        return null;
    }

    //查询用户分析构成
    @RequestMapping("/findLostGc")
    public String findLostGc(HttpServletResponse response) throws Exception{
        List<LostGc> lostGcList=lostService.findLostGc();
        JSONArray jsonArray=JSONArray.fromObject(lostGcList);
        ResponseUtil.write(response, jsonArray);
        return null;
    }
    
    //查找数据字典值
    @RequestMapping("/findLostName")
    public String lostNameComboList(HttpServletResponse response)throws Exception{
        JSONArray jsonArray=new JSONArray();
        List<Lost> lostList=lostService.findAll();
        JSONArray rows=JSONArray.fromObject(lostList);//灏嗛泦鍚堣浆鍖栦负jsonarray
        jsonArray.addAll(rows);
        ResponseUtil.write(response, jsonArray);
        return null;
    }
    
    //添加或者修改失物
  	@RequestMapping("/save")
  	public String save(Lost lost,@RequestParam(value="pickId1",required=false)String pickId1,HttpServletResponse response)throws Exception{//,@RequestParam(value="pickId1")int pickId1
  		int resultTotal=0;//操作的记录条数
  		
  		if(lost.getId()==null){//交往记录添加的时候要修改它所对应的销售机会为开发中
  			lost.setCheckState("未审核");
  			lost.setReturnState("未归还");
  			//获取不到id就说明是添加
  			resultTotal=lostService.add(lost);
  			
  		}else{
  			lost.setPickId(Integer.parseInt(pickId1));
  			if(lost.getCheckState().equals("未通过")){
        		User user=userService.findById(lost.getPickId());
        		user.setRefuseTime(user.getRefuseTime()+1);
        		if(user.getRefuseTime()==5){
        			userService.delete(lost.getPickId());
        			UserLoss userLoss=new UserLoss(null,lost.getPickName(),null,null,"暂缓移除");
        			userLossService.add(userLoss);
        		}else{
        			userService.update(user);
        		}
        	}
  			resultTotal=lostService.update(lost);
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

}
