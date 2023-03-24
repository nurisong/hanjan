package com.hj.order.model.vo;

import java.util.Date;

public class Order {
	private int orderNo; //ORDER_NO	NUMBER
	private int memNo; //MEM_NO	NUMBER
	private int shipNo; //SHIP_NO	NUMBER
	private Date orderDate; //ORDER_DATE	DATE
	private int orderPrice;//ORDER_PRICE	NUMBER
	private String orderCheck;//ORDER_CHECK	VARCHAR2(20 BYTE)
	private String orderTool; //ORDER_TOOL	VARCHAR2(20 BYTE)
	private String orderYM; // OrderDate에서 년월만 받는 객체
	
	
	public Order(int orderPrice, String orderYM) {
		super();
		this.orderPrice = orderPrice;
		this.orderYM = orderYM;
	}

	public String getOrderYM() {
		return orderYM;
	}

	public void setOrderYM(String orderYM) {
		this.orderYM = orderYM;
	}

	public Order(){}
	
	public Order(int orderNo, int memNo, int shipNo, Date orderDate, int orderPrice, String orderCheck,
			String orderTool) {
		super();
		this.orderNo = orderNo;
		this.memNo = memNo;
		this.shipNo = shipNo;
		this.orderDate = orderDate;
		this.orderPrice = orderPrice;
		this.orderCheck = orderCheck;
		this.orderTool = orderTool;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getShipNo() {
		return shipNo;
	}
	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
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
		return "Order [orderNo=" + orderNo + ", memNo=" + memNo + ", shipNo=" + shipNo + ", orderDate=" + orderDate
				+ ", orderPrice=" + orderPrice + ", orderCheck=" + orderCheck + ", orderTool=" + orderTool + "]";
	}
	
	
	
	
}
