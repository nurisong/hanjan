package com.hj.order.model.vo;

public class OrderMain {

	private int orderNo;			// 주문번호
	private int userNo;				// 유저번호
	private int shipNo;				// 배송지번호
	private int orderProductNo;
	private String orderDate;		// 주문날짜 1
	private int orderPrice;			// 주문가격 2
	private String orderCheck;		// 주문여부
	private String orderTool;		// 주문수단
	private int orderCount; // 3
	private String orderProductName; // 4
	private String orderProductVolume; // 5
	private String orderProductAlcohol; // 6
	private String orderProductDetail; // 7
	private String orderProductImage1; // 8
	
	public OrderMain() {
		super();
	}

	public OrderMain(int orderNo, int userNo, int shipNo, String orderDate, int orderPrice, String orderCheck,
			String orderTool) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.shipNo = shipNo;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderCheck = orderCheck;
		this.orderTool = orderTool;
	}
	
	

	public String getOrderProductVolume() {
		return orderProductVolume;
	}

	public void setOrderProductVolume(String orderProductVolume) {
		this.orderProductVolume = orderProductVolume;
	}

	public String getOrderProductAlcohol() {
		return orderProductAlcohol;
	}

	public void setOrderProductAlcohol(String orderProductAlcohol) {
		this.orderProductAlcohol = orderProductAlcohol;
	}

	public String getOrderProductDetail() {
		return orderProductDetail;
	}

	public void setOrderProductDetail(String orderProductDetail) {
		this.orderProductDetail = orderProductDetail;
	}

	public String getOrderProductImage1() {
		return orderProductImage1;
	}

	public void setOrderProductImage1(String orderProductImage1) {
		this.orderProductImage1 = orderProductImage1;
	}

	public String getOrderProductName() {
		return orderProductName;
	}

	public void setOrderProductName(String orderProductName) {
		this.orderProductName = orderProductName;
	}

	public int getOrderProductNo() {
		return orderProductNo;
	}

	public void setOrderProductNo(int orderProductNo) {
		this.orderProductNo = orderProductNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getShipNo() {
		return shipNo;
	}

	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getOrderCheck() {
		return orderCheck;
	}

	public void setOrderCheck(String orderCheck) {
		this.orderCheck = orderCheck;
	}

	public String getOrderTool() {
		return orderTool;
	}

	public void setOrderTool(String orderTool) {
		this.orderTool = orderTool;
	}

	@Override
	public String toString() {
		return "OrderMain [orderNo=" + orderNo + ", userNo=" + userNo + ", shipNo=" + shipNo + ", orderDate="
				+ orderDate + ", orderPrice=" + orderPrice + ", orderCheck=" + orderCheck + ", orderTool=" + orderTool
				+ "]";
	}
	
	

}
