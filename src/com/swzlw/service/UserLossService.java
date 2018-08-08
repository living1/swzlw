package com.swzlw.service;

import com.swzlw.model.UserLoss;

import java.util.List;
import java.util.Map;

public interface UserLossService {
	//查询(这里应该有两种类型的查询，一种是查询出来的都是已经确认流失的，一种是查出全都是暂缓流失的)
    List<UserLoss> find(Map<String, Object> map);

  //获取总的记录数
    Long getTotal(Map<String, Object> map);

    UserLoss findById(Integer id);

  //修改用户流失，用于确认用户流失时修改状态
    int update(UserLoss userLoss);
    
    int add(UserLoss userLoss);
}
