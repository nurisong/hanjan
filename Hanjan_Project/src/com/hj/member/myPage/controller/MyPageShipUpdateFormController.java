package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Shipment;

/**
 * Servlet implementation class MyPageShipUpdateFromController
 */
@WebServlet("/updateShipForm.me")
public class MyPageShipUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageShipUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int shipNo = Integer.parseInt(request.getParameter("sno"));
		
		Shipment s = new MemberService().selectShipment(shipNo);
		
		request.setAttribute("s", s);
		request.getRequestDispatcher("views/member/myPage/myPageShipUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
