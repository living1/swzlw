package com.swzlw.service;

import com.swzlw.model.DataDic;

import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/17.
 */
public interface DataDicService {
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
