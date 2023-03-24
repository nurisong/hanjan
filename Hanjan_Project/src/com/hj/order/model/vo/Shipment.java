package com.hj.order.model.vo;

public class Shipment {

	private int shipNo;	// 배송지번호	
	private int userNo;	// 회원번호
	private String shipName;	// 배송지명
	private String recipient;	// 수령인
	private int postcode;		// 우편번호
	private String address;		// 주소
	private String detailAddress;	// 상세주소
	private String phone;		// 전화번호
	private String basicShip;	// 기본배송지
	
	public Shipment() {
		super();
	}

	public Shipment(int shipNo, int userNo, String shipName, String recipient, int postcode, String address,
			String detailAddress, String phone, String basicShip) {
		super();
		this.shipNo = shipNo;
		this.userNo = userNo;
		this.shipName = shipName;
		this.recipient = recipient;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.phone = phone;
		this.basicShip = basicShip;
	}

	public int getShipNo() {
		return shipNo;
	}

	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public int getPostcode() {
		return postcode;
	}

	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBasicShip() {
		return basicShip;
	}

	public void setBasicShip(String basicShip) {
		this.basicShip = basicShip;
	}

	@Override
	public String toString() {
		return "Shipment [shipNo=" + shipNo + ", userNo=" + userNo + ", shipName=" + shipName + ", recipient="
				+ recipient + ", postcode=" + postcode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", phone=" + phone + ", basicShip=" + basicShip + "]";
	}
	
	
	
}
