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

    //��ҳ������ѯ�ͻ���ʧ�ݻ���ʩ
    @RequestMapping("/list")
    public String list(@RequestParam(value="lossId",required=false)String lossId,HttpServletResponse response)throws Exception{
    	//rows��easyUI������
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("lossId", lossId);
        List<UserReprieve> userReprieveList=userReprieveService.find(map);
        JSONObject result=new JSONObject();
        JsonConfig jsonConfig=new JsonConfig();
        jsonConfig.setExcludes(new String[]{"customerLoss"});//��saleChanceȥ����Ȼ���γ���ѭ��
        JSONArray jsonArray=JSONArray.fromObject(userReprieveList,jsonConfig);
        result.put("rows", jsonArray);
        ResponseUtil.write(response, result);
        return null;
    }

    //��ӻ����޸��û���ʧ�ݻ���ʩ
    @RequestMapping("/save")
    public String save(UserReprieve customerReprieve,HttpServletResponse response)throws Exception{
        int resultTotal=0;//�����ļ�¼����
        if(customerReprieve.getId()==null){
        	//��ȡ����id��˵�������
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

    //ɾ��
    @RequestMapping("/delete")
    public String delete(@RequestParam(value="id")String id,HttpServletResponse response)throws Exception{
        userReprieveService.delete(Integer.parseInt(id));//������һ��һ��ɾ���ģ��ʿɱ༭���
        JSONObject result=new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
