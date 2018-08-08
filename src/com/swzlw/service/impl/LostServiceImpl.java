package com.swzlw.service.impl;

import com.swzlw.service.LostService;
import com.swzlw.dao.LostDao;
import com.swzlw.model.Lost;
import com.swzlw.model.LostGc;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/15.
 */
@Service("lostService")
public class LostServiceImpl implements LostService{

    @Resource
    private LostDao lostDao;

    @Override
    public List<LostGc> findLostGc() {
        return lostDao.findLostGc();
    }

    @Override
    public List<Lost> find(Map<String, Object> map) {
        return lostDao.find(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return lostDao.getTotal(map);
    }

    @Override
    public Lost findById(Integer id) {
        return lostDao.findById(id);
    }

	@Override
	public List<Lost> findAll() {
		return lostDao.findAll();
	}

	@Override
	public int add(Lost lost) {
		// TODO Auto-generated method stub
		return lostDao.add(lost);
	}

	@Override
	public int update(Lost lost) {
		// TODO Auto-generated method stub
		return lostDao.update(lost);
	}

	@Override
	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return lostDao.delete(id);
	}

	@Override
	public int updateCheckState(Lost lost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReturnState(Lost lost) {
		// TODO Auto-generated method stub
		return 0;
	}
}
