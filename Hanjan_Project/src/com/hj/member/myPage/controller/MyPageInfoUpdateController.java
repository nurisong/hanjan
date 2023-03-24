package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.member.model.service.MemberService;
import com.hj.member.model.vo.Member;

/**
 * Servlet implementation class MyPageInfoUpdateController
 */
@WebServlet("/update.me")
public class MyPageInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userPwd = request.getParameter("userPwd");
		String emailSite = request.getParameter("emailSite");
		if(emailSite == null) {
			emailSite = request.getParameter("emailForm");
		}
		
		Member user = new Member();
		
		user.setUserNo(userNo);
		user.setUserName(request.getParameter("userName"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("email"));
		user.setEmailSite(emailSite);
		
		if(userPwd != null) {
			// 비밀번호 입력한 경우에만 비밀번호 수정
			int result1= new MemberService().updatePwd(userNo, userPwd);
			
			if(result1 == 0) {
				// 비밀번호 수정 실패
				request.getSession().setAttribute("alertMsg", "비밀번호 수정에 실패했습니다.");
				request.getRequestDispatcher(request.getContextPath() + "/myPageInfo.me");
			}
		} 
		
		Member updateMem = new MemberService().updateMember(user);
		
		if(updateMem != null) {
			// 회원정보 수정 성공
			request.getSession().setAttribute("alertMsg", "회원정보가 수정되었습니다.");
			request.getSession().setAttribute("loginUser", updateMem);
			response.sendRedirect(request.getContextPath() + "/myPageInfo.me");
		} else {
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher(request.getContextPath() + "/myPageInfo.me");
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
