package com.hj.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.order.model.service.OrderService;
import com.hj.order.model.vo.OrderMain;

/**
 * Servlet implementation class insertOrderSheetController
 */
@WebServlet("/insertOrder.or")
public class insertOrderSheetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertOrderSheetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		// 값 뽑기
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int orderCount = Integer.parseInt(request.getParameter("orderCount"));
		int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
		int shipNo = Integer.parseInt(request.getParameter("shipNo"));
		String orderTool = request.getParameter("orderTool");
		// 가공
		OrderMain om = new OrderMain();
		
		om.setUserNo(userNo);
		om.setOrderProductNo(productNo);
		om.setOrderCount(orderCount);
		om.setOrderPrice(orderPrice);
		om.setShipNo(shipNo);
		om.setOrderTool(orderTool);
		
		// service단으로 토스
		int result = new OrderService().insertOrderSheet(om);
		int result2 = new OrderService().insertOrderProSheet(om);
		
		int sum = (result * result2);
			
		if (sum > 0 ) {
			request.getRequestDispatcher("views/order/CompletePage.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "주문실패");
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
