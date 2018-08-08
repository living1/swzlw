package com.swzlw.service;

import com.swzlw.model.UserReprieve;

import java.util.List;
import java.util.Map;

public interface UserReprieveService {
	//��ѯ�������ݻ���ʧ�Ĵ�ʩ
    List<UserReprieve> find(Map<String, Object> map);

    //��ѯ���ܵ������������ڷ�ҳ
    Long getTotal(Map<String, Object> map);//map是因为这里使用的是mybatis

    //����
    int update(UserReprieve userReprieve);

    //���
    int add(UserReprieve userReprieve);

    //ɾ��
    int delete(Integer id);
}
