package com.swzlw.service.impl;

import com.swzlw.service.DataDicService;
import com.swzlw.dao.DataDicDao;
import com.swzlw.model.DataDic;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 哈利波特 on 2017/11/17.
 */
@Service("dataDicService")
public class DataDicServiceImpl implements DataDicService{

    @Resource
    private DataDicDao dataDicDao;

    @Override
    public List<DataDic> find(Map<String, Object> map) {
        return dataDicDao.find(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return dataDicDao.getTotal(map);
    }

    @Override
    public int update(DataDic dataDic) {
        return dataDicDao.update(dataDic);
    }

    @Override
    public int add(DataDic dataDic) {
        return dataDicDao.add(dataDic);
    }

    @Override
    public int delete(Integer id) {
        return dataDicDao.delete(id);
    }

    @Override
    public List<DataDic> findAll() {
        return dataDicDao.findAll();
    }

	@Override
	public List<DataDic> findAll1() {
		// TODO Auto-generated method stub
		return dataDicDao.findAll1();
	}
}
