package com.hj.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.order.model.service.OrderService;
import com.hj.order.model.service.ShipmentService;
import com.hj.order.model.vo.Shipment;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class mainOrderController
 */
@WebServlet("/mainOrder.or")
public class mainOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		// input에 name 속성 추가
		// name 속성으로 getParameter("name속성값");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		// 배송지 정보 뽑기
		Shipment s = new ShipmentService().selectShipment(userNo);
		
		//System.out.println(userNo);
		//System.out.println(s);
		
		/*
		int shipNo = s.getShipNo();
		String shipName = s.getShipName();
		String recipient = s.getRecipient();
		int postcode = s.getPostcode();
		String address = s.getAddress();
		String detailAddress = s.getDetailAddress();
		String phone = s.getPhone();
		String basicShip = s.getBasicShip();
		*/
		
		// 주문정보 뽑기
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		int orderCount = Integer.parseInt(request.getParameter("orderCount"));
	
		Product p = new OrderService().preOrder(productNo);
		p.setOrderCount(orderCount);
		System.out.println(orderCount);
		
		//System.out.println(p);
		/*
		// productNo = p.getProductNo();
		String productName = p.getProductName();
		int productPrice = Integer.parseInt(p.getProductPrice());
		int productAlcohol = Integer.parseInt(p.getProductAlcohol());
		String productImage1 = p.getProductImage1();*/
		// 포인트
		//new OrderService().pointCheck(userNo);
		
		
		// vo가공
		// service단으로 토스
		//int result = new OrderService().orderConfirm(userNo);
		
		
		
		// 포워딩
		request.setAttribute("userNo", userNo);
		request.setAttribute("Product", p);
		request.setAttribute("Shipment", s);
		request.getRequestDispatcher("views/order/orderMainView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
