package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;

/**
 * Servlet implementation class MyPageInfoCheckPwdController
 */
@WebServlet("/checkPwd.me")
public class MyPageInfoCheckPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInfoCheckPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = request.getParameter("checkPwd");
		
		int flag = new MemberService().checkPwd(userNo, userPwd);
		
		if(flag > 0) {
			request.getRequestDispatcher("views/member/myPage/myPageInfoDelete.jsp").forward(request, response);
		} else {
			// 비밀번호 불일치
			request.getSession().setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher("views/member/myPage/myPageInfoCheck.jsp").forward(request, response);
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
