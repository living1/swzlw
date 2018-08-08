package com.swzlw.model;

import java.util.Date;

//失物实体
public class Lost {
    private Integer id;
    private Integer pickId;//捡到的人的id关联t_user表的主键
    private Integer ownerId;//失物主人的id，关联t_user表的主键,默认是0表示没有被认领
    private String lostName;//d)失物名称
    private String pickName;//拾物者名称
    private String pickDate;//捡到时间
    private String handleName;//处理人
    private String handleDate;//处理日期
    private String returnName;//失主
    private String returnDate;//归还日期 申请认领通过时的时间
    private String address;//拾物地址
    private int lostNum;//物品数量
    private String unit;//单位
    private String outline;//粗略描述
    private String detail;//细节描述
    private String returnState;//归还状态
    private String checkState;//审核状态
    private User pickMan;//拾到者
    private User owner;//主人

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
