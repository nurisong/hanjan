package com.hj.community.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.PageInfo;
import com.hj.community.review.model.service.ReviewService;
import com.hj.community.review.model.vo.Review;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class aReviewListController
 */
@WebServlet("/aList.rv")
public class aReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aReviewListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String revType = "R";
		int listCount = new ReviewService().selectListCount(revType);
		
		int currentPage = Integer.parseInt(request.getParameter("cpage"));
		int pageLimit = 10;
		int boardLimit = 15;
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit); 
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Review> rList = new ReviewService().selectAList(pi, revType);
		ArrayList<Product> pList = new ArrayList();
		
		for(int i = 0; i < rList.size(); i++) {
			
			Product p = new ReviewService().selectListProduct(rList.get(i).getRevProductNo());
			
			pList.add(p);
		}
		
		request.setAttribute("rList", rList);
		request.setAttribute("pList", pList);
		request.setAttribute("pi", pi);
		
		
		request.getRequestDispatcher("views/admin/community/aReviewListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
