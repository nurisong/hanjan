package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.review.model.vo.Review;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class userSubscriptionDetailController
 */
@WebServlet("/userSubscribe/detail")
public class userSubscriptionDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSubscriptionDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int subscriptionNo = Integer.parseInt(request.getParameter("subscriptionNo"));
		
		ArrayList<Review> subReviewList = new SubscriptionService().userSelectSubReviewList(subscriptionNo);
		
		ArrayList<Subscription> subDetailList = new SubscriptionService().userSelectSubDetailList(subscriptionNo);
		
		request.setAttribute("subReviewList", subReviewList);
		request.setAttribute("subDetailList", subDetailList);
		
		request.getRequestDispatcher("/views/product_sub/user/sub_productDetailView.jsp").forward(request, response);
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
