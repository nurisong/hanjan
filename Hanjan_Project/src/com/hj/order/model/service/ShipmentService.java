package com.hj.order.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.hj.order.model.dao.ShipmentDao;
import com.hj.order.model.vo.Shipment;
public class ShipmentService {

	public Shipment selectShipment(int userNo) {
		
		Connection conn = getConnection();
		
		Shipment s = new ShipmentDao().selectShipment(conn, userNo);
		
		close(conn);
		
		return s;
	}
}
