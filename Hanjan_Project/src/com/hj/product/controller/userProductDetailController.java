package com.hj.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.review.model.vo.Review;
import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class userProductDetailController
 */
@WebServlet("/userProductMarketDetail.pro")
public class userProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		Product productDetail = new ProductService().userSelectProduct(productNo);
		ArrayList<Review> productReviewList = new ProductService().userSelectProductReview(productNo);
		
		request.setAttribute("productDetail", productDetail);
		request.setAttribute("productReviewList", productReviewList);
		
		if (productDetail != null) {
			request.getRequestDispatcher("views/product/user/productDetailView.jsp").forward(request, response);
		} else {
			request.setAttribute("alertMsg", "페이지를 불러올수없습니다");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
