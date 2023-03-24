package com.hj.product.model.service;

import static com.hj.common.JDBCTemplate.close;
import static com.hj.common.JDBCTemplate.commit;
import static com.hj.common.JDBCTemplate.getConnection;
import static com.hj.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.hj.community.review.model.vo.Review;
import com.hj.product.model.dao.ProductDao;
import com.hj.product.model.vo.Product;

public class ProductService {

	
	public int insertProduct(Product product) {
		
		Connection conn=getConnection();
		
		int result=new ProductDao().insertProduct(conn,product);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int selectCount() {
		
		Connection conn=getConnection();
		
		int listCount=new ProductDao().selectCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	
	
	
	
	public ArrayList<Product> selectFirstPage(int boardLimit) {
		
		Connection conn=getConnection();
		
		ArrayList<Product> list=new ProductDao().selectFirstPage(conn,boardLimit);
		
		close(conn);
		
		return list;
		
	}
	
	public ArrayList<Product> listBarSetting(int firstNo,int lastNo) {
		
		Connection conn=getConnection();
		
		ArrayList<Product> list=new ProductDao().listBarSetting(conn,firstNo,lastNo);
		
		close(conn);
		
		return list;
		
	}
	
	public int productShowRevise(ArrayList<String> list) {
		
		Connection conn=getConnection();
		
		int result=new ProductDao().productShowRevise(conn,list);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public Product productUpdate(String checkProduct) {
		
		Connection conn=getConnection();
		
		Product product=new ProductDao().productUpdate(conn,checkProduct);
		
		close(conn);
		
		return product;
	}
	
	public int updateEnrollProduct(Product product) {
		
		Connection conn=getConnection();
		
		int result=new ProductDao().updateEnrollProduct(conn,product);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	// 경호시작============================================================
	
	
		public ArrayList<Product> userSelectProductList() { // 상품페이지 판매량순
			
			Connection conn = getConnection();
			
			ArrayList<Product> productList = new ProductDao().userSelectProductList(conn);
			
			close(conn);
			
			return productList;
		}
		
		public Product userSelectProduct(int productNo) { // 상품상세페이지
			
			Connection conn = getConnection();
			
			Product productDetail = new ProductDao().userSelectProduct(conn, productNo);
			
			close(conn);
			
			return productDetail;
			
			
		}
		
		public ArrayList<Product> userSelectProductTotalList(){ // 상품페이지 전체순
			
			Connection conn = getConnection();
			
			ArrayList<Product> productTotalList = new ProductDao().userSelectProductTotalList(conn);
			
			close(conn);
			
			return productTotalList;
		}
		
		public ArrayList<Product> userSelectProductNewList(){ // 상품페이지 신상품순(늦게올라온순)
			
			Connection conn = getConnection();
			
			ArrayList<Product> productNewList = new ProductDao().userSelectProductNewList(conn);
			
			close(conn);
			
			return productNewList;
		}
		
		public ArrayList<Product> userSelectProductBestList(){ // 상품페이지 베스트(판매량순)
			
			Connection conn = getConnection();
			
			ArrayList<Product> productBestList = new ProductDao().userSelectProductList(conn);
			
			close(conn);
			
			return productBestList;
		}
		
		public ArrayList<Product> userSelectProductTypeList(String type) {
			
			Connection conn = getConnection();
			
			ArrayList<Product> productTypeList = new ProductDao().userSelectProductTypeList(conn, type);
			
			close(conn);
			
			return productTypeList;
			
		}
		
		public ArrayList<Product> userSelectSearchResultList(String keyword){
			
			Connection conn = getConnection();
			
			ArrayList<Product> searchResultList = new ProductDao().userSelectSearchResultList(conn, keyword);
			
			close(conn);
			
			return searchResultList;
			
			
		}
		
	public ArrayList<Review> userSelectProductReview(int productNo){
			
			Connection conn = getConnection();
			
			ArrayList<Review> productReviewList = new ProductDao().userSelectProductReview(conn, productNo);
			
			close(conn);
			
			return productReviewList;
		}
	
}
