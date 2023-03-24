package com.hj.member.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.member.model.vo.Member;
import com.hj.order.model.service.OrderService;
import com.hj.order.model.vo.OrderMain;
import com.hj.order.model.vo.Shipment;

/**
 * Servlet implementation class MyPageOrderController
 */
@WebServlet("/myPageOrder.me")
public class MyPageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session  = request.getSession();
		Member m  = (Member) session.getAttribute("loginUser");
		int userNo = m.getUserNo();
		
		Shipment orderShip = new OrderService().myPageOrderList(userNo);
		ArrayList<OrderMain> orderProductList = new OrderService().myPageOrderProductList(userNo);
		
		request.setAttribute("orderShip", orderShip);
		request.setAttribute("orderProductList", orderProductList);
		request.getRequestDispatcher("views/member/myPage/myPageOrder.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
