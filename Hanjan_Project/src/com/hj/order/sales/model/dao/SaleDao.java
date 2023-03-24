package com.hj.order.sales.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.order.model.vo.Order;
import com.hj.order.sales.model.vo.Stock;

public class SaleDao {
	
	private Properties prop = new Properties();
	
	public SaleDao() {
		String fileName = SaleDao.class.getResource("/sql/order/sales-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	

	public ArrayList<Order> saleList(Connection conn) {
		
		ArrayList<Order> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("saleList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				

				Order o = new Order();
				o.setOrderYM(rset.getString("YM"));
				o.setOrderPrice(rset.getInt("SOP"));
				

				
				list.add(o);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		
		return list;
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
	}


