package com.hj.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String emailSite;
	private String phone;
	private Date enrollDate;
	private String userStatus;
	private String subStatus;
	private int point;
	
	private int buyCount;
	private int SaleSum;
	
	public Member() {
		super();
	}

	public Member(int userNo, String userId, String userPwd, String userName, String email, String emailSite,
			String phone, Date enrollDate, String userStatus, String subStatus, int point) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.emailSite = emailSite;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.userStatus = userStatus;
		this.subStatus = subStatus;
		this.point = point;
	}
	public Member(int userNo, String userId, String userName, String phone, int buyCount, int saleSum, int point) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
		this.phone = phone;
		this.buyCount = buyCount;
		this.SaleSum = saleSum;
		this.point = point;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailSite() {
		return emailSite;
	}

	public void setEmailSite(String emailSite) {
		this.emailSite = emailSite;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getSubStatus() {
		return subStatus;
	}

	public void setSubStatus(String subStatus) {
		this.subStatus = subStatus;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public int getSaleSum() {
		return SaleSum;
	}

	public void setSaleSum(int saleSum) {
		SaleSum = saleSum;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", emailSite=" + emailSite + ", phone=" + phone + ", enrollDate=" + enrollDate
				+ ", userStatus=" + userStatus + ", subStatus=" + subStatus + ", point=" + point + "]";
	}
	

	
	

}
