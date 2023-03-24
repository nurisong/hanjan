package com.hj.community.qa.model.vo;

public class QA {
	
	private int qaNo; //QA_NO	NUMBER
	private String qaWriter; //QA_WRITER	NUMBER
	private String qaTitle; //QA_TITLE	VARCHAR2(50 BYTE)
	private String qaContent; //QA_CONTENT	VARCHAR2(4000 BYTE)
	private String qaDate; //QA_DATE	DATE
	private int qaCount; //QA_COUNT	NUMBER
	private String qaCategory; //QA_CATEGORY	VARCHAR2(50 BYTE)
	private String qaReply; //QA_REPLY	VARCHAR2(4000 BYTE)
	private String qaReplyDate; //QA_REPLY_DATE	DATE
	private String qaStatus; //QA_STATUS	VARCHAR2(1 BYTE)
	
	public QA() {
		super();
	}
	public QA(int qaNo, String qaWriter, String qaTitle, String qaContent, String qaDate, int qaCount,
			String qaCategory, String qaReply, String qaReplyDate, String qaStatus) {
		super();
		this.qaNo = qaNo;
		this.qaWriter = qaWriter;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaDate = qaDate;
		this.qaCount = qaCount;
		this.qaCategory = qaCategory;
		this.qaReply = qaReply;
		this.qaReplyDate = qaReplyDate;
		this.qaStatus = qaStatus;
	}
	
	public final int getQaNo() {
		return qaNo;
	}
	public final void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public final String getQaWriter() {
		return qaWriter;
	}
	public final void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}
	public final String getQaTitle() {
		return qaTitle;
	}
	public final void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public final String getQaContent() {
		return qaContent;
	}
	public final void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public final String getQaDate() {
		return qaDate;
	}
	public final void setQaDate(String qaDate) {
		this.qaDate = qaDate;
	}
	public final int getQaCount() {
		return qaCount;
	}
	public final void setQaCount(int qaCount) {
		this.qaCount = qaCount;
	}
	public final String getQaCategory() {
		return qaCategory;
	}
	public final void setQaCategory(String qaCategory) {
		this.qaCategory = qaCategory;
	}
	public final String getQaReply() {
		return qaReply;
	}
	public final void setQaReply(String qaReply) {
		this.qaReply = qaReply;
	}
	public final String getQaReplyDate() {
		return qaReplyDate;
	}
	public final void setQaReplyDate(String qaReplyDate) {
		this.qaReplyDate = qaReplyDate;
	}
	public final String getQaStatus() {
		return qaStatus;
	}
	public final void setQaStatus(String qaStatus) {
		this.qaStatus = qaStatus;
	}
	@Override
	public String toString() {
		return "QA [qaNo=" + qaNo + ", qaWriter=" + qaWriter + ", qaTitle=" + qaTitle + ", qaContent=" + qaContent
				+ ", qaDate=" + qaDate + ", qaCount=" + qaCount + ", qaCategory=" + qaCategory + ", qaReply=" + qaReply
				+ ", qaReplyDate=" + qaReplyDate + ", qaStatus=" + qaStatus + "]";
	}
	
	

}
