package com.swzlw.dao;

import com.swzlw.model.DataDic;
import com.swzlw.model.Lost;
import com.swzlw.model.LostGc;

import java.util.List;
import java.util.Map;

public interface LostDao {
	//��ѯʧ�ﹹ��
    List<LostGc> findLostGc();

    //��ѯ��������
    List<Lost> find(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);//map是因为这里使用的是mybatis

    Lost findById(Integer id);
    
    //��ѯ����ʧ�����
    List<Lost> findAll();

    int add(Lost lost);

    int update(Lost lost);

    int delete(Integer id);

}
