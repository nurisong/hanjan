package com.hj.product_sub.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.community.review.model.vo.Review;
import com.hj.member.model.vo.Shipment;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.vo.Subscription;
import com.hj.product_sub.model.vo.SubscriptionDetail;

public class SubscriptionDao {

	private Properties prop=new Properties();
	
	public SubscriptionDao() {
		
		String fileName=SubscriptionDao.class.getResource("/sql/product_sub/product_sub-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public int subscriptionEnroll1(Connection conn,Subscription subscription) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("subscriptionEnroll1");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, subscription.getSubscriptName());
			pstmt.setInt(2, Integer.parseInt((subscription.getSubscriptPrice())));
			pstmt.setString(3, subscription.getSubscriptImage1());
			pstmt.setString(4, subscription.getSubscriptImage2());
			pstmt.setString(5, subscription.getSubscriptDetail());
			pstmt.setString(6, subscription.getSubscriptMonth());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	public int selectSubscriptNo(Connection conn) {
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		int num=0;
		ArrayList list=new ArrayList();
		String sqq=null;
		
		String sql=prop.getProperty("selectSubscriptNo");

		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				num=rset.getInt("SUB_NO");
												
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return num;
	}
	
	
	
	
	
	
	
	public ArrayList<Product> subscriptionEnroll2(Connection conn,String searchWord){
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		ArrayList<Product> list=new ArrayList();
		
		String sql=prop.getProperty("subscriptionEnroll2");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, '%'+searchWord+'%');
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Product p =new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(rset.getString("PRO_PRICE"));
				p.setProductAlcohol(rset.getString("PRO_ALCOHOL"));
				p.setproductStock(rset.getString("PRO_STOCK"));
				
				list.add(p);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int subscriptionEnroll3(Connection conn,String addProduct,String subscriptNo) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("subscriptionEnroll3");
		
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, subscriptNo);
			pstmt.setString(2, addProduct);
			
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	//데이터 중복 제거
	public int duplicateDelete(Connection conn) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("duplicateDelete");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	//
	
	public int selectScount(Connection conn) {
		
		int slistCount=0;
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("selectScount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				slistCount=rset.getInt("COUNT(*)");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return slistCount;
	}
	
	
	
	public ArrayList<Subscription> selectFirstSpage(Connection conn,int boardLimit){
		
		ResultSet rset=null;
		ArrayList<Subscription> slist=new ArrayList();
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("selectFirstSpage");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardLimit);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Subscription s = new Subscription();
				
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
				s.setSubscriptDetail(rset.getString("SUB_DETAIL"));
				s.setSubscriptStatus(rset.getString("SUB_STATUS"));
				
				
				
				slist.add(s);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return slist;
	}
	
	public ArrayList<Subscription> listBarSetting(Connection conn,int firstNo,int lastNo){
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		ArrayList<Subscription> list=new ArrayList();
		
		String sql=prop.getProperty("listBarSetting");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			
			pstmt.setInt(1, firstNo);
			pstmt.setInt(2, lastNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Subscription s = new Subscription();
				
				
				
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
				s.setSubscriptDetail(rset.getString("SUB_DETAIL"));
				s.setSubscriptStatus(rset.getString("SUB_STATUS"));
				
				list.add(s);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int product_subShowRevise(Connection conn,ArrayList<String> list) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("product_subShowRevise");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			if(list.size()==10) {
				for(int i=1;i<=10;i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
			} else{
				for(int i=1;i<=list.size();i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
				for(int i=(list.size()+1);i<=10;i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(list.size()-1)));
					
					
				}
			}
			

			result=pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
		
	}
	
	
	
	public Subscription product_subUpdate(Connection conn,String checkProduct) {
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		Subscription s=null;
		
		String sql=prop.getProperty("product_subUpdate");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(checkProduct));
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				s=new Subscription();
				
				
				
				s.setSubscriptNo(Integer.parseInt(checkProduct));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
				s.setSubscriptDetail(rset.getString("SUB_DETAIL"));
				s.setSubscriptStatus(rset.getString("SUB_STATUS"));
				s.setSubscriptImage1(rset.getString("SUB_IMAGE1"));
				s.setSubscriptImage2(rset.getString("SUB_IMAGE2"));
				s.setSubscriptStatus(rset.getString("SUB_STATUS"));
				
				
												
								
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return s;

	}
	
	public int updateEnrollSub(Connection conn,Subscription subscription) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("updateEnrollSub");
		
		try {
			pstmt=conn.prepareStatement(sql);
					
			pstmt.setString(1, subscription.getSubscriptName());
			pstmt.setString(2, subscription.getSubscriptPrice());
			pstmt.setString(3, subscription.getSubscriptMonth());
			pstmt.setString(4, subscription.getSubscriptDetail());			
			pstmt.setString(5, subscription.getSubscriptImage1());
			pstmt.setString(6, subscription.getSubscriptImage2());
			pstmt.setString(7, subscription.getSubscriptStatus());
			pstmt.setInt(8, subscription.getSubscriptNo());
		
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
	
		return result;
		
	}
	
	public ArrayList<SubscriptionDetail> selectSubProducts(Connection conn,int subNo) {
		
		ArrayList<SubscriptionDetail> pList=new ArrayList();
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("selectSubProducts");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, subNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				SubscriptionDetail detail=new SubscriptionDetail();
				detail.setSubscriptNo(rset.getInt("SUB_NO"));
				detail.setProductNo(rset.getInt("PRO_NO")); 
				detail.setProductName(rset.getString("PRO_NAME"));
				
				pList.add(detail);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return pList;
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	public ArrayList<Product> enrollUpdateAjax(Connection conn,String searchWord){
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		ArrayList<Product> list=new ArrayList();
		
		String sql=prop.getProperty("enrollUpdateAjax");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, '%'+searchWord+'%');
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				Product p =new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(rset.getString("PRO_PRICE"));
				p.setProductVolume(rset.getString("PRO_VOLUME"));
				p.setProductAlcohol(rset.getString("PRO_ALCOHOL"));
				p.setproductStock(rset.getString("PRO_STOCK"));
				p.setProductType(rset.getString("PRO_TYPE"));
				p.setProductDetail(rset.getString("PRO_DETAIL"));
				p.setProductShow(rset.getString("PRO_SHOW"));
				
				
				
				
				
				
				list.add(p);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	public int subNoDelete(String subscriptNo,Connection conn) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("subNoDelete");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(subscriptNo));
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
	}
	
	
	
