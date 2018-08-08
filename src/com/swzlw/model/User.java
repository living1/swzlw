package com.swzlw.model;

public class User {
    private Integer id;
    private String userName;
    private String password;
    private String trueName;
    private String pic;//图片路径
    private String email;
    private String phone;
    private String isSchool;//是否本校
    private String institute;//所属学院
    private String roleName;//状态:普通用户，系统管理员
    private int refuseTime;//创建失物失败次数，超过5进入暂缓移除

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrueName() {
        return trueName;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIsSchool() {
        return isSchool;
    }

    public void setIsSchool(String isSchool) {
        this.isSchool = isSchool;
    }

    public String getInstitute() {
        return institute;
    }

    public void setInstitute(String institute) {
        this.institute = institute;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getRefuseTime() {
        return refuseTime;
    }

    public void setRefuseTime(int refuseTime) {
        this.refuseTime = refuseTime;
    }

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(Integer id, String userName, String password, String trueName, String pic, String email, String phone,
			String isSchool, String institute, String roleName, int refuseTime) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.trueName = trueName;
		this.pic = pic;
		this.email = email;
		this.phone = phone;
		this.isSchool = isSchool;
		this.institute = institute;
		this.roleName = roleName;
		this.refuseTime = refuseTime;
	}
    
}
