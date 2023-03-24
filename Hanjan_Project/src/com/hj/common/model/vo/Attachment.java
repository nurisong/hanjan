package com.hj.common.model.vo;

public class Attachment {
	private int fileNo; //FILE_NO	NUMBER
	private int refNo; //REF_NO	NUMBER
	private String originName; //ORIGIN_NAME	VARCHAR2(300 BYTE)
	private String changeName; //CHANGE_NAME	VARCHAR2(300 BYTE)
	private String filePath; //FILE_PATH	VARCHAR2(1000 BYTE)
	private String uploadDate; //UPLOAD_DATE	DATE
	private String commType; //COMM_TYPE	VARCHAR2(1 BYTE)
	private String attStatus; //ATT_STATUS	VARCHAR2(1 BYTE)
	public Attachment() {
		super();
	}
	public Attachment(int fileNo, int refNo, String originName, String changeName, String filePath,
			String uploadDate, String commType, String attStatus) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.commType = commType;
		this.attStatus = attStatus;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getCommType() {
		return commType;
	}
	public void setCommType(String commType) {
		this.commType = commType;
	}
	public String getAttStatus() {
		return attStatus;
	}
	public void setAttStatus(String attStatus) {
		this.attStatus = attStatus;
	}
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", commType=" + commType
				+ ", attStatus=" + attStatus + "]";
	}
	
	

}
