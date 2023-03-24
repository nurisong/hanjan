package com.hj.product.model.dao;

import static com.hj.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.hj.community.review.model.vo.Review;
import com.hj.product.model.vo.Product;

public class ProductDao {

	private Properties prop=new Properties();
	
	public ProductDao() {
		
		String fileName=ProductDao.class.getResource("/sql/product/product-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public int insertProduct(Connection conn,Product product) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("insertProduct");
		
		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, product.getProductName());
			pstmt.setInt(2, Integer.parseInt(product.getProductPrice()));
			pstmt.setInt(3, Integer.parseInt(product.getProductVolume()));
			pstmt.setInt(4, Integer.parseInt(product.getProductAlcohol()));
			pstmt.setInt(5, Integer.parseInt(product.getproductStock()));
			pstmt.setString(6, product.getProductType());
			pstmt.setString(7, product.getProductDetail());
			pstmt.setString(8, product.getProductImage1());
			pstmt.setString(9, product.getProductImage2());
			
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}
	
	public int selectCount(Connection conn) {
		
		int listCount=0;
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("selectCount");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				listCount=rset.getInt("COUNT(*)");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return listCount;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<Product> selectFirstPage(Connection conn,int boardLimit){
		
		ResultSet rset=null;
		ArrayList<Product> list=new ArrayList();
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("selectFirstPage");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardLimit);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(Integer.toString(rset.getInt("PRO_PRICE")));
				p.setProductVolume(Integer.toString(rset.getInt("PRO_VOLUME")));
				p.setProductAlcohol(Integer.toString(rset.getInt("PRO_ALCOHOL")));
				p.setProductType(rset.getString("PRO_TYPE"));
				p.setproductStock(Integer.toString(rset.getInt("PRO_STOCK")));
				p.setProductDetail(rset.getString("PRO_DETAIL"));
				p.setProductShow(rset.getString("PRO_SHOW"));
				
				list.add(p);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> listBarSetting(Connection conn,int firstNo,int lastNo){
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		ArrayList<Product> list=new ArrayList();
		
		String sql=prop.getProperty("listBarSetting");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			
			
			pstmt.setInt(1, firstNo);
			pstmt.setInt(2, lastNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(Integer.toString(rset.getInt("PRO_PRICE")));
				p.setProductVolume(Integer.toString(rset.getInt("PRO_VOLUME")));
				p.setProductAlcohol(Integer.toString(rset.getInt("PRO_ALCOHOL")));
				p.setProductType(rset.getString("PRO_TYPE"));
				p.setproductStock(Integer.toString(rset.getInt("PRO_STOCK")));
				p.setProductDetail(rset.getString("PRO_DETAIL"));
				p.setProductShow(rset.getString("PRO_SHOW"));
				
				list.add(p);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public int productShowRevise(Connection conn,ArrayList<String> list) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("productShowRevise");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			/*
			if(list.size()==10) {
				for(int i=1;i<=10;i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
			} else{
				for(int i=1;i<=list.size();i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
				for(int i=(list.size()+1);i<=10;i++) {
					//pstmt.setInt(i, Integer.parseInt(list.get(list.size())));
					pstmt.setInt(i, Integer.parseInt(list.get(2)));
				}
			}
			*/
			/*
			for(int i=1;i<=10;i++) {
				pstmt.setInt(i, Integer.parseInt(list.get(0)));
			}
			*/
			if(list.size()==10) {
				for(int i=1;i<=10;i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
			} else{
				for(int i=1;i<=list.size();i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(i-1)));
				}
				for(int i=(list.size()+1);i<=10;i++) {
					pstmt.setInt(i, Integer.parseInt(list.get(list.size()-1)));
					
					
				}
			}
			
			
			
			
			
			
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		
		return result;
		
	}
	
	public Product productUpdate(Connection conn,String checkProduct) {
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		Product p=null;
		
		String sql=prop.getProperty("productUpdate");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(checkProduct));
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				p=new Product();
				
				p.setProductNo(Integer.parseInt(checkProduct));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(rset.getString("PRO_PRICE"));
				p.setProductVolume(rset.getString("PRO_VOLUME"));
				p.setProductAlcohol(rset.getString("PRO_ALCOHOL"));
				p.setproductStock(rset.getString("PRO_STOCK"));
				p.setProductType(rset.getString("PRO_TYPE"));
				p.setProductDetail(rset.getString("PRO_DETAIL"));
				p.setProductImage1(rset.getString("PRO_IMAGE1"));
				p.setProductImage2(rset.getString("PRO_IMAGE2"));
				p.setProductShow(rset.getString("PRO_SHOW"));								
								
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
		
		
		
	}
	
	
	
