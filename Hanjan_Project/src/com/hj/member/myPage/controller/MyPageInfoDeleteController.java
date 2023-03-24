package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;

/**
 * Servlet implementation class MyPageInfoDeleteController
 */
@WebServlet("/delete.me")
public class MyPageInfoDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInfoDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new MemberService().deleteMember(userNo);
		
		if(result > 0) {
			// 탈퇴 성공
			request.getSession().invalidate();
			request.getRequestDispatcher("views/member/myPage/myPageInfoDeleteResult.jsp").forward(request, response);
		} else {
			// 탈퇴실패
			request.getSession().setAttribute("alertMsg", "탈퇴에 실패했습니다.");
			request.getRequestDispatcher("views/member/myPage/myPageInfoDelete.jsp").forward(request, response);
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
