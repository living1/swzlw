package com.swzlw.model;

import java.util.Date;

//ʧ��ʵ��
public class Lost {
    private Integer id;
    private Integer pickId;//�񵽵��˵�id����t_user�������
    private Integer ownerId;//ʧ�����˵�id������t_user�������,Ĭ����0��ʾû�б�����
    private String lostName;//d)ʧ������
    private String pickName;//ʰ��������
    private String pickDate;//��ʱ��
    private String handleName;//������
    private String handleDate;//��������
    private String returnName;//ʧ��
    private String returnDate;//�黹���� ��������ͨ��ʱ��ʱ��
    private String address;//ʰ���ַ
    private int lostNum;//��Ʒ����
    private String unit;//��λ
    private String outline;//��������
    private String detail;//ϸ������
    private String returnState;//�黹״̬
    private String checkState;//���״̬
    private User pickMan;//ʰ����
    private User owner;//����

    public User getPickMan() {
        return pickMan;
    }

    public void setPickMan(User pickMan) {
        this.pickMan = pickMan;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPickId() {
        return pickId;
    }

    public void setPickId(Integer pickId) {
        this.pickId = pickId;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getLostName() {
        return lostName;
    }

    public void setLostName(String lostName) {
        this.lostName = lostName;
    }

    public String getPickName() {
        return pickName;
    }

    public void setPickName(String pickName) {
        this.pickName = pickName;
    }

    public String getPickDate() {
        return pickDate;
    }

    public void setPickDate(String pickDate) {
        this.pickDate = pickDate;
    }

    public String getHandleName() {
        return handleName;
    }

    public void setHandleName(String handleName) {
        this.handleName = handleName;
    }

    public String getHandleDate() {
        return handleDate;
    }

    public void setHandleDate(String handleDate) {
        this.handleDate = handleDate;
    }

    public String getReturnName() {
        return returnName;
    }

    public void setReturnName(String returnName) {
        this.returnName = returnName;
    }

    public String getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(String returnDate) {
        this.returnDate = returnDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getLostNum() {
        return lostNum;
    }

    public void setLostNum(int lostNum) {
        this.lostNum = lostNum;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getOutline() {
        return outline;
    }

    public void setOutline(String outline) {
        this.outline = outline;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getReturnState() {
        return returnState;
    }

    public void setReturnState(String returnState) {
        this.returnState = returnState;
    }

    public String getCheckState() {
        return checkState;
    }

    public void setCheckState(String checkState) {
        this.checkState = checkState;
    }
}
