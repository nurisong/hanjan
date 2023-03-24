package com.hj.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductUpdateEnroll
 */
@WebServlet("/pupdateenroll.pro")
public class ProductUpdateEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateEnroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//1.1전송용량제한(10Mbtye)
			int maxSize=1024*1024*10;
			
			//1.2저장할 서버의 물리적 경로제시
			String savePath=request.getServletContext().getRealPath("/resources/product_upfiles/");
			////#####////// 경로 나중에 수정하던가 이대로쓰던가 ////#####///////
			
			//2 MultipartRequest객체 생성(파일명 수정해서 올리기)
			MultipartRequest multiRequest=new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
		////#####////// 경로 나중에 수정하던가 이대로쓰던가 ////#####///////
			String pathss="resources/product_upfiles";
			
			String productNo=multiRequest.getParameter("proNo");
			String productName=multiRequest.getParameter("proName");
			String productPrice= multiRequest.getParameter("proPrice");
			String productVolume= multiRequest.getParameter("proVolume");
			String productAlcohol= multiRequest.getParameter("proAlcohol");
			String productStock= multiRequest.getParameter("proStock");
			String productType= multiRequest.getParameter("proType");
			String productDetail= multiRequest.getParameter("proDetail");
			String productorigin1=multiRequest.getParameter("proImage1");
			String productorigin2=multiRequest.getParameter("proImage2");
			String proshow=multiRequest.getParameter("proShow");
			
			String productShow=proshow.toUpperCase();
			
			if(productorigin1.equals("첨부파일없음")) {
				productorigin1=null;
			}
			if(productorigin2.equals("첨부파일없음")) {
				productorigin2=null;
			}
			
			
			// 3 vo객체에 담기
			Product product=new Product();
			product.setProductNo(Integer.parseInt(productNo));
			product.setProductName(productName);
			product.setProductPrice(productPrice);
			product.setProductVolume(productVolume);
			product.setProductAlcohol(productAlcohol);
			product.setproductStock(productStock);
			product.setProductType(productType);
			product.setProductDetail(productDetail);
			product.setProductShow(productShow);
			
			if(multiRequest.getOriginalFileName("upfile1") !=null) {
				product.setProductImage1(request.getContextPath()+"/"+pathss+"/"+multiRequest.getFilesystemName("upfile1"));				
			}else {				
				product.setProductImage1(productorigin1);
			}
			
			if(multiRequest.getOriginalFileName("upfile2") !=null) {
				product.setProductImage2(request.getContextPath()+"/"+pathss+"/"+multiRequest.getFilesystemName("upfile2"));				
			}else {				
				product.setProductImage2(productorigin2);
			}
			
			int result=new ProductService().updateEnrollProduct(product);
			
			if(result >0) {
				response.sendRedirect(request.getContextPath()+"/views/admin/aMain.jsp");
			} else {
				request.setAttribute("errorMsg", "오류났음");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
