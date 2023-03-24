package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.service.SubscriptionService;

/**
 * Servlet implementation class Product_subEnroll2
 */
@WebServlet("/enrollAjax.sub")
public class Product_subEnroll2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subEnroll2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String searchWord=request.getParameter("searchWord");
		
		
		
		ArrayList<Product> list =new SubscriptionService().subscriptionEnroll2(searchWord);
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list,response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
