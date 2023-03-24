package com.hj.community.board.model.vo;

public class Board {
	
	private int boardNo; //BOARD_NO	NUMBER
	private String boardWriter; //BOARD_WRITER	NUMBER
	private String boardTitle; //BOARD_TITLE	VARCHAR2(50 BYTE)
	private String boardContent; //BOARD_CONTENT	VARCHAR2(4000 BYTE)
	private String boardDate; //BOARD_DATE	DATE
	private int boardCount; //BOARD_COUNT	NUMBER
	private String boardStatus; //BOARD_STATUS	VARCHAR2(1 BYTE)
	private String boardType; //BOARD_TYPE	NUMBER
	public Board() {
		super();
	}
	public Board(int boardNo, String boardWriter, String boardTitle, String boardContent, String boardDate,
			int boardCount, String boardStatus, String boardType) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardCount = boardCount;
		this.boardStatus = boardStatus;
		this.boardType = boardType;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardCount() {
		return boardCount;
	}
	
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public String getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", boardCount=" + boardCount
				+ ", boardStatus=" + boardStatus + ", boardType=" + boardType + "]";
	}
	
}
