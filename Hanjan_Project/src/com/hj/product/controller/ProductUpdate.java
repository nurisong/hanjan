package com.hj.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class productUpdate
 */
@WebServlet("/pupdate.pro")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1post
		request.setCharacterEncoding("UTF-8");
		
		String checkProduct=request.getParameter("checkProducts");
		
		
		
		Product product=new ProductService().productUpdate(checkProduct);
		
		if(product.getProductImage1()==null) {
			product.setProductImage1("첨부파일없음");
		} else {
			String xx=product.getProductImage1().replaceAll("/hanjan/resources/product_upfiles/", "");
			product.setProductImage1(xx);
		}
		if(product.getProductImage2()==null) {
			product.setProductImage2("첨부파일없음");
		} else {
			String xx=product.getProductImage2().replaceAll("/hanjan/resources/product_upfiles/", "");
			product.setProductImage2(xx);
		}
		
		
		if(product==null) {				
			request.setAttribute("errorMsg", "수정오류났음");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("product", product);
			request.getRequestDispatcher("views/product/productUpdateForm.jsp").forward(request, response);
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
