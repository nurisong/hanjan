package com.hj.community.board.model.service;

import static com.hj.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.Attachment;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.dao.BoardDao;
import com.hj.community.board.model.vo.Board;
import com.hj.community.board.model.vo.Reply;
import com.hj.community.review.model.dao.ReviewDao;

public class BoardService {
	
	public int selectListCount(String boardType) {
		
		Connection conn = getConnection();
		int listCount = new BoardDao().selectListCount(conn, boardType);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi, String boardType){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, pi, boardType);
		
		close(conn);
		
		return list;
	}
	
	public int insertBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().insertBoard(conn, b);
		
		int result2 = 1;
		if(at != null) {
			result2 = new BoardDao().insertAttachment(conn, at);
		}
		
		if(result1 * result2 == 1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int increaseCount(int boardNum) {
		
		Connection conn = getConnection();
		
		int count = new BoardDao().increaseCount(conn, boardNum);
		
		if(count > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return count;
	}
	
	public Board selectBoard(int boardNo) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoard(conn, boardNo);
		
		close(conn);
		
		return b;
	}
	
	public Attachment selectAttachment(int boardNo) {
		
		Connection conn = getConnection();
		
		Attachment at = new BoardDao().selectAttachment(conn, boardNo);
		
		close(conn);
		
		return at;
	}
	
	public int updateBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new BoardDao().updateBoard(conn, b);
		
		int result2 = 1;
		if(at != null) {
			
			if(at.getFileNo() != 0) {
				result2 = new BoardDao().updateAttachment(conn, at);
			} else {
				result2 = new BoardDao().insertNewAttachment(conn, at);
			}
		}
		
		if(result1 * result2 > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result1 * result2;
	}
	
	public int deleteBoard(int boardNo, String boardType) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, boardNo, boardType);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertReply(conn, r);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new BoardDao().selectReplyList(conn, boardNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectBoardAList(PageInfo pi, String boardType) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectBoardAList(conn, pi, boardType);
		
		close(conn);
		
		return list;
	}

	public int deleteABoard(String[] bArr) {
		
		Connection conn = getConnection();
		
		int result = 0;
		if(bArr.length > 0) {
			for(int i = 0; i < bArr.length; i++) {
				result = new BoardDao().deleteABoard(conn, bArr[i]);
				if(result == 0) {
					break;
				}
			}	
		}
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int insertNotice(Board b) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertNotice(conn, b);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReply(conn, replyNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		return result;
	}
	
	
}
