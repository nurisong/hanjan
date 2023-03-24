package com.hj.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdChange
 */
@WebServlet("/updatePwd.me")
public class FindPwdChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdChange() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = request.getParameter("newPwd");
		
		int result = new MemberService().updatePwd(userNo, userPwd);
		
		if(result > 0) {
			// 비밀번호 변경 성공
			request.getRequestDispatcher("views/member/findPwdResult.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("alertMsg", "비밀번호 재설정에 실패했습니다.");
			request.getRequestDispatcher("views/member/findPwdChange.jsp").forward(request, response);
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
