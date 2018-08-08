package com.swzlw.model;

//用户暂缓措施
public class UserReprieve {
    private Integer id;
    private UserLoss userLoss;//所属于的暂缓流失客户
    private String measure;//暂缓措施

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public UserLoss getUserLoss() {
        return userLoss;
    }

    public void setUserLoss(UserLoss userLoss) {
        this.userLoss = userLoss;
    }

    public String getMeasure() {
        return measure;
    }

    public void setMeasure(String measure) {
        this.measure = measure;
    }
}
