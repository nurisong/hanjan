package com.hj.product_sub.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Product_subEnroll1
 */
@WebServlet("/enrollNext.sub")
public class Product_subEnroll1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subEnroll1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			//1.1전송용량제한(10Mbtye)
			int maxSize=1024*1024*10;
			
			//1.2저장할 서버의 물리적 경로제시
			String savePath=request.getSession().getServletContext().getRealPath("/resources/product_sub_upfiles/");
	
			String pathss="resources/product_sub_upfiles";
			
			
			MultipartRequest mulRe=new MultipartRequest(request,savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			//2첨부파일
			
			//값 뽑기
			String subName=mulRe.getParameter("subName");
			String subPrice=mulRe.getParameter("subPrice");
			String subMonth=mulRe.getParameter("subMonth");		
			String subDetail=mulRe.getParameter("subDetail");
			
			//값 담기
			Subscription subscription=new Subscription();
			subscription.setSubscriptName(subName);
			subscription.setSubscriptPrice(subPrice);
			subscription.setSubscriptMonth(subMonth);		
			subscription.setSubscriptDetail(subDetail);
			
			if(mulRe.getOriginalFileName("upfile1") !=null) {
				subscription.setSubscriptImage1((request.getContextPath()+"/"+pathss+"/"+mulRe.getFilesystemName("upfile1")));
				
			}
			if(mulRe.getOriginalFileName("upfile2") !=null) {
				subscription.setSubscriptImage2((request.getContextPath()+"/"+pathss+"/"+mulRe.getFilesystemName("upfile2")));
				
			}
			int result=new SubscriptionService().subscriptionEnroll1(subscription);
			
			if(result >0) {
				
				int num=new SubscriptionService().selectSubscriptNo();
				
				request.setAttribute("Subscription", subscription);
				request.setAttribute("SubscriptNoo", num);
				
				request.getRequestDispatcher("views/product_sub/product_subEnrollForm2.jsp").forward(request, response);
				
			} else {
				request.setAttribute("errorMsg", "오류났음");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		
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
