package com.hj.community.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.review.model.service.ReviewService;
import com.hj.community.review.model.vo.Review;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.rv")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int proNo = 1; //Integer.parseInt(request.getParameter("proNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int rate = Integer.parseInt(request.getParameter("rate"));
		String revType = "R";
		
		Review r = new Review();
		r.setRevWriter(request.getParameter("userNo"));
		r.setRevProduct(String.valueOf(proNo));//r.setRevProduct(request.getParameter("proNo"));
		r.setRevContent(content);
		r.setRevRate(rate);
		r.setRevType(revType);
		
		int result = new ReviewService().insertReview(r);
		
		response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