	public int updateEnrollProduct(Connection conn,Product product) {
		
		int result=0;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("updateEnrollProduct");
		
		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, product.getProductName());
			pstmt.setInt(2, Integer.parseInt(product.getProductPrice()));
			pstmt.setInt(3, Integer.parseInt(product.getProductVolume()));
			pstmt.setInt(4, Integer.parseInt(product.getProductAlcohol()));
			pstmt.setInt(5, Integer.parseInt(product.getproductStock()));
			pstmt.setString(6, product.getProductType());
			pstmt.setString(7, product.getProductDetail());
			pstmt.setString(8, product.getProductImage1());
			pstmt.setString(9, product.getProductImage2());
			pstmt.setString(10, product.getProductShow());
			pstmt.setInt(11, product.getProductNo());
			
			result=pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		return result;
		
	}
	
	public ArrayList<Product> searchListBarSetting(Connection conn, int firstNo,int lastNo,String searchWord) {
		
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		ArrayList<Product> list=new ArrayList();
		
		String sql=prop.getProperty("searchListBarSetting");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, '%'+searchWord+'%');
			
			pstmt.setInt(2, firstNo);
			pstmt.setInt(3, lastNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setProductNo(rset.getInt("PRO_NO"));
				p.setProductName(rset.getString("PRO_NAME"));
				p.setProductPrice(Integer.toString(rset.getInt("PRO_PRICE")));
				p.setProductVolume(Integer.toString(rset.getInt("PRO_VOLUME")));
				p.setProductAlcohol(Integer.toString(rset.getInt("PRO_ALCOHOL")));
				p.setProductType(rset.getString("PRO_TYPE"));
				p.setproductStock(Integer.toString(rset.getInt("PRO_STOCK")));
				p.setProductDetail(rset.getString("PRO_DETAIL"));
				p.setProductShow(rset.getString("PRO_SHOW"));
				
				list.add(p);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}
	
	
	
	//경호=================================================
	
		public ArrayList<Product> userSelectProductList(Connection conn) { // 상품전체조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Product> productList = new ArrayList<Product>();
			
			String sql = prop.getProperty("userSelectProductList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p = new Product();
					
					p.setProductNo(rset.getInt("PRO_NO"));
					p.setProductImage1(rset.getString("PRO_IMAGE1"));
					p.setProductName(rset.getString("PRO_NAME"));
					p.setProductPrice(rset.getString("PRO_PRICE"));
					p.setProductDetail(rset.getString("PRO_DETAIL"));
					p.setUserProductCount(rset.getString("SALE"));
					p.setProductRate(rset.getString("RATE"));
					
					productList.add(p);
				}
				
//				System.out.println(productList);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return productList;
		}
		
		public Product userSelectProduct(Connection conn, int productNo) { // 선택한 상품상세조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			Product productDetail = new Product();
			
			String sql = prop.getProperty("userSelectProduct");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, productNo);
				
				rset = pstmt.executeQuery();
				
				if (rset.next()) {
					
					productDetail.setProductNo(rset.getInt("PRO_NO"));
					productDetail.setProductName(rset.getString("PRO_NAME"));
					productDetail.setProductPrice(rset.getString("PRO_PRICE"));
					productDetail.setProductVolume(rset.getString("PRO_VOLUME"));
					productDetail.setProductAlcohol(rset.getString("PRO_ALCOHOL"));
					productDetail.setProductType(rset.getString("PRO_TYPE"));
					productDetail.setProductDetail(rset.getString("PRO_DETAIL"));
					productDetail.setProductImage1(rset.getString("PRO_IMAGE1"));
					productDetail.setProductImage2(rset.getString("PRO_IMAGE2"));
					productDetail.setUserProductCount(rset.getString("SALE"));
					productDetail.setProductRate(rset.getString("RATE"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return productDetail;
			
		}
		
		
		public ArrayList<Product> userSelectProductTotalList(Connection conn) { // 전체상품조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Product> productTotalList = new ArrayList<Product>();
			
			String sql = prop.getProperty("userSelectProductTotalList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p = new Product();
					
					p.setProductNo(rset.getInt("PRO_NO"));
					p.setProductImage1(rset.getString("PRO_IMAGE1"));
					p.setProductName(rset.getString("PRO_NAME"));
					p.setProductPrice(rset.getString("PRO_PRICE"));
					p.setProductDetail(rset.getString("PRO_DETAIL"));
					p.setUserProductCount(rset.getString("SALE"));
					p.setProductRate(rset.getString("RATE"));
					
					productTotalList.add(p);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}  finally {
				close(rset);
				close(pstmt);
			}
			
			return productTotalList;
		}
		
		public ArrayList<Product> userSelectProductNewList(Connection conn) { // 새로운상품별 조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Product> productNewList = new ArrayList<Product>();
			
			String sql = prop.getProperty("userSelectProductNewList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p = new Product();
					
					p.setProductNo(rset.getInt("PRO_NO"));
					p.setProductImage1(rset.getString("PRO_IMAGE1"));
					p.setProductName(rset.getString("PRO_NAME"));
					p.setProductPrice(rset.getString("PRO_PRICE"));
					p.setProductDetail(rset.getString("PRO_DETAIL"));
					p.setUserProductCount(rset.getString("SALE"));
					p.setProductRate(rset.getString("RATE"));
					
					productNewList.add(p);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}  finally {
				close(rset);
				close(pstmt);
			}
			return productNewList;
		}
		
		public ArrayList<Product> userSelectProductTypeList(Connection conn, String type) { // 주종별 결과조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Product> productTypeList = new ArrayList<Product>();
			
			String sql = prop.getProperty("userSelectProductTypeList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p = new Product();
					
					p.setProductNo(rset.getInt("PRO_NO"));
					p.setProductImage1(rset.getString("PRO_IMAGE1"));
					p.setProductName(rset.getString("PRO_NAME"));
					p.setProductPrice(rset.getString("PRO_PRICE"));
					p.setProductType(rset.getString("PRO_TYPE"));
					p.setProductDetail(rset.getString("PRO_DETAIL"));
					p.setUserProductCount(rset.getString("SALE"));
					p.setProductRate(rset.getString("RATE"));
					
					productTypeList.add(p);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return productTypeList;
		}
		
		public ArrayList<Product> userSelectSearchResultList(Connection conn, String keyword){ //검색결과조회
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Product> searchResultList = new ArrayList<Product>();
			
			String sql = prop.getProperty("userSelectSearchResultList");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");// 여기서 앞뒤로 붙여버렸음 set은 '' 포함하고있음
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Product p = new Product();
					
					p.setProductNo(rset.getInt("PRO_NO"));
					p.setProductImage1(rset.getString("PRO_IMAGE1"));
					p.setProductName(rset.getString("PRO_NAME"));
					p.setProductPrice(rset.getString("PRO_PRICE"));
					p.setProductType(rset.getString("PRO_TYPE"));
					p.setProductDetail(rset.getString("PRO_DETAIL"));
					p.setUserProductCount(rset.getString("SALE"));
					p.setProductRate(rset.getString("RATE"));
					
					searchResultList.add(p);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return searchResultList;
			
		}
	
	
		public ArrayList<Review> userSelectProductReview(Connection conn, int productNo){
			
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			ArrayList<Review> productReviewList = new ArrayList<Review>();
			
			String sql = prop.getProperty("userSelectProductReview");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, productNo);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Review r = new Review();
					
					r.setRevWriter(rset.getString("USER_ID"));
					r.setRevContent(rset.getString("REV_CONTENT"));
					r.setRevDate(rset.getString("REV_DATE"));
					r.setRevRate(rset.getInt("REV_RATE"));
					
					productReviewList.add(r);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return productReviewList;
			
		}
	
	
}
