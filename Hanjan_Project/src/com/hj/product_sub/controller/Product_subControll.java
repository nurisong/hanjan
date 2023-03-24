package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.dao.SubscriptionDao;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class Product_subControll
 */
@WebServlet("/slist.sub")
public class Product_subControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//2)페이징처리
		// 필요변수
		int slistCount = new SubscriptionService().selectScount();// 상품목록 총개수
		int endPage = 10; // 페이지하단에 보여질 끝수
		
		int maxPage; // 가장 마지막 페이지가 몇번 페이지 인지 (총 페이지의 개수)
		int pageLimit = 10; // 페이지 하단에 보여질 페이징바의 최대개수=> 10개로 고정
		int boardLimit = 10; // 한 페이지에 보여질 게시글의 최대 개수=> 10개로 고정

		if (slistCount % pageLimit > 0) {
			maxPage = (slistCount / boardLimit) + 1;
		} else {
			maxPage = (slistCount / boardLimit);
		}
		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		//
		
		ArrayList<Subscription> slistFirst=new SubscriptionService().selectFirstSpage(boardLimit);
		
		request.setAttribute("slistCount", slistCount);
		request.setAttribute("slistFirst", slistFirst);
		request.setAttribute("boardLimit", boardLimit);
		
		request.getRequestDispatcher("views/product_sub/product_subList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
