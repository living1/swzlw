package com.swzlw.model;

//�û��ݻ���ʩ
public class UserReprieve {
    private Integer id;
    private UserLoss userLoss;//�����ڵ��ݻ���ʧ�ͻ�
    private String measure;//�ݻ���ʩ

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
