package com.hj.product_sub.controller;

import java.io.IOException;

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
 * Servlet implementation class userSubscriptionEnrollController2
 */
@WebServlet("/userSubscribe/enroll/second")
public class userSubscriptionEnrollController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSubscriptionEnrollController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		// 여기선 배송지 다녀오기
		
		Shipment ship = new SubscriptionService().userSelectSubShip(userNo);
		
		
		// 여기서부턴 그냥 뿌려주기
		int subTypeNo = Integer.parseInt(request.getParameter("subType"));
		String subPrice = request.getParameter("subPrice");
		String subName = request.getParameter("subName");
		
		Subscription sub = new Subscription();
		
		sub.setSubscriptNo(subTypeNo);
		sub.setSubscriptName(subName);
		sub.setSubscriptPrice(subPrice);
		
		
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("ship", ship);
			request.setAttribute("sub", sub);
			request.getRequestDispatcher("/views/product_sub/user/sub_productApplicationView_2.jsp").forward(request, response);
		
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
