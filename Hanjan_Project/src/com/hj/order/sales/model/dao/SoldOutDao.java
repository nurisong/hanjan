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

import com.hj.common.model.vo.PageInfo;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

public class SoldOutDao {
	
	private Properties prop = new Properties();
	
	public SoldOutDao() {
		String fileName = StockDao.class.getResource("/sql/order/sales-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

	public ArrayList<Stock> selectList(Connection conn, PageInfo pi) {
		// 재고 테이블 조회
		ArrayList<Stock> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("soldoutList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				

				Stock s  = new Stock();
				s.setProductNo(rset.getInt("PRO_NO"));
				s.setProductName(rset.getString("PRO_NAME"));
				s.setSale(rset.getInt("SALE"));
				s.setSoldOutDate(rset.getDate("SOLDOUT_DATE"));
				
				list.add(s);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		
		
		return list;
	}


	public int selectListCount(Connection conn) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("soldoutListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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









	
	}
