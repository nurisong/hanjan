package com.hj.community.notice.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.vo.Board;
import com.hj.community.notice.model.dao.NoticeDao;

public class NoticeService {
	
public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new NoticeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		ArrayList<Board> list = new NoticeDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

}
