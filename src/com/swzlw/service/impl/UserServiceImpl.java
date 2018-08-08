package com.swzlw.service.impl;

import com.swzlw.dao.UserDao;
import com.swzlw.model.User;
import com.swzlw.service.UserService;
import com.swzlw.model.UserGc;
import com.swzlw.model.UserGx;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/4.
 */
@Service("userService")
public class UserServiceImpl implements UserService{

    @Resource
    private UserDao userDao;

    @Override
    public List<UserGc> findUserGc() {
        return userDao.findUserGc();
    }

    @Override
    public List<UserGx> findUserGx(Map<String, Object> map) {
        return userDao.findUserGx(map);
    }

    @Override
    public Long getTotalUserGx(Map<String, Object> map) {
        return userDao.getTotalUserGx(map);
    }

    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public User register(User user) {
    	// TODO Auto-generated method stub
    	return userDao.register(user);
    }
    
    @Override
    public List<User> find(Map<String, Object> map) {
        return userDao.find(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return userDao.getTotal(map);
    }

    @Override
    public int add(User user) {
        return userDao.add(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public int delete(Integer id) {
        return userDao.delete(id);
    }

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

}
