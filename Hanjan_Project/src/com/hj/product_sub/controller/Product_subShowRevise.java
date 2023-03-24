package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product.model.service.ProductService;
import com.hj.product_sub.model.service.SubscriptionService;

/**
 * Servlet implementation class Product_subShowRevise
 */
@WebServlet("/showStatus.sub")
public class Product_subShowRevise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subShowRevise() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1post
		request.setCharacterEncoding("UTF-8");

		// 2뽑기
		String[] checkProducts = request.getParameterValues("checkProducts");
		

		ArrayList<String> list = new ArrayList();

		if (checkProducts != null) {
			for (String a : checkProducts) {
				list.add(a);
			}
		} else {

			request.setAttribute("errorMsg", "오류났음");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

			
		}

		// 3담기

		// 4서비스보내기
		int result = new SubscriptionService().product_subShowRevise(list);

		if (result > 0) {

			response.sendRedirect(request.getContextPath() + "/views/admin/aMain.jsp");
			
		} else {
			request.setAttribute("errorMsg", "오류났음");
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
