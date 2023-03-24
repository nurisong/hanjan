package com.hj.community.review_sub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.review.model.service.ReviewService;

/**
 * Servlet implementation class Review_subDeleteController
 */
@WebServlet("/delete.rs")
public class Review_subDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_subDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int revNo = Integer.parseInt(request.getParameter("rno"));
		
		int result = new ReviewService().deleteReview(revNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "삭제 완료");
			response.sendRedirect(request.getContextPath() + "/list.rs?cpage=1");
		} else {
			request.setAttribute("errorMsg", "삭제 실패");
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
