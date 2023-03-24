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
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class userSubscriptionEnrollController3
 */
@WebServlet("/userSubscribe/enroll/third")
public class userSubscriptionEnrollController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSubscriptionEnrollController3() {
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
		
		int subTypeNo = Integer.parseInt(request.getParameter("subType"));
		String subPrice = request.getParameter("subPrice");
		String subName = request.getParameter("subName");
		
		Subscription sub = new Subscription();
		sub.setSubscriptNo(subTypeNo);
		sub.setSubscriptName(subName);
		sub.setSubscriptPrice(subPrice);
	
		String shipUserName = request.getParameter("shipUserName");
		String shipPhone = request.getParameter("shipPhone");
		String shipAddress = request.getParameter("shipAddress");
		
		Shipment ship = new Shipment();
		ship.setRecipient(shipUserName);
		ship.setPhone(shipPhone);
		ship.setAddress(shipAddress);
		
		if (session.getAttribute("loginUser") == null) {
			request.setAttribute("errorMsg", "로그인을 해주세요");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("sub", sub);
			request.setAttribute("ship", ship);
			request.setAttribute("userNo", userNo);
			request.getRequestDispatcher("/views/product_sub/user/sub_productApplicationView_3.jsp").forward(request, response);
		
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
