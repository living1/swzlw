package com.swzlw.model;

//�û��Ƴ�ʵ��
public class UserLoss {
    private Integer id;//���
    private String userName;//�û�����
    private String confirmLossDate;//ȷ����ʧ����
    private String lossReason;//ȷ����ʧԭ��
    private String removeState;//�Ƴ�״̬

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getConfirmLossDate() {
        return confirmLossDate;
    }

    public void setConfirmLossDate(String confirmLossDate) {
        this.confirmLossDate = confirmLossDate;
    }

    public String getLossReason() {
        return lossReason;
    }

    public void setLossReason(String lossReason) {
        this.lossReason = lossReason;
    }

    public String getRemoveState() {
        return removeState;
    }

    public void setRemoveState(String removeState) {
        this.removeState = removeState;
    }
    

	public UserLoss() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserLoss(Integer id, String userName, String confirmLossDate, String lossReason, String removeState) {
		super();
		this.id = id;
		this.userName = userName;
		this.confirmLossDate = confirmLossDate;
		this.lossReason = lossReason;
		this.removeState = removeState;
	}
    
}
