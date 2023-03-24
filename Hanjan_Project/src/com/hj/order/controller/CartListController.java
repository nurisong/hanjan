package com.hj.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.vo.Member;
import com.hj.order.model.service.OrderService;
import com.hj.order.model.vo.Cart;

/**
 * Servlet implementation class CartListController
 */
@WebServlet("/cartList.or")
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 인코딩 post방식
		request.setCharacterEncoding("UTF-8");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		

		// 2) 값 뽑기
//		String userNo = request.getParameter("userNo");
		
		// 3) 가공
		
		// 4) service단으로 토스
		ArrayList<Cart> list = new OrderService().selectCartList(userNo);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/order/cartListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
