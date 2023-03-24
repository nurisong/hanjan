package com.hj.product_sub.model.vo;

public class SubscriptionDetail {
	
	private int subscriptNo;//구독상품번호
	private int productNo;//구독상품명
	private String subscriptEnrollDate;//등록날짜
	private String productName;//상품이름
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public SubscriptionDetail(int subscriptNo, int productNo, String subscriptEnrollDate, String productName) {
		super();
		this.subscriptNo = subscriptNo;
		this.productNo = productNo;
		this.subscriptEnrollDate = subscriptEnrollDate;
		this.productName = productName;
	}
	public SubscriptionDetail() {
		super();
	}
	public SubscriptionDetail(int subscriptNo, int productNo, String subscriptEnrollDate) {
		super();
		this.subscriptNo = subscriptNo;
		this.productNo = productNo;
		this.subscriptEnrollDate = subscriptEnrollDate;
	}
	public int getSubscriptNo() {
		return subscriptNo;
	}
	public void setSubscriptNo(int subscriptNo) {
		this.subscriptNo = subscriptNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getSubscriptEnrollDate() {
		return subscriptEnrollDate;
	}
	public void setSubscriptEnrollDate(String subscriptEnrollDate) {
		this.subscriptEnrollDate = subscriptEnrollDate;
	}
	@Override
	public String toString() {
		return "SubscriptionDetail [subscriptNo=" + subscriptNo + ", productNo=" + productNo + ", subscriptEnrollDate="
				+ subscriptEnrollDate + ", productName=" + productName + "]";
	}
	
	
	
	
	
}
