package com.hj.order.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.commit;
import static com.hj.common.JDBCTemplate.getConnection;
import static com.hj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.order.model.dao.OrderDao;
import com.hj.order.model.vo.Cart;
import com.hj.order.model.vo.OrderMain;
import com.hj.order.model.vo.Shipment;
import com.hj.product.model.vo.Product;

public class OrderService {
	
	public int userInsertCart(Cart c) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().userInsertCart(conn, c);
		
		if (result > 0) {
			commit(conn);
		} else { 
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
public ArrayList<Cart> selectCartList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new OrderDao().selectCartList(conn, userNo);
		
		close(conn);
		
		return list;
	}
	
/*
	public int orderConfirm(int userNo) {
		
		Connection conn = getConnection();
		int result = new OrderDao().orderConfirm(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
*/	
	
	public Product preOrder(int productNo) {
		
		Connection conn = getConnection();
		
		Product p = new OrderDao().preOrder(conn, productNo);
		
		close(conn);
		
		return p;
		
	}
	
	public int insertOrderSheet(OrderMain om) {
		
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrderSheet(conn, om);
		
		if(result >0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
		
	}
	
	public int insertOrderProSheet(OrderMain om) {
		
		Connection conn = getConnection();
		
		int result2 = new OrderDao().insertOrderProSheet(conn, om);
		
		if(result2 >0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result2;
		
	}
	
	public Shipment myPageOrderList(int userNo) {
		
		Connection conn = getConnection();
		
		Shipment orderShip = new OrderDao().myPageOrderList(conn, userNo);
		
		close(conn);
		
		return orderShip;
	}
	
	public ArrayList<OrderMain> myPageOrderProductList(int userNo){
		
		Connection conn = getConnection();
		
		ArrayList<OrderMain> orderProductList = new OrderDao().myPageOrderProductList(conn, userNo);
		
		close(conn);
		
		return orderProductList;
		
	}
}
