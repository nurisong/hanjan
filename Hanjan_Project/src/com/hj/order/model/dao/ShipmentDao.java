package com.hj.order.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.hj.common.JDBCTemplate.*;
import com.hj.order.model.vo.Shipment;

public class ShipmentDao {
	
	private Properties prop = new Properties();
	
	public ShipmentDao() {
		
		String fileName = ShipmentDao.class.getResource("/sql/shipment/shipment-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public Shipment selectShipment(Connection conn, int userNo) {
		
		Shipment s = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectShipment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				s = new Shipment(rset.getInt("SHIP_NO"),
								 rset.getInt("USER_NO"),
								 rset.getString("SHIP_NAME"),
								 rset.getString("RECIPIENT"),
								 rset.getInt("POSTCODE"),
								 rset.getString("ADDRESS"),
								 rset.getString("DETAIL_ADDRESS"),
								 rset.getString("PHONE"),
								 rset.getString("BASIC_SHIP"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}
}
