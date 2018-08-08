package com.swzlw.service.impl;

import com.swzlw.service.UserReprieveService;
import com.swzlw.dao.UserReprieveDao;
import com.swzlw.model.UserReprieve;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/18.
 */
@Service("userReprieveService")
public class UserReprieveServiceImpl implements UserReprieveService{

    @Resource
    private UserReprieveDao userReprieveDao;

    @Override
    public List<UserReprieve> find(Map<String, Object> map) {
        return userReprieveDao.find(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return userReprieveDao.getTotal(map);
    }

    @Override
    public int update(UserReprieve userReprieve) {
        return userReprieveDao.update(userReprieve);
    }

    @Override
    public int add(UserReprieve userReprieve) {
        return userReprieveDao.add(userReprieve);
    }

    @Override
    public int delete(Integer id) {
        return userReprieveDao.delete(id);
    }
}
