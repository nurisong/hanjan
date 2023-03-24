package com.hj.community.board.model.vo;

public class Reply {
	
	private int replyNo; //REPLY_NO	NUMBER
	private int replyBno; //BOARD_NO	NUMBER
	private String replyWriter; //REPLY_WRITER	NUMBER
	private String replyContent; //REPLY_CONTENT	VARCHAR2(500 BYTE)
	private String replyDate; //REPLY_DATE	DATE
	private String replyStatus; //REPLY_STATUS	VARCHAR2(1 BYTE)
	
	public Reply() {
		super();
	}
	public Reply(int replyNo, int replyBno, String replyWriter, String replyContent, String replyDate,
			String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.replyBno = replyBno;
		this.replyWriter = replyWriter;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyStatus = replyStatus;
	}
	
	public final int getReplyNo() {
		return replyNo;
	}
	public final void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public final int getReplyBno() {
		return replyBno;
	}
	public final void setReplyBno(int replyBno) {
		this.replyBno = replyBno;
	}
	public final String getReplyWriter() {
		return replyWriter;
	}
	public final void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public final String getReplyContent() {
		return replyContent;
	}
	public final void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public final String getReplyDate() {
		return replyDate;
	}
	public final void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public final String getReplyStatus() {
		return replyStatus;
	}
	public final void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyBno=" + replyBno + ", replyWriter=" + replyWriter + ", replyContent="
				+ replyContent + ", replyDate=" + replyDate + ", replyStatus=" + replyStatus + "]";
	}
	
	

}
