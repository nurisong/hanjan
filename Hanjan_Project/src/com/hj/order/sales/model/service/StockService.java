package com.hj.order.sales.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.common.model.vo.PageInfo;
import com.hj.community.board.model.dao.BoardDao;
import com.hj.order.sales.model.dao.StockDao;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

public class StockService {

	
	
	public ArrayList<Product> selectList(PageInfo pi) {


		Connection conn = getConnection();
		
		ArrayList<Product> list = new StockDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
		

		
		
	}

	public int selectListCount() {
		
			Connection conn = getConnection();
			int listCount = new StockDao().selectListCount(conn);
			
			close(conn);
			
			return listCount;

	}
	
	


	
	
	
	
	
	
	
	
}
