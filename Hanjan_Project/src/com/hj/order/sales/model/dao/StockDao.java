package com.hj.order.sales.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.hj.common.JDBCTemplate.*;
import com.hj.common.model.vo.PageInfo;
import com.hj.community.notice.model.dao.NoticeDao;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

public class StockDao {
	
	private Properties prop = new Properties();
	
	public StockDao() {
		String fileName = StockDao.class.getResource("/sql/order/sales-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	

	public ArrayList<Product> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Product> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectStockList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				

				Product p = new Product();
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(rset.getString("PRO_PRICE"));
				p.setSale(rset.getInt("SALE"));
				p.setproductStock(rset.getString("PRO_STOCK"));
				
				list.add(p);
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
		String sql = prop.getProperty("selectStockListCount");
		
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




