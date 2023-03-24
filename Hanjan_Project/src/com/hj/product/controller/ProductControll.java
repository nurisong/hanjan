package com.hj.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.PageInfo;
import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class productControll
 */
@WebServlet("/plist.pro")
public class ProductControll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductControll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1)
		
		//2)페이징처리
		//필요변수
		int listCount=new ProductService().selectCount();//상품목록 총개수
		int endPage=10; //페이지하단에 보여질 끝수
		
		int maxPage; //가장 마지막 페이지가 몇번 페이지 인지 (총 페이지의 개수)
		int pageLimit=10; //  페이지 하단에 보여질 페이징바의 최대개수=> 10개로 고정
		int boardLimit=10; // 한 페이지에 보여질 게시글의 최대 개수=> 10개로 고정
		
		
		if(listCount%pageLimit >0) {
			maxPage=(listCount/boardLimit)+1;
		} else {
			maxPage=(listCount/boardLimit);
		}
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		
		
		//PageInfo info=new PageInfo(listCount,  pageLimit,  boardLimit,  maxPage,  startPage,  endPage);
		
		ArrayList<Product> listFirst=new ProductService().selectFirstPage(boardLimit);
		
		
		
		request.setAttribute("listCount", listCount);
		request.setAttribute("listFirst", listFirst);
		request.setAttribute("boardLimit", boardLimit);
		
		
		
		request.getRequestDispatcher("views/product/productList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
