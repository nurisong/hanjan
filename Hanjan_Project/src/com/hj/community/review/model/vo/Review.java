package com.hj.community.review.model.vo;

public class Review {
	
	private int revNo; //REV_NO	NUMBER
	private String revWriter; //REV_WRITER	NUMBER
	private int revProductNo;
	private String revProduct; //PRO_NO	NUMBER
	private String revContent; //REV_CONTENT	VARCHAR2(4000 BYTE)
	private String revDate; //REV_DATE	DATE
	private int revRate; //REV_RATE	NUMBER
	private String revReply; //REV_REPLY	VARCHAR2(4000 BYTE)
	private String revReplyDate; //REV_REPLY_DATE	DATE
	private String revStatus; //REV_STATUS	VARCHAR2(1 BYTE)
	private int revCount; //REV_COUNT	NUMBER
	private String revType; // R or S (리뷰 or 구독후기)
	private String revImg; // 첨부한 이미지
	private String userRevRate;//
	
	public String getUserRevRate() {
		return userRevRate;
	}
	public void setUserRevRate(String userRevRate) {
		this.userRevRate = userRevRate;
	}
	public Review() {
		super();
	}
	public Review(int revNo, String revWriter, int revProductNo, String revProduct, String revContent, String revDate, int revRate,
			String revReply, String revReplyDate, String revStatus, int revCount, String revType, String revImg) {
		super();
		this.revNo = revNo;
		this.revWriter = revWriter;
		this.revProductNo = revProductNo;
		this.revProduct = revProduct;
		this.revContent = revContent;
		this.revDate = revDate;
		this.revRate = revRate;
		this.revReply = revReply;
		this.revReplyDate = revReplyDate;
		this.revStatus = revStatus;
		this.revCount = revCount;
		this.revType = revType;
		this.revImg = revImg;
	}
	
	public final int getRevProductNo() {
		return revProductNo;
	}
	public final void setRevProductNo(int revProductNo) {
		this.revProductNo = revProductNo;
	}
	public final String getRevImg() {
		return revImg;
	}
	public final void setRevImg(String revImg) {
		this.revImg = revImg;
	}
	public final int getRevNo() {
		return revNo;
	}
	public final void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public final String getRevWriter() {
		return revWriter;
	}
	public final void setRevWriter(String revWriter) {
		this.revWriter = revWriter;
	}
	public final String getRevProduct() {
		return revProduct;
	}
	public final void setRevProduct(String revProduct) {
		this.revProduct = revProduct;
	}
	public final String getRevContent() {
		return revContent;
	}
	public final void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public final String getRevDate() {
		return revDate;
	}
	public final void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public final int getRevRate() {
		return revRate;
	}
	public final void setRevRate(int revRate) {
		this.revRate = revRate;
	}
	public final String getRevReply() {
		return revReply;
	}
	public final void setRevReply(String revReply) {
		this.revReply = revReply;
	}
	public final String getRevReplyDate() {
		return revReplyDate;
	}
	public final void setRevReplyDate(String revReplyDate) {
		this.revReplyDate = revReplyDate;
	}
	public final String getRevStatus() {
		return revStatus;
	}
	public final void setRevStatus(String revStatus) {
		this.revStatus = revStatus;
	}
	public final int getRevCount() {
		return revCount;
	}
	public final void setRevCount(int revCount) {
		this.revCount = revCount;
	}
	public final String getRevType() {
		return revType;
	}
	public final void setRevType(String revType) {
		this.revType = revType;
	}
	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", revWriter=" + revWriter + ", revProductNo=" + revProductNo
				+ ", revProduct=" + revProduct + ", revContent=" + revContent + ", revDate=" + revDate + ", revRate="
				+ revRate + ", revReply=" + revReply + ", revReplyDate=" + revReplyDate + ", revStatus=" + revStatus
				+ ", revCount=" + revCount + ", revType=" + revType + ", revImg=" + revImg + "]";
	}
	
	
	
}
