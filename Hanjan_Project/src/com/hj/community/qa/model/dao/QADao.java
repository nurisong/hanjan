package com.hj.community.qa.model.dao;

import java.io.FileInputStream;
import static com.hj.common.JDBCTemplate.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.common.model.vo.Attachment;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.qa.model.vo.QA;

public class QADao {
	
	private Properties prop = new Properties();
	
	public QADao() {
		String fileName = QADao.class.getResource("/sql/community/qa/qa-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectListCount(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<QA> selectList(Connection conn, int userNo) {
		
		ArrayList<QA> list = new ArrayList();
		QA qa = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			// System.out.println(userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				qa = new QA();
				
				qa.setQaNo(rset.getInt("QA_NO"));
				// qa.setQaWriter(rset.getString("QA_WRITER")); 작성자 필요없을듯
				qa.setQaTitle(rset.getString("QA_TITLE"));
				qa.setQaContent(rset.getString("QA_CONTENT"));
				qa.setQaDate(rset.getString("QA_DATE"));
				qa.setQaCount(rset.getInt("QA_COUNT"));
				qa.setQaCategory(rset.getString("QA_CATEGORY"));
				qa.setQaReply(rset.getString("QA_REPLY"));
				qa.setQaReplyDate(rset.getString("QA_REPLY_DATE"));
				qa.setQaStatus(rset.getString("QA_STATUS"));
				
				// System.out.println(qa);
				
				list.add(qa);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public QA selectQa(Connection conn, int qaNo) {
		
		QA qa = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectQa");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qaNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				qa = new QA();
				qa.setQaNo(rset.getInt("QA_NO"));
				qa.setQaTitle(rset.getString("QA_TITLE"));
				qa.setQaContent(rset.getString("QA_CONTENT"));
				qa.setQaDate(rset.getString("QA_DATE"));
				qa.setQaCount(rset.getInt("QA_COUNT"));
				qa.setQaCategory(rset.getString("QA_CATEGORY"));
				qa.setQaReply(rset.getNString("QA_REPLY"));
				qa.setQaReplyDate(rset.getString("QA_REPLY_DATE"));
				qa.setQaStatus(rset.getString("QA_STATUS"));
			}
			
			// System.out.println(qa);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return qa;
	}

	public int insertQA(Connection conn, QA qa) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("intsertQA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, qa.getQaWriter());
			pstmt.setString(2, qa.getQaTitle());
			pstmt.setString(3, qa.getQaContent());
			pstmt.setString(4, qa.getQaCategory());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setString(4, at.getCommType());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	

}
