package com.hj.product_sub.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.commit;
import static com.hj.common.JDBCTemplate.getConnection;
import static com.hj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.community.review.model.vo.Review;
import com.hj.member.model.vo.Shipment;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.dao.SubscriptionDao;
import com.hj.product_sub.model.vo.Subscription;
import com.hj.product_sub.model.vo.SubscriptionDetail;

public class SubscriptionService {

	public int subscriptionEnroll1(Subscription subscription){
		
		Connection conn=getConnection();
		
		int result=new SubscriptionDao().subscriptionEnroll1(conn,subscription);
		
		if(result>0) {
			
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<Product> subscriptionEnroll2(String searchWord) {
		
		Connection conn=getConnection();
		
		ArrayList<Product> list=new SubscriptionDao().subscriptionEnroll2(conn, searchWord);
		
		close(conn);
		
		return list;
		
	}
	
	public int selectSubscriptNo() {
		
		Connection conn=getConnection();
		
		int num=new SubscriptionDao().selectSubscriptNo(conn);
		
		close(conn);
		
		return num;
		
	}
	
	
	public int subscriptionEnroll3(ArrayList<String> addProductlist, String subscriptNo) {
		
		Connection conn=getConnection();
		int result=0;
		for(int i=0;i<addProductlist.size();i++) {
			String addProduct=addProductlist.get(i);
			result=new SubscriptionDao().subscriptionEnroll3(conn,addProduct,subscriptNo);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		
		
		
		close(conn);
		
		return result;
	}
	//중복지우기
	public int duplicateDelete() {
		
		Connection conn=getConnection();
		
		int result=new SubscriptionDao().duplicateDelete(conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	//
	
	
	public int selectScount() {
		
		Connection conn=getConnection();
		
		int slistCount=new SubscriptionDao().selectScount(conn);
		
		close(conn);
		
		return slistCount;
	}
	
	
	public ArrayList<Subscription> selectFirstSpage(int boardLimit) {
		
		Connection conn=getConnection();
		
		ArrayList<Subscription> list=new SubscriptionDao().selectFirstSpage(conn,boardLimit);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Subscription> listBarSetting(int firstNo,int lastNo) {
		
		Connection conn=getConnection();
		
		ArrayList<Subscription> list=new SubscriptionDao().listBarSetting(conn,firstNo,lastNo);
		
		close(conn);
		
		return list;
		
	}
	
	public int product_subShowRevise(ArrayList<String> list) {
		
		Connection conn=getConnection();
		
		int result=new SubscriptionDao().product_subShowRevise(conn,list);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Subscription product_subUpdate(String checkProduct) {
		
		Connection conn=getConnection();
		
		Subscription subscription=new SubscriptionDao().product_subUpdate(conn,checkProduct);
		
		close(conn);
		
		return subscription;
	}
	
	public int updateEnrollSub(Subscription subscription) {
		
		Connection conn=getConnection();
		
		int result=new SubscriptionDao().updateEnrollSub(conn,subscription);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public ArrayList<SubscriptionDetail> selectSubProducts(int subNo) {
		
		Connection conn=getConnection();
		
		ArrayList<SubscriptionDetail> pList=new SubscriptionDao().selectSubProducts(conn,subNo);
		
		close(conn);
		System.out.println("---");
		System.out.println(pList);
		System.out.println(pList.size());
		System.out.println("---");
		
		return pList;
		
		
	}
	
	
	
	
	
	
	
	
	public ArrayList<Product> enrollUpdateAjax(String searchWord) {
		
		Connection conn=getConnection();
		
		ArrayList<Product> list=new SubscriptionDao().enrollUpdateAjax(conn, searchWord);
		
		close(conn);
		
		return list;
		
	}
	public int subNoDelete(String subscriptNo) {
		
		Connection conn=getConnection();
		
		int result=new SubscriptionDao().subNoDelete(subscriptNo,conn);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	public int subscriptionUpdateLast(ArrayList<String> addProductlist,String subscriptNo) {
		
		Connection conn=getConnection();
		int result=0;
		for(int i=0;i<addProductlist.size();i++) {
			String addProduct=addProductlist.get(i);
			result=new SubscriptionDao().subscriptionUpdateLast(addProduct,subscriptNo,conn);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}	
		
		
		close(conn);
		
		return result;
		
	}

	///////////////////////////////////////////////경호꺼
	
public ArrayList<Subscription> userSelectSubList(){
		
		Connection conn = getConnection();
		
		ArrayList<Subscription> subscriptionList = new SubscriptionDao().userSelectSubList(conn);
			
		close(conn);
		
		return subscriptionList;
	}
	
	public ArrayList<Subscription> userSelectSubDetailList(int subscriptionNo){
		
		Connection conn = getConnection();
		
		ArrayList<Subscription> subDetailList = new SubscriptionDao().userSelectSubDetailList(conn, subscriptionNo);
		
		close(conn);
		
		return subDetailList;
				
		
	}
	public ArrayList<Review> userSelectSubReviewList(int subscriptionNo){
		
		Connection conn = getConnection();
		
		ArrayList<Review> subReviewList = new SubscriptionDao().userSelectSubReviewList(conn, subscriptionNo);
		
		close(conn);
		
		return subReviewList;
		
	}
	
	public Shipment userSelectSubShip(int userNo) {
		
		Connection conn = getConnection();
		
		Shipment ship = new SubscriptionDao().userSelectSubShip(conn, userNo);
		
		close(conn);
		
		return ship;
		
	}
	
	public int userInsertSubscription(int userNo, int subTypeNo) {
		
		Connection conn = getConnection();
		
		int result1 = new SubscriptionDao().userInsertSubscription(conn, userNo, subTypeNo);
		
		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}
	
	public int userUpdateSubscription(int userNo) {
		
		Connection conn = getConnection();
		
		int result2 = new SubscriptionDao().userUpdateSubscription(conn, userNo);
		
		if (result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result2;
	}
	
	public ArrayList<Subscription> mypageSubLookupList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Subscription> mypageSubList = new SubscriptionDao().mypageSubLookupList(conn, userNo);
		
		close(conn);
		
		return mypageSubList;
	}
	
	public int mypageSubDelete(int subNo, int userNo) {
		
		Connection conn = getConnection();
		
		int result = new SubscriptionDao().mypageSubDelete(conn, subNo, userNo);
		
		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int mypageUpdateSubStatus(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new SubscriptionDao().mypageUpdateSubStatus(conn, userNo);
		
		if ( result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	

}
