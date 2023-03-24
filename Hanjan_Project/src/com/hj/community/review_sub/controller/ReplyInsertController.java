package com.hj.community.review_sub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.Point;
import com.hj.community.review.model.service.ReviewService;
import com.hj.community.review.model.vo.Review;

/**
 * Servlet implementation class AJaxReview_subReplyController
 */
@WebServlet("/rinsert.rs")
public class ReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String exContent = request.getParameter("exContent");
		String content = request.getParameter("content");
		int revNo = Integer.parseInt(request.getParameter("revNo"));
		int subPrice = Integer.parseInt(request.getParameter("price"));
		String userId = request.getParameter("userId");
		
		Review r = new Review();
		
		
		r.setRevReply(content);
		r.setRevNo(revNo);

		System.out.println(r);
		System.out.println(userId);
		int result = new ReviewService().updateReply(r, subPrice, userId, exContent);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/detail.rs?rno=" + revNo);
		} else {
			request.setAttribute("errorMsg", "답글등록 실패");
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
