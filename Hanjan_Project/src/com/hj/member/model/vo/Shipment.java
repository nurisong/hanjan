package com.hj.member.model.vo;

public class Shipment {
	private int shipNo;
	private int userNo;
	private String shipName;
	private String recipient;
	private int postcode;
	private String address;
	private String detailAddress;
	private String phone;
	private String basicShip;
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
