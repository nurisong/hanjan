package com.hj.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.vo.Member;
import com.hj.order.model.service.OrderService;
import com.hj.order.model.vo.Cart;

/**
 * Servlet implementation class CartInsertController
 */
@WebServlet("/CartInsert.or")
public class CartInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식입니다  = 쿼리스트링으로넘김
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");

		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int orderCount = Integer.parseInt(request.getParameter("orderCount"));
		int userNo =loginUser.getUserNo();
		
//		System.out.println(productNo);
//		System.out.println(orderCount);
//		System.out.println(userNo);
		
		Cart c = new Cart();
		c.setProNo(productNo);
		c.setOrderCount(orderCount);
		c.setUserNo(userNo);
		
		int result = new OrderService().userInsertCart(c);
		
		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "장바구니담기성공");
			response.sendRedirect(request.getContextPath() + "/userProductMarketDetail.pro?pno=" + productNo);
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
