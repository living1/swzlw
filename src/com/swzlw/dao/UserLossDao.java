package com.swzlw.dao;

import com.swzlw.model.User;
import com.swzlw.model.UserLoss;

import java.util.List;
import java.util.Map;

public interface UserLossDao {
	//��ѯ(����Ӧ�����������͵Ĳ�ѯ��һ���ǲ�ѯ�����Ķ����Ѿ�ȷ����ʧ�ģ�һ���ǲ��ȫ�����ݻ���ʧ��)
    List<UserLoss> find(Map<String, Object> map);

  //��ȡ�ܵļ�¼��
    Long getTotal(Map<String, Object> map);

    UserLoss findById(Integer id);

  //�޸��û���ʧ������ȷ���û���ʧʱ�޸�״̬
    int update(UserLoss userLoss);
    
    int add(UserLoss userLoss);
}
