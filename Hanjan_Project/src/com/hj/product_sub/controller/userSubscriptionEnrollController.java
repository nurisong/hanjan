package com.hj.product_sub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class userSubscriptionEnrollController
 */
@WebServlet("/userSubscribe/enroll/first")
public class userSubscriptionEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSubscriptionEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int subTypeNo = Integer.parseInt(request.getParameter("subType"));
		String subName = request.getParameter("subName");
		String subPrice = request.getParameter("subPrice");
		
		Subscription sub = new Subscription();
		
		sub.setSubscriptNo(subTypeNo);
		sub.setSubscriptName(subName);
		sub.setSubscriptPrice(subPrice);
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("sub", sub);
			request.getRequestDispatcher("/views/product_sub/user/sub_productApplicationView_1.jsp").forward(request, response);
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
