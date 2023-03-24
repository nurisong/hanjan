package com.hj.member.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.PageInfo;
import com.hj.community.qa.model.service.QAService;
import com.hj.community.qa.model.vo.QA;
import com.hj.member.model.vo.Member;

/**
 * Servlet implementation class QAListViewController
 */
@WebServlet("/list.qa")
public class MyPageQaListViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQaListViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		int userNo = loginUser.getUserNo();
		
		ArrayList<QA> list = new QAService().selectList(userNo);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/member/myPage/myPageQa.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
