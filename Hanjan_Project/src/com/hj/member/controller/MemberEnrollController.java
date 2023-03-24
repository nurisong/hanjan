package com.hj.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollController
 */
@WebServlet("/insert.me")
public class MemberEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) POST -> 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 뽑기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String emailSite = request.getParameter("emailSite");
		if(emailSite == null) {
			emailSite = request.getParameter("emailForm");
		}
		
		// System.out.println("Controller: " + emailSite);
		
		Member user = new Member();
		
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setPhone(phone);
		user.setEmail(email);
		user.setEmailSite(emailSite);
		
		int result = new MemberService().inserMember(user);
		
		if(result > 0) { // 회원가입 성공
			response.sendRedirect("views/member/memberEnrollResult.jsp");
		} else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
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
