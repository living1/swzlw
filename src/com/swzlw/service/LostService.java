package com.swzlw.service;

import com.swzlw.model.Lost;
import com.swzlw.model.LostGc;

import java.util.List;
import java.util.Map;

/**
 * Created by 鍝堝埄娉㈢壒 on 2017/11/15.
 */
public interface LostService {
	//查询失物构成
    List<LostGc> findLostGc();

    //查询订单集合
    List<Lost> find(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);//map鏄洜涓鸿繖閲屼娇鐢ㄧ殑鏄痬ybatis

    Lost findById(Integer id);
    
  //查询所有失物类别
    List<Lost> findAll();
    
    int add(Lost lost);

    int update(Lost lost);

    int delete(Integer id);

    int updateCheckState(Lost lost);

    int updateReturnState(Lost lost);
}
