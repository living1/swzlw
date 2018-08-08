package com.swzlw.service;

import java.util.List;
import java.util.Map;

import com.swzlw.model.Claim;

public interface ClaimService {

    //��ѯ��������
    List<Claim> find(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);//map是因为这里使用的是mybatis

    Claim findById(Integer id);
    
    //����û���Ϣ
    int add(Claim claim);

    int update(Claim claim);
}
