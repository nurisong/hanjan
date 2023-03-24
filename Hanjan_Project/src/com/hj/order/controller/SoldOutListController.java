package com.hj.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.PageInfo;
import com.hj.order.sales.model.service.SoldOutService;
import com.hj.order.sales.model.service.StockService;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class SoldOutListController
 */
@WebServlet("/SoldOut.do")
public class SoldOutListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SoldOutListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
	
		int maxPage; 
		int startPage; 
		int endPage;
		listCount = new SoldOutService().selectListCount(); 
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Stock> list = new SoldOutService().selectList(pi);
		
		request.setAttribute("list", list); // 우리가 실제로 조회한 페이지에 보여질 10개의 게시글
		request.setAttribute("pi", pi); // 페이징바를 만들 때 필요한 변수
		
		// views/board/boardListView.jsp 화면으로 응답 => 포워딩
		request.getRequestDispatcher("views/admin/soldout.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
