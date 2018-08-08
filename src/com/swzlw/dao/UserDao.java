package com.swzlw.dao;

import com.swzlw.model.User;
import com.swzlw.model.UserGc;
import com.swzlw.model.UserGx;

import java.util.List;
import java.util.Map;

public interface UserDao {
	//用户登录
    User login(User user);
    
    //用户注册
    User register(User user);

    //查询用户集合
    List<User> find(Map<String, Object> map);

    //获取总记录数
    Long getTotal(Map<String, Object> map);//map鏄洜涓鸿繖閲屼娇鐢ㄧ殑鏄痬ybatis

    //添加用户信息
    int add(User user);

    int update(User user);

    //删除用户
    int delete(Integer id);

    //通过id查找实体
    User findById(Integer id);

    //查询用户构成
    List<UserGc> findUserGc();

    //查询用户贡献
    List<UserGx> findUserGx(Map<String, Object> map);

    //查询用户贡献记录数
    Long getTotalUserGx(Map<String, Object> map);
}
