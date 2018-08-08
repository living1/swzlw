package com.swzlw.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.swzlw.dao.ClaimDao;
import com.swzlw.model.Claim;
import com.swzlw.service.ClaimService;

@Service("claimService")
public class ClaimServiceImpl implements ClaimService{
	
	@Resource
	private ClaimDao claimDao;

	@Override
	public List<Claim> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return claimDao.find(map);
	}

	@Override
	public Long getTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return claimDao.getTotal(map);
	}

	@Override
	public Claim findById(Integer id) {
		// TODO Auto-generated method stub
		return claimDao.findById(id);
	}

	@Override
	public int add(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.add(claim);
	}

	@Override
	public int update(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.update(claim);
	}

}
