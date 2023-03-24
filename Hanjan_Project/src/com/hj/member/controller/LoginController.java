package com.hj.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Member;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.me")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) POST 방식 -> 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2) 값 꺼내기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		// 3) Service
		Member loginUser = new MemberService().loginMember(userId, userPwd);
		
		// 4) 응답화면
		if(loginUser == null) { // 로그인 실패
			request.getSession().setAttribute("alertMsg", "아이디 또는 비밀번호를 확인해주세요.");
			response.sendRedirect(request.getContextPath()+"/views/member/login.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			response.sendRedirect(request.getContextPath());
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
