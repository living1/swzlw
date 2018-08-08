package com.swzlw.dao;

import com.swzlw.model.DataDic;

import java.util.List;
import java.util.Map;

public interface DataDicDao {
	//��ѯ���������ֵ�
    List<DataDic> find(Map<String, Object> map);

    //��ѯ����ѧԺ���Ƶļ���
    List<DataDic> findAll();
    
    //��ѯ����ʧ������
    List<DataDic> findAll1();

    //��ȡ�ܵļ�¼��
    Long getTotal(Map<String, Object> map);

    //�޸������ֵ�
    int update(DataDic dataDic);

    //��������ֵ�
    int add(DataDic dataDic);

    //ɾ�������ֵ�
    int delete(Integer id);
}
