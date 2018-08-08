package com.swzlw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.swzlw.model.Claim;
import com.swzlw.model.PageBean;
import com.swzlw.model.User;
import com.swzlw.model.UserLoss;
import com.swzlw.service.ClaimService;
import com.swzlw.service.UserLossService;
import com.swzlw.service.UserService;
import com.swzlw.util.ResponseUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/claim")
public class ClaimController {
	
	@Resource
	private ClaimService claimService;
	
	@Resource
	private UserService userService;
	
	@Resource
	private UserLossService userLossService;

	//分页条件查询用户
    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false)String page, @RequestParam
    		(value="rows",required=false)String rows, Claim s_claim, HttpServletResponse response)throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("handleResult", s_claim.getHandleResult());
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Claim> claimList=claimService.find(map);
        Long total=claimService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(claimList);
        result.put("rows", jsonArray);
        result.put("total", total);
        ResponseUtil.write(response, result);
        return null;
    }

    //添加或者修改用户
    @RequestMapping("/save")
    public String save(Claim claim,@RequestParam(value="handleName",required=false)String handleName,HttpServletResponse response)throws Exception{
    	
        int resultTotal=0;//操作的记录条数
        if(claim.getId()==null){
        	claim.setHandleResult("未处理");
        	//获取不到id就说明是添加
            resultTotal=claimService.add(claim);
        }else{
        	claim.setHandleMan(handleName);
        	if(claim.getHandleResult().equals("未通过")){
        		User user=userService.findById(claim.getClaimId());
        		user.setRefuseTime(user.getRefuseTime()+1);
        		if(user.getRefuseTime()==5){
        			userService.delete(claim.getClaimId());
        			UserLoss userLoss=new UserLoss(null,claim.getClaimName(),null,null,"暂缓移除");
        			userLossService.add(userLoss);
        		}else{
        			userService.update(user);
        		}
        	}
            resultTotal=claimService.update(claim);
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
    
  //通过id查找实体,用于查看功能
    @RequestMapping("/findById")
    public String findById(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        Claim claim=claimService.findById(Integer.parseInt(id));
        JSONObject jsonObject=JSONObject.fromObject(claim);
        ResponseUtil.write(response, jsonObject);
        return null;
    }
}
