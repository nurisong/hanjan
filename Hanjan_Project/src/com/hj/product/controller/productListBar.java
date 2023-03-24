package com.hj.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;

/**
 * Servlet implementation class productListBar
 */
@WebServlet("/listbar.pro")
public class ProductListBar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListBar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1
		request.setCharacterEncoding("UTF-8");
		
		//2 뽑기
		int pageView=Integer.parseInt(request.getParameter("pagesNum"));
		int allCount=Integer.parseInt(request.getParameter("allCount"));
		int pagesChoice=Integer.parseInt(request.getParameter("pagesChoice"));
		
		
		int firstNo=(pagesChoice*10)-9;
		int lastNo=(pagesChoice*10);
		if(pagesChoice*10>allCount){
			lastNo=(pagesChoice*10);
		}
		
		
		
		
		//3담기x
		
		//4서비스
		ArrayList<Product> listLast=new ProductService().listBarSetting(firstNo,lastNo);
		
		
		
		//gson이용 화면보내기
		response.setContentType("application/json; charset=UTF-8");
		
		
		new Gson().toJson(listLast,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
