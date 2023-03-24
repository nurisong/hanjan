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
 * Servlet implementation class ProductListSearch2
 */
@WebServlet("/searchListBar.pro")
public class ProductListSearch2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListSearch2() {
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
		int pagesNumP=Integer.parseInt(request.getParameter("pagesNumP"));
		int allCountP=Integer.parseInt(request.getParameter("allCountP"));
		int pagesChoiceP=Integer.parseInt(request.getParameter("pagesChoiceP"));
		String searchWord=request.getParameter("searchWord");
		
		int firstNo=(pagesChoiceP*10)-9;
		int lastNo=(pagesChoiceP*10);
		if(pagesChoiceP*10>allCountP){
			lastNo=(pagesChoiceP*10);
		}
		
		//3담기x
		
		//4서비스
		ArrayList<Product> listLast=new ProductService().searchListBarSetting(searchWord,firstNo,lastNo);
		
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
