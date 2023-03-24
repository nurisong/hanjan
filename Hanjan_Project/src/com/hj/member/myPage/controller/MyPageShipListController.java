package com.hj.member.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Member;
import com.hj.member.model.vo.Shipment;

/**
 * Servlet implementation class MyPageShipListController
 */
@WebServlet("/myPageShip.me")
public class MyPageShipListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageShipListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 전체 배송지 목록 조회
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		
		ArrayList<Shipment> sList = new MemberService().selectShipmentList(userNo);
		
		if(sList.isEmpty()) {
			// 조회 내역 X
			request.getRequestDispatcher("views/member/myPage/myPageShip.jsp").forward(request, response);
		} else {
			request.setAttribute("sList", sList);
			request.getRequestDispatcher("views/member/myPage/myPageShip.jsp").forward(request, response);
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
