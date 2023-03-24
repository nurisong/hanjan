package com.hj.order.model.vo;

public class Cart {
	
	private int cartNo; //CART_NO
	private int userNo; //USER_NO
	private int proNo; //PRO_NO
	private int orderCount; //ORDER_COUNT
	
	private int proPrice;		// 상품가격
	private String proName;		// 상품명
	private String proDetail;	// 상세설명 
	private String proImage1;	// 이미지1
	
	public Cart() {
	}

	public Cart(int cartNo, int userNo, int proNo, int orderCount) {
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.proNo = proNo;
		this.orderCount = orderCount;
	}
	
	public Cart(int cartNo, int userNo, int proNo, int orderCount, int proPrice, String proName, String proDetail,
			String proImage1) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.proNo = proNo;
		this.orderCount = orderCount;
		this.proPrice = proPrice;
		this.proName = proName;
		this.proDetail = proDetail;
		this.proImage1 = proImage1;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProDetail() {
		return proDetail;
	}

	public void setProDetail(String proDetail) {
		this.proDetail = proDetail;
	}

	public String getProImage1() {
		return proImage1;
	}

	public void setProImage1(String proImage1) {
		this.proImage1 = proImage1;
	}

	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userNo=" + userNo + ", proNo=" + proNo + ", orderCount=" + orderCount
				+ ", proPrice=" + proPrice + ", proName=" + proName + ", proDetail=" + proDetail + ", proImage1="
				+ proImage1 + "]";
	}

	
	
	
	
	
}
