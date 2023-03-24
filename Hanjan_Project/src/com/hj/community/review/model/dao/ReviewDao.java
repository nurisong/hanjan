package com.hj.community.review.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.common.model.vo.Attachment;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.vo.Board;
import com.hj.community.review.model.vo.Review;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.vo.Subscription;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	
	public ReviewDao() {
	
	String fileName = ReviewDao.class.getResource("/sql/community/review-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Product selectProduct(Connection conn, int proNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(String.valueOf(rset.getInt("PRO_PRICE")));
				p.setProductImage1(rset.getString("PRO_IMAGE1"));
				p.setProductRate(rset.getString("PRO_RATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}
	
	public Subscription selectSubProduct(Connection conn, int subProNo) {
		
		Subscription s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, subProNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Subscription();
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(String.valueOf(rset.getInt("SUB_PRICE")));
				s.setSubscriptImage1(rset.getString("SUB_IMAGE1"));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
	
	public int insertReview(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(r.getRevWriter()));
			pstmt.setInt(2, Integer.parseInt(r.getRevProduct()));
			pstmt.setString(3, r.getRevContent());
			pstmt.setInt(4, r.getRevRate());
			pstmt.setString(5, r.getRevType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteReview(Connection conn, int revNo, String revType) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			pstmt.setString(2, revType);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int selectListCount(Connection conn, String revType) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, revType);
			
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
	
	public ArrayList<Review> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevProductNo(rset.getInt("PRO_NO"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				r.setRevWriter(rset.getString("USER_ID"));
				r.setRevDate(rset.getString("REV_DATE"));
				r.setRevRate(rset.getInt("REV_RATE"));
				r.setRevImg(rset.getString("REV_IMG"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertAttachment(Connection conn, ArrayList<Attachment> list) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			
			for(Attachment at : list) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setString(4, at.getCommType());
				
				result *= pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Subscription selectListSubProduct(Connection conn, int proNo) {
		
		Subscription s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListSubProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, proNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				s = new Subscription();
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptImage1(rset.getString("SUB_IMAGE1"));
				s.setSubscriptPrice(String.valueOf(rset.getInt("SUB_PRICE")));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
	
	public Review selectSubReview(Connection conn, int subProNo) {
		
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSubReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, subProNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevWriter(rset.getString("USER_ID"));
				r.setRevDate(rset.getString("REV_DATE"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				r.setRevProduct(String.valueOf(rset.getInt("PRO_NO")));
				r.setRevImg(rset.getString("REV_IMG"));
				r.setRevRate(rset.getInt("REV_RATE"));
				r.setRevReply(rset.getString("REV_REPLY"));
				r.setRevReplyDate(rset.getString("REP_DATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return r;
	}
	
	public Review selectUpdateReview(Connection conn, int userNo, int sRevNo) {
		
		Review r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUpdateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sRevNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new Review();
				
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				r.setRevProductNo(rset.getInt("PRO_NO"));
				r.setRevImg(rset.getString("REV_IMG"));
				r.setRevRate(rset.getInt("REV_RATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return r;
	}
	
	public ArrayList<Review> selectAList(Connection conn, PageInfo pi, String revType){
		
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, revType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevProductNo(rset.getInt("PRO_NO"));
				r.setRevWriter(rset.getString("USER_ID"));
				r.setRevDate(rset.getString("REV_DATE"));
				r.setRevReply(rset.getString("REV_REPLY"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int updateReply(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRevReply());
			pstmt.setInt(2, r.getRevNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updatePoint(Connection conn, int subPrice, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePoint");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, subPrice);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteSubRev(Connection conn, String revNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSubRev");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(revNo));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateReview(Connection conn, Review r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r.getRevContent());
			pstmt.setInt(2, r.getRevRate());
			pstmt.setInt(3, r.getRevNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertNewAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setString(5, at.getCommType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			pstmt.setString(5, at.getCommType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteReview(Connection conn, int revNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return result;
	}

	public Product selectListProduct(Connection conn, int revProductNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revProductNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product();
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(String.valueOf(rset.getInt("PRO_PRICE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	public ArrayList<Review> selectAListByProName(Connection conn, PageInfo pi, String search) {
		
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAListByProName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevProductNo(rset.getInt("PRO_NO"));
				r.setRevWriter(rset.getString("USER_ID"));
				r.setRevDate(rset.getString("REV_DATE"));
				r.setRevReply(rset.getString("REV_REPLY"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Review> selectAListByProNo(Connection conn, PageInfo pi, String search) {
		
		ArrayList<Review> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAListByProNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevProductNo(rset.getInt("PRO_NO"));
				r.setRevWriter(rset.getString("USER_ID"));
				r.setRevDate(rset.getString("REV_DATE"));
				r.setRevReply(rset.getString("REV_REPLY"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int subRevNo) {
		
		ArrayList<Attachment> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, subRevNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
}
