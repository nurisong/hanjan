package com.hj.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product.model.service.ProductService;

/**
 * Servlet implementation class productShowRevise
 */
@WebServlet("/showstatus.pro")
public class ProductShowRevise extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductShowRevise() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1post
		request.setCharacterEncoding("UTF-8");
		
		//2뽑기
		String [] checkProducts=request.getParameterValues("checkProducts");
		
		
		
		ArrayList<String> list=new ArrayList();
		
		if(checkProducts !=null) {
			for(String a:checkProducts) {
				list.add(a);
			}
		}else {
			
			request.setAttribute("errorMsg", "오류났음");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
//			request.setAttribute("alertMsg", "삭제할 품목을 선택해주세요");
//			request.getRequestDispatcher("views/product/productList.jsp").forward(request, response);
		}
		
		//3담기
		
		//4서비스보내기
		int result=new ProductService().productShowRevise(list);
		
		
		
		
		
		
		if(result>0) {
			
			response.sendRedirect(request.getContextPath()+"/views/admin/aMain.jsp");
			
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
