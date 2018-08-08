package com.swzlw.dao;

import com.swzlw.model.UserReprieve;

import java.util.List;
import java.util.Map;

public interface UserReprieveDao {
	//查询出所有暂缓流失的措施
    List<UserReprieve> find(Map<String, Object> map);

    //查询出总的数据数，用于分页
    Long getTotal(Map<String, Object> map);//map鏄洜涓鸿繖閲屼娇鐢ㄧ殑鏄痬ybatis

    //更新
    int update(UserReprieve userReprieve);

    //添加
    int add(UserReprieve userReprieve);

    //删除
    int delete(Integer id);
}
