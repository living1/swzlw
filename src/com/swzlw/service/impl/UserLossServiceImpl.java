package com.swzlw.service.impl;

import com.swzlw.service.UserLossService;
import com.swzlw.dao.UserLossDao;
import com.swzlw.model.UserLoss;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/15.
 */
@Service("userLossService")
public class UserLossServiceImpl implements UserLossService{

    @Resource
    private UserLossDao userLossDao;

    @Override
    public List<UserLoss> find(Map<String, Object> map) {
        return userLossDao.find(map);
    }

    @Override
    public UserLoss findById(Integer id) {
        return userLossDao.findById(id);
    }

    @Override
    public int update(UserLoss userLoss) {
        return userLossDao.update(userLoss);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return userLossDao.getTotal(map);
    }

	@Override
	public int add(UserLoss userLoss) {
		// TODO Auto-generated method stub
		return userLossDao.add(userLoss);
	}
}