	public int subscriptionUpdateLast(String addProduct,String subscriptNo,Connection conn) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("subscriptionUpdateLast");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, subscriptNo);
			pstmt.setString(2, addProduct);
			
			
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
		
		
		
	}
	
	////////////////////////////////////경호
	
public ArrayList<Subscription> userSelectSubList(Connection conn){
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Subscription> subscriptionList = new ArrayList();
		
		String sql = prop.getProperty("userSelectSubList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Subscription s = new Subscription();
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				s.setSubscriptImage1(rset.getString("SUB_IMAGE1"));
				
				subscriptionList.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return subscriptionList;
	}
	
	public ArrayList<Subscription> userSelectSubDetailList(Connection conn, int subscriptionNo){
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Subscription> subDetailList = new ArrayList();
		
		String sql = prop.getProperty("userSelectSubDetailList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, subscriptionNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Subscription s = new Subscription();
				
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				s.setSubscriptImage1(rset.getString("SUB_IMAGE1"));
				s.setSubscriptImage2(rset.getString("SUB_IMAGE2"));
				s.setSubscriptDetail(rset.getString("SUB_DETAIL"));
				s.setSubscriptMonth(rset.getString("SUB_MONTH"));
				
				subDetailList.add(s);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return subDetailList;
	}
	
	public ArrayList<Review> userSelectSubReviewList(Connection conn, int subscriptionNo){
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Review> subReviewList = new ArrayList();
		
		String sql = prop.getProperty("userSelectSubReviewList");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, subscriptionNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				
				r.setRevNo(rset.getInt("REV_NO"));
				r.setRevContent(rset.getString("REV_CONTENT"));
				r.setUserRevRate(rset.getString("REV_RATE"));
				r.setRevWriter(rset.getString("NAME"));
				
				subReviewList.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return subReviewList;
	}
	
	public Shipment userSelectSubShip(Connection conn, int userNo) {
		
		Shipment ship = new Shipment();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userSelectSubShip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				ship.setRecipient(rset.getString("RECIPIENT"));
				ship.setPhone(rset.getString("PHONE"));
				ship.setAddress(rset.getString("ADDRESS"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return ship;
	}
	
	public int userInsertSubscription(Connection conn, int userNo, int subTypeNo) {
		
		int result1 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userInsertSubscription");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, subTypeNo);
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result1;
	}
	
	public int userUpdateSubscription(Connection conn, int userNo) {
		
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userUpdateSubscription");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}
	
	public ArrayList<Subscription> mypageSubLookupList(Connection conn, int userNo){
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		ArrayList<Subscription> mypageSubList = new ArrayList();
		
		String sql = prop.getProperty("mypageSubLookupList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Subscription s = new Subscription();
				s.setSubscriptNo(rset.getInt("SUB_NO"));
				s.setSubscriptName(rset.getString("SUB_NAME"));
				s.setSubscriptPrice(rset.getString("SUB_PRICE"));
				
				mypageSubList.add(s);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mypageSubList;
	}
	
	public int mypageSubDelete(Connection conn, int subNo, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mypageSubDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, subNo);
			
			result = pstmt.executeUpdate();
			
			System.out.println("sub" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	public int mypageUpdateSubStatus(Connection conn , int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mypageUpdateSubStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
			System.out.println("up" + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		} 
		return result;
	}
	
	
}
