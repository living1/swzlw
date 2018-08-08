package com.swzlw.service;

import java.util.List;
import java.util.Map;

import com.swzlw.model.Claim;

public interface ClaimService {

    //查询订单集合
    List<Claim> find(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);//map鏄洜涓鸿繖閲屼娇鐢ㄧ殑鏄痬ybatis

    Claim findById(Integer id);
    
    //添加用户信息
    int add(Claim claim);

    int update(Claim claim);
}
