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
import com.hj.product_sub.model.service.SubscriptionService;

/**
 * Servlet implementation class ProductListSearch1
 */
@WebServlet("/searchAjax.pro")
public class ProductListSearch1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListSearch1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchWords=request.getParameter("searchWords");
		
		ArrayList<Product> pList=new SubscriptionService().enrollUpdateAjax(searchWords);
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(pList,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
