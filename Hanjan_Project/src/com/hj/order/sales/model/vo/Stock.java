package com.hj.order.sales.model.vo;

import java.util.Date;

public class Stock {

	
	private int productNo;//PRO_NO	NUMBER
	private int sale;//SALE	NUMBER
	private Date soldOutDate;//SOLDOUT_DATE	DATE
	private String productName;


	public Stock(int productNo, int sale, Date soldOutDate, String productName) {
		super();
		this.productNo = productNo;
		this.sale = sale;
		this.soldOutDate = soldOutDate;
		this.productName = productName;
	}

	public Stock() {
		super();
	}
	
	public Stock(int productNo, int sale, Date soldOutDate) {
		super();
		this.productNo = productNo;
		this.sale = sale;
		this.soldOutDate = soldOutDate;
	}

	public int getProductNo() {
		return productNo;
	}

	public int getSale() {
		return sale;
	}

	public Date getSoldOutDate() {
		return soldOutDate;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public void setSoldOutDate(Date soldOutDate) {
		this.soldOutDate = soldOutDate;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Override
	public String toString() {
		return "Stock [productNo=" + productNo + ", sale=" + sale + ", soldOutDate=" + soldOutDate + "]";
	}

	
	
	
	
}
