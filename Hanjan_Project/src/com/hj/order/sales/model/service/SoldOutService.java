package com.hj.order.sales.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.PageInfo;
import com.hj.order.sales.model.dao.SoldOutDao;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

public class SoldOutService {

	public ArrayList<Stock> selectList(PageInfo pi) {


		Connection conn = getConnection();
		
		ArrayList<Stock> list = new SoldOutDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		

		
		
	}

	public int selectListCount() {
		
			Connection conn = getConnection();
			int listCount = new SoldOutDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;

	}
}
