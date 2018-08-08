package com.swzlw.dao;

import com.swzlw.model.User;
import com.swzlw.model.UserGc;
import com.swzlw.model.UserGx;

import java.util.List;
import java.util.Map;

public interface UserDao {
	//�û���¼
    User login(User user);
    
    //�û�ע��
    User register(User user);

    //��ѯ�û�����
    List<User> find(Map<String, Object> map);

    //��ȡ�ܼ�¼��
    Long getTotal(Map<String, Object> map);//map是因为这里使用的是mybatis

    //����û���Ϣ
    int add(User user);

    int update(User user);

    //ɾ���û�
    int delete(Integer id);

    //ͨ��id����ʵ��
    User findById(Integer id);

    //��ѯ�û�����
    List<UserGc> findUserGc();

    //��ѯ�û�����
    List<UserGx> findUserGx(Map<String, Object> map);

    //��ѯ�û����׼�¼��
    Long getTotalUserGx(Map<String, Object> map);
}
