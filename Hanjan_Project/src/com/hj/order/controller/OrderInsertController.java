package com.hj.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.member.model.vo.Member;
import com.hj.order.model.service.OrderService;
import com.hj.order.model.service.ShipmentService;
import com.hj.order.model.vo.Shipment;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class mainOrderController
 */
@WebServlet("/OrderInsert.or")
public class OrderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertController() {
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
		
		// 주문정보 뽑기
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int orderCount = Integer.parseInt(request.getParameter("orderCount"));
	
		Shipment shipment = new ShipmentService().selectShipment(userNo);
		Product product = new OrderService().preOrder(productNo);
		product.setOrderCount(orderCount);
		
		
		request.setAttribute("userNo", userNo);
		request.setAttribute("shipment", shipment);
		request.setAttribute("product", product);
		request.getRequestDispatcher("views/order/OrderInsert.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}