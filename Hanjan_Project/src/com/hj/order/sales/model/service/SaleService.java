package com.hj.order.sales.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.getConnection;
import com.hj.community.notice.model.dao.NoticeDao;
import com.hj.order.model.vo.Order;
import com.hj.order.sales.model.dao.SaleDao;

public class SaleService {

	public ArrayList<Order> saleList() {

		Connection conn = getConnection();
		
		ArrayList<Order> list = new SaleDao().saleList(conn);
		
		close(conn);
		
		return list;
		
		
		
		
	}

}
