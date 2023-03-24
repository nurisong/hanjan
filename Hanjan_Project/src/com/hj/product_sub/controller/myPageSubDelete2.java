package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.product_sub.model.service.SubscriptionService;

/**
 * Servlet implementation class myPageSubDelete2
 */
@WebServlet("/deleteSub.me/result")
public class myPageSubDelete2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageSubDelete2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int subscribeNo = Integer.parseInt(request.getParameter("subscribe"));
		int subNo;
		int result1 = 0;
		int result2 = 0;
		int resultAll = 0;
		
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			
			if (subscribeNo == 1) {
				subNo = 1;
		 		result1 = new SubscriptionService().mypageSubDelete(subNo, userNo);
		 		result2 = new SubscriptionService().mypageUpdateSubStatus(userNo);
		 		request.getRequestDispatcher("/views/product_sub/user/myPage_sub_productIntoView_3.jsp").forward(request, response);
			} else {
				subNo = 2;
	 			result1 = new SubscriptionService().mypageSubDelete(subNo, userNo);
	 			result2 = new SubscriptionService().mypageUpdateSubStatus(userNo);
	 			request.getRequestDispatcher("/views/product_sub/user/myPage_sub_productIntoView_3.jsp").forward(request, response);
			}
			
			if ((result1*result2) > 0 && 0 < (resultAll*result2)) {
				request.getRequestDispatcher("/views/product_sub/user/myPage_sub_productIntoView_3.jsp").forward(request, response);
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
