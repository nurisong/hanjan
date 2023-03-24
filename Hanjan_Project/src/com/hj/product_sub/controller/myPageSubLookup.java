package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.member.model.vo.Member;
import com.hj.member.model.vo.Shipment;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class myPageSubLookup
 */
@WebServlet("/subLookup.me")
public class myPageSubLookup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageSubLookup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		
		ArrayList<Subscription> mypageSubList = new SubscriptionService().mypageSubLookupList(userNo);
		Shipment mypageShip = new SubscriptionService().userSelectSubShip(userNo);
		
		
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("mypageSubList", mypageSubList);
			request.setAttribute("mypageShip", mypageShip);
			request.setAttribute("userNo", userNo);
			request.getRequestDispatcher("/views/product_sub/user/myPage_sub_productIntoView_1.jsp").forward(request, response);
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
