package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;

/**
 * Servlet implementation class MyPageShipDeleteController
 */
@WebServlet("/deleteShip.me")
public class MyPageShipDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageShipDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int shipNo = Integer.parseInt(request.getParameter("sno"));
		
		int result = new MemberService().deleteShipment(shipNo);
		
		if(result > 0) {
			// 삭제 성공
			request.getSession().setAttribute("alertMsg", "배송지가 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + "/myPageShip.me");
		} else {
			request.getSession().setAttribute("alertMsg", "삭제에 실패했습니다.");
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
