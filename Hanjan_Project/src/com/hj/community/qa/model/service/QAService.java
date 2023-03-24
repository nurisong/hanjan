package com.hj.community.qa.model.service;

import static com.hj.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.Attachment;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.dao.BoardDao;
import com.hj.community.qa.model.dao.QADao;
import com.hj.community.qa.model.vo.QA;

public class QAService {

	public int selectListCount(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new QADao().selectListCount(conn, userNo);
		
		close(conn);
		
		return result;
	}

	public ArrayList<QA> selectList(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<QA> list = new QADao().selectList(conn, userNo);
		
		close(conn);
		
		return list;
	}

	public QA selectQa(int qaNo) {
		
		Connection conn = getConnection();
		
		QA qa = new QADao().selectQa(conn, qaNo);
		
		close(conn);
		
		return qa;
	}

	public int intsertQA(QA qa, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new QADao().insertQA(conn, qa);
		
		int result2 = 1;
		
		if(at != null) {
			result2 = new QADao().insertAttachment(conn, at);
		}
		
		if(result1*result2 > 0) commit(conn);
		else rollback(conn);
		
		return (result1 * result2);
	}

}
