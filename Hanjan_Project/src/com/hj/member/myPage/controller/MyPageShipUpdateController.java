package com.hj.member.myPage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Shipment;

/**
 * Servlet implementation class MyPageShipUpdateController
 */
@WebServlet("/updateShip.me")
public class MyPageShipUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageShipUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int shipNo = Integer.parseInt(request.getParameter("shipNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String shipName = request.getParameter("shipName");
		String recipient = request.getParameter("recipient");
		int postcode = Integer.parseInt(request.getParameter("postcode"));
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String phone = request.getParameter("phone");
		String basicShip = request.getParameter("basicShip");
		
		// 기본배송지 체크되면, 나머지는 다 N으로 수정
		if(basicShip != null && basicShip.equals("Y")) new MemberService().updateBasicShip(userNo);
		
		Shipment s = new Shipment();
		
		s.setShipNo(shipNo);
		s.setUserNo(userNo);
		s.setShipName(shipName);
		s.setRecipient(recipient);
		s.setPostcode(postcode);
		s.setAddress(address);
		s.setDetailAddress(detailAddress);
		s.setPhone(phone);
		if(basicShip == null) s.setBasicShip("N");
		else s.setBasicShip(basicShip);
		
		int result = new MemberService().updateShipment(s);
		
		if(result > 0) {
			// 업데이트 성공
			//request.setAttribute("alertMsg", "배송지가 수정되었습니다.");
			// response.sendRedirect(request.getContextPath() + "/myPageShip.me");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('배송지가 수정되었습니다.'); location.href='" + request.getContextPath() + "/myPageShip.me';</script>");
			out.flush();
		} else {
			request.getSession().setAttribute("alertMsg", "배송지 수정에 실패했습니다.");
			request.getRequestDispatcher("views/member/mypage/myPageShip.jsp").forward(request, response);;
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
