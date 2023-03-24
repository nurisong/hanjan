package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product_sub.model.service.SubscriptionService;

/**
 * Servlet implementation class Product_subUpdate4
 */
@WebServlet("/enrollUpdateLast.sub")
public class Product_subUpdate4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subUpdate4() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String subscriptNo=request.getParameter("subscriptNo");
		String addProductNo1=request.getParameter("addProductNo1");
		String addProductNo2=request.getParameter("addProductNo2");
		String addProductNo3=request.getParameter("addProductNo3");
		String addProductNo4=request.getParameter("addProductNo4");
		String addProductNo5=request.getParameter("addProductNo5");
		String addProductNo6=request.getParameter("addProductNo6");
		int isNull=Integer.parseInt(request.getParameter("isNull"));
		
		
		
		ArrayList<String> addProductlist=new ArrayList();
		addProductlist.add(addProductNo1);
		addProductlist.add(addProductNo2);
		addProductlist.add(addProductNo3);
		addProductlist.add(addProductNo4);
		addProductlist.add(addProductNo5);
		addProductlist.add(addProductNo6);
		
		for(int i=5;i>0;i--) {
			if(addProductlist.get(i).equals("0")) {
				addProductlist.remove(i);
			}
		}
		
		
		
		
		//일단지우기
			int result1=0;
			
			if(isNull==2) {
				result1=new SubscriptionService().subNoDelete(subscriptNo);
			} else {
				result1=1;
			}
			if(result1>0) {
				int result2=new SubscriptionService().subscriptionUpdateLast(addProductlist,subscriptNo);
				
				if(result2>0) {
					response.sendRedirect(request.getContextPath()+"/views/admin/aMain.jsp");
				} else {
					request.setAttribute("errorMsg", "마지막 등록실패");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("errorMsg", "등록전 삭제실패");
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
