package com.swzlw.controller;

import com.swzlw.service.DataDicService;
import com.swzlw.model.DataDic;
import com.swzlw.model.PageBean;
import com.swzlw.util.ResponseUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dataDic")
public class DataDicController {
    @Resource
    private DataDicService dataDicService;

    //��ҳ������ѯ�����ֵ�
    @RequestMapping("/list")
    public String list(@RequestParam(value = "page",required = false)String page, @RequestParam(value = "rows",required = false)String rows, DataDic s_dataDic, HttpServletResponse response)throws Exception{
        //rows是从前端传过来的
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String, Object> map=new HashMap<String, Object>();
        map.put("dataDicName",s_dataDic.getDataDicName());
        map.put("dataDicValue",s_dataDic.getDataDicValue());
        map.put("start",pageBean.getStart());
        map.put("size",pageBean.getPageSize());
        List<DataDic> dataDicList=dataDicService.find(map);
        Long total=dataDicService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(dataDicList);
        result.put("rows",jsonArray);
        result.put("total",total);
        ResponseUtil.write(response,result);
        return null;
    }

    //���������ֵ�ֵ
    @RequestMapping("/findDataDicName")
    public String dataDicNameComboList(HttpServletResponse response)throws Exception{
        JSONArray jsonArray=new JSONArray();
        List<DataDic> dataDicList=dataDicService.findAll();
        JSONArray rows=JSONArray.fromObject(dataDicList);//将集合转化为jsonarray
        jsonArray.addAll(rows);
        ResponseUtil.write(response, jsonArray);
        return null;
    }

    //���������ֵ������������ֵ�ֵ������������
    @RequestMapping("/dataDicComboList")
    public String dataDicComboList(String dataDicName,HttpServletResponse response)throws Exception{
        JSONArray jsonArray=new JSONArray();
        Map<String, Object> map=new HashMap<String,Object>();
        map.put("dataDicName", dataDicName);
        List<DataDic> dataDicList=dataDicService.find(map);
        JSONArray rows=JSONArray.fromObject(dataDicList);
        jsonArray.addAll(rows);
        ResponseUtil.write(response, rows);
        return null;
    }

    //��ӻ����޸������ֵ�
    @RequestMapping("/save")
    public String save(DataDic dataDic,HttpServletResponse response)throws Exception{
        int resultTotal=0;//�����ļ�¼����
        if(dataDic.getId()==null){
        	//��ȡ����id��˵�������
            resultTotal=dataDicService.add(dataDic);
        }else{
            resultTotal=dataDicService.update(dataDic);
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
    public String delete(@RequestParam(value="ids")String ids,HttpServletResponse response)throws Exception{
        String []idsStr=ids.split(",");
        for(int i=0;i<idsStr.length;i++){
            dataDicService.delete(Integer.parseInt(idsStr[i]));
        }
        JSONObject result=new JSONObject();
        result.put("success", true);
        ResponseUtil.write(response, result);
        return null;
    }
}
