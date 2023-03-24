package com.hj.product_sub.model.vo;

public class Subscription {
	private int subscriptNo;//구독상품번호
	private String subscriptName;//구독상품명
	private String subscriptPrice;//구독판매가
	private String subscriptImage1;//구독이미지1
	private String subscriptImage2;//구독이미지2
	private String subscriptDetail;//구독상세정보
	private String subscriptMonth;//구독연월
	private String subscriptStatus;//구독상품상태 (Y/N)
	private String subscriptRate;//별점평균
	
	
	public String getSubscriptRate() {
		return subscriptRate;
	}

	public void setSubscriptRate(String subscriptRate) {
		this.subscriptRate = subscriptRate;
	}

	public Subscription(int subscriptNo, String subscriptName, String subscriptPrice, String subscriptImage1,
			String subscriptImage2, String subscriptDetail, String subscriptMonth, String subscriptStatus,
			String subscriptRate) {
		super();
		this.subscriptNo = subscriptNo;
		this.subscriptName = subscriptName;
		this.subscriptPrice = subscriptPrice;
		this.subscriptImage1 = subscriptImage1;
		this.subscriptImage2 = subscriptImage2;
		this.subscriptDetail = subscriptDetail;
		this.subscriptMonth = subscriptMonth;
		this.subscriptStatus = subscriptStatus;
		this.subscriptRate = subscriptRate;
	}

	public Subscription() {
		super();
	}

	public Subscription(int subscriptNo, String subscriptName, String subscriptPrice, String subscriptImage1,
			String subscriptImage2, String subscriptDetail, String subscriptMonth, String subscriptStatus) {
		super();
		this.subscriptNo = subscriptNo;
		this.subscriptName = subscriptName;
		this.subscriptPrice = subscriptPrice;
		this.subscriptImage1 = subscriptImage1;
		this.subscriptImage2 = subscriptImage2;
		this.subscriptDetail = subscriptDetail;
		this.subscriptMonth = subscriptMonth;
		this.subscriptStatus = subscriptStatus;
	}

	public int getSubscriptNo() {
		return subscriptNo;
	}

	public void setSubscriptNo(int subscriptNo) {
		this.subscriptNo = subscriptNo;
	}

	public String getSubscriptName() {
		return subscriptName;
	}

	public void setSubscriptName(String subscriptName) {
		this.subscriptName = subscriptName;
	}

	public String getSubscriptPrice() {
		return subscriptPrice;
	}

	public void setSubscriptPrice(String subscriptPrice) {
		this.subscriptPrice = subscriptPrice;
	}

	public String getSubscriptImage1() {
		return subscriptImage1;
	}

	public void setSubscriptImage1(String subscriptImage1) {
		this.subscriptImage1 = subscriptImage1;
	}

	public String getSubscriptImage2() {
		return subscriptImage2;
	}

	public void setSubscriptImage2(String subscriptImage2) {
		this.subscriptImage2 = subscriptImage2;
	}

	public String getSubscriptDetail() {
		return subscriptDetail;
	}

	public void setSubscriptDetail(String subscriptDetail) {
		this.subscriptDetail = subscriptDetail;
	}

	public String getSubscriptMonth() {
		return subscriptMonth;
	}

	public void setSubscriptMonth(String subscriptMonth) {
		this.subscriptMonth = subscriptMonth;
	}

	public String getSubscriptStatus() {
		return subscriptStatus;
	}

	public void setSubscriptStatus(String subscriptStatus) {
		this.subscriptStatus = subscriptStatus;
	}

	@Override
	public String toString() {
		return "Subscription [subscriptNo=" + subscriptNo + ", subscriptName=" + subscriptName + ", subscriptPrice="
				+ subscriptPrice + ", subscriptImage1=" + subscriptImage1 + ", subscriptImage2=" + subscriptImage2
				+ ", subscriptDetail=" + subscriptDetail + ", subscriptMonth=" + subscriptMonth + ", subscriptStatus="
				+ subscriptStatus + "]";
	}
	
	
	
	
}
