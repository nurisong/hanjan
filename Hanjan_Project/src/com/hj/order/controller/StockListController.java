package com.hj.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.PageInfo;
import com.hj.order.sales.model.service.StockService;
import com.hj.order.sales.model.vo.Stock;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class StockListController
 */
@WebServlet("/StockList.do")
public class StockListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockListController() {
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
		listCount = new StockService().selectListCount(); 
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
		ArrayList<Product> list = new StockService().selectList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi); 
		

		request.getRequestDispatcher("views/admin/stock.jsp").forward(request, response);
	
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
