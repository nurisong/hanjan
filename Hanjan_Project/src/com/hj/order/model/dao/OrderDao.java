package com.hj.order.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.order.model.vo.Shipment;
import com.hj.order.model.vo.Cart;
import com.hj.order.model.vo.OrderMain;
import com.hj.product.model.dao.ProductDao;
import com.hj.product.model.vo.Product;

public class OrderDao {

	private Properties prop = new Properties();
	
	public OrderDao() {
		String fileName=ProductDao.class.getResource("/sql/order/order-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int userInsertCart(Connection conn, Cart c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("userInsertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c.getUserNo());
			pstmt.setInt(2, c.getProNo());
			pstmt.setInt(3, c.getOrderCount());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
public ArrayList<Cart> selectCartList(Connection conn, int userNo){
		
		ArrayList<Cart> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartList");
		
//		System.out.println(userNo);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				//System.out.println("if문 입장!!");
				
				Cart c = new Cart();
				
				c.setCartNo(rset.getInt("CART_NO"));
				c.setUserNo(rset.getInt("USER_NO"));
				c.setProNo(rset.getInt("PRO_NO"));
				c.setOrderCount(rset.getInt("ORDER_COUNT"));
				c.setProName(rset.getString("PRO_NAME"));
				c.setProPrice(rset.getInt("PRO_PRICE"));
				c.setProDetail(rset.getString("PRO_DETAIL"));
				c.setProImage1(rset.getString("PRO_IMAGE1"));
				
				list.add(c);
				
			}
			//System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	/*
	public int orderConfirm(Connection conn, int userNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("orderConfirm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			OrderMain om = new OrderMain();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
		*/
	
	public Product preOrder(Connection conn, int productNo) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("preOrder");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new Product(rset.getInt("PRO_NO"),
								rset.getString("PRO_NAME"),
								String.valueOf(rset.getInt("PRO_PRICE")),
								String.valueOf(rset.getInt("PRO_ALCOHOL")),
								rset.getString("PRO_IMAGE1"));
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
		
	}
	
	public int insertOrderSheet(Connection conn, OrderMain om) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrderSheet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, om.getUserNo());
			pstmt.setInt(2, om.getShipNo());
			pstmt.setInt(3, om.getOrderPrice());
			pstmt.setString(4, om.getOrderTool());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertOrderProSheet(Connection conn, OrderMain om) {
		
		int result2 = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOrderProSheet");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, om.getOrderProductNo());
			pstmt.setInt(2, om.getOrderCount());
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}
	
	public Shipment myPageOrderList(Connection conn, int userNo) {
		
		Shipment orderShip = new Shipment();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("myPageOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				orderShip.setShipName(rset.getString("SHIP_NAME"));
				orderShip.setRecipient(rset.getString("RECIPIENT"));
				orderShip.setAddress(rset.getString("ADDRESS"));
				orderShip.setPhone(rset.getString("PHONE"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return orderShip;
	}
	
	public ArrayList<OrderMain> myPageOrderProductList(Connection conn, int userNo) {
		
		ArrayList<OrderMain> orderProductList = new ArrayList<OrderMain>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("myPageOrderProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				OrderMain o = new OrderMain();
				
				o.setOrderDate(rset.getString("ORDER_DATE"));
				o.setOrderPrice(rset.getInt("ORDER_PRICE"));
				o.setOrderCount(rset.getInt("ORDER_COUNT"));
				o.setOrderProductName(rset.getString("PRO_NAME"));
				o.setOrderProductVolume(rset.getString("PRO_VOLUME"));
				o.setOrderProductAlcohol(rset.getString("PRO_ALCOHOL"));
				o.setOrderProductDetail(rset.getString("PRO_DETAIL"));
				o.setOrderProductImage1(rset.getString("PRO_IMAGE1"));
				
				orderProductList.add(o);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return orderProductList;
		
	}
}
