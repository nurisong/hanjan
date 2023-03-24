package com.hj.community.review.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.commit;
import static com.hj.common.JDBCTemplate.getConnection;
import static com.hj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.Attachment;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.dao.BoardDao;
import com.hj.community.board.model.vo.Board;
import com.hj.community.review.model.dao.ReviewDao;
import com.hj.community.review.model.vo.Review;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.vo.Subscription;

public class ReviewService {
	
	public Product selectProduct(int proNo) {
		
		Connection conn = getConnection();
		
		Product p = new ReviewDao().selectProduct(conn, proNo);
		
		close(conn);
		
		return p;
	}
	
	public Subscription selectSubProduct(int subProNo) {
		
		Connection conn = getConnection();
		
		Subscription s = new ReviewDao().selectSubProduct(conn, subProNo);
		
		close(conn);
		
		return s;
	}
	
	public int insertReview(Review r) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().insertReview(conn, r);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int deleteReview(int revNo, String revType) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, revNo, revType);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int selectListCount(String revType) {
		
		Connection conn = getConnection();
		
		int listCount = new ReviewDao().selectListCount(conn, revType);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Review> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int insertReview(Review r, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, r);
		
		int result2 = 1;
		
		if(list != null) {
			result2 = new ReviewDao().insertAttachment(conn, list);
		}
		
		if(result1 * result2 == 1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result1 * result2;
	}
	
	public Subscription selectListSubProduct(int proNo) {
		
		Connection conn = getConnection();
		
		Subscription s = new ReviewDao().selectListSubProduct(conn, proNo);
		
		close(conn);
		
		return s;
	}
	
	public Review selectSubReview(int subProNo) {
		
		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectSubReview(conn, subProNo);
		
		close(conn);
		
		return r;
	}
	
	public Review selectUpdateReview(int userNo, int sRevNo) {
		
		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectUpdateReview(conn, userNo, sRevNo);
		
		close(conn);
		
		return r;
	}
	
	public ArrayList<Review> selectAList(PageInfo pi, String revType){
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectAList(conn, pi, revType);
		
		close(conn);
		
		return list;
	}
	
	public int updateReply(Review r, int subPrice, String userId, String exContent) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateReply(conn, r);
			
		int result2 = 1;
		
		if(exContent.equals("null")) {
			if(result1 > 0) {
				result2 = new ReviewDao().updatePoint(conn, subPrice, userId);
			}
		}
		
		if((result1 * result2) > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return (result1 * result2);
	}
	
	public int deleteSubRev(String[] rArr) {
		
		Connection conn = getConnection();
		
		int result = 0;
		if(rArr.length > 0) {
			for(int i = 0; i < rArr.length; i++) {
				result = new ReviewDao().deleteSubRev(conn, rArr[i]);
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

	public int updateReview(Review r, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().updateReview(conn, r);
		
		int result2 = 1;
		
		if(list != null) {
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getFileNo() != 0) {
					result2 = new ReviewDao().updateAttachment(conn, list.get(i));
				} else {
					result2 = new ReviewDao().insertNewAttachment(conn, list.get(i));
				}
				if(result2 == 0) break;
			}
		}
		
		if((result1 * result2) == 1) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return (result1 * result2);
	}
	
	public int deleteReview(int revNo) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, revNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public Product selectListProduct(int revProductNo) {
		
		Connection conn = getConnection();
		
		Product p = new ReviewDao().selectListProduct(conn, revProductNo);
		
		close(conn);
		
		return p;
	}

	public ArrayList<Review> selectAListByProName(PageInfo pi, String search) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectAListByProName(conn, pi, search);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Review> selectAListByProNo(PageInfo pi, String search) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectAListByProNo(conn, pi, search);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Attachment> selectAttachmentList(int subRevNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new ReviewDao().selectAttachmentList(conn, subRevNo);
		
		close(conn);
		
		return list;
	}

	
}
