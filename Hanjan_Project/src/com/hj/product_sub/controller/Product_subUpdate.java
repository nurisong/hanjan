package com.hj.product_sub.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;

/**
 * Servlet implementation class Product_subUpdate
 */
@WebServlet("/sUpdate.sub")
public class Product_subUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1post
		request.setCharacterEncoding("UTF-8");

		String checkProduct = request.getParameter("checkProducts");

		Subscription subscription = new SubscriptionService().product_subUpdate(checkProduct);

		if (subscription.getSubscriptImage1() == null) {
			subscription.setSubscriptImage1("첨부파일없음");
		}else {
			String xx=subscription.getSubscriptImage1().replaceAll("/hanjan/resources/product_sub_upfiles/", "");
			subscription.setSubscriptImage1(xx);
		}
		if (subscription.getSubscriptImage2() == null) {
			subscription.setSubscriptImage2("첨부파일없음");
		}else {
			String xx=subscription.getSubscriptImage2().replaceAll("/hanjan/resources/product_sub_upfiles/", "");
			subscription.setSubscriptImage2(xx);
		}

		if (subscription == null) {
			request.setAttribute("errorMsg", "수정오류났음");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		} else {
			request.setAttribute("Subscription", subscription);
			request.getRequestDispatcher("views/product_sub/product_subUpdateForm1.jsp").forward(request, response);
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
