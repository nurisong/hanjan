package com.hj.member.myPage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.qa.model.service.QAService;
import com.hj.community.qa.model.vo.QA;

/**
 * Servlet implementation class QADetailViewController
 */
@WebServlet("/detail.qa")
public class MyPageQaDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQaDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qaNo = Integer.parseInt(request.getParameter("qno"));
		
		QA qa = new QAService().selectQa(qaNo);
		
		request.setAttribute("qa", qa);
		request.getRequestDispatcher("views/member/myPage/myPageQaDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
