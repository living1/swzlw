package com.swzlw.service;

import com.swzlw.model.DataDic;

import java.util.List;
import java.util.Map;

/**
 * Created by 鍝堝埄娉㈢壒 on 2017/11/17.
 */
public interface DataDicService {
	//查询所有数据字典
    List<DataDic> find(Map<String, Object> map);

    //查询所有学院名称的集合
    List<DataDic> findAll();
    
  //查询所有失物类型
    List<DataDic> findAll1();

    //获取总的记录数
    Long getTotal(Map<String, Object> map);

    //修改数据字典
    int update(DataDic dataDic);

    //添加数据字典
    int add(DataDic dataDic);

    //删除数据字典
    int delete(Integer id);
}
