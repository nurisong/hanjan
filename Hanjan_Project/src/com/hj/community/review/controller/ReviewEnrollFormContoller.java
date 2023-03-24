package com.hj.community.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.review.model.service.ReviewService;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class NoticeEnrollFormContoller
 */
@WebServlet("/enrollForm.rv")
public class ReviewEnrollFormContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEnrollFormContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int proNo = 1; //Integer.parseInt(request.getParameter("proNo"));
		Product p = new ReviewService().selectProduct(proNo);
		
		request.setAttribute("p", p);
		
		request.getRequestDispatcher("views/community/review/reviewEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
