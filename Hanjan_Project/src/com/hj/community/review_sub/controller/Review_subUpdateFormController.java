package com.hj.community.review_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.Attachment;
import com.hj.community.review.model.service.ReviewService;
import com.hj.community.review.model.vo.Review;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class Review_subUpdateFormController
 */
@WebServlet("/updateForm.rs")
public class Review_subUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_subUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int sRevNo = Integer.parseInt(request.getParameter("rno"));
		
		Review r = new ReviewService().selectUpdateReview(userNo, sRevNo);
		
		Subscription s = new ReviewService().selectListSubProduct(r.getRevProductNo());
		
		ArrayList<Attachment> list = new ReviewService().selectAttachmentList(sRevNo);
		
		
		request.setAttribute("r", r);
		request.setAttribute("s", s);
		request.setAttribute("list", list);
		System.out.println(list);
		
		request.getRequestDispatcher("views/community/review_sub/review_subUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
