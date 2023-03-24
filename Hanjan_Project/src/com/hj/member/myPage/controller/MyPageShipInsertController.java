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
 * Servlet implementation class MyPageShipInsertController
 */
@WebServlet("/insertShip.me")
public class MyPageShipInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageShipInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String basicShip = request.getParameter("basicShip");
		
		// 기본배송지 체크되면, 나머지는 다 N으로 수정
		if(basicShip != null && basicShip.equals("Y")) {
			new MemberService().updateBasicShip(userNo);
		}
		
		Shipment s = new Shipment();
		s.setUserNo(userNo);
		s.setShipName(request.getParameter("shipName"));
		s.setRecipient(request.getParameter("recipient"));
		s.setPostcode(Integer.parseInt(request.getParameter("postcode")));
		s.setAddress(request.getParameter("address"));
		s.setDetailAddress(request.getParameter("detailAddress"));
		s.setPhone(request.getParameter("phone"));
		if(basicShip == null) s.setBasicShip("N");
		else s.setBasicShip(basicShip);
		
		int result = new MemberService().insertShipment(s);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "신규 배송지가 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myPageShip.me");
		} else {
			request.getSession().setAttribute("alertMsg", "등록에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myPageShip.me");
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
