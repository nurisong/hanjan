package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class myPageSubDelete
 */
@WebServlet("/deleteSub.me")
public class myPageSubDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageSubDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		ArrayList<Subscription> mypageSubList = new SubscriptionService().mypageSubLookupList(userNo);
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("mypageSubList", mypageSubList);
			request.setAttribute("userNo", userNo);
			request.getRequestDispatcher("/views/product_sub/user/myPage_sub_productIntoView_2.jsp").forward(request, response);
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
