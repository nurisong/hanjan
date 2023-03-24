package com.hj.product_sub.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.product.model.service.ProductService;
import com.hj.product.model.vo.Product;
import com.hj.product_sub.model.service.SubscriptionService;
import com.hj.product_sub.model.vo.Subscription;
import com.hj.product_sub.model.vo.SubscriptionDetail;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Product_subUpdate2
 */
@WebServlet("/enrollNextUpdate.sub")
public class Product_subUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product_subUpdate2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//post
		request.setCharacterEncoding("UTF-8");

		if (ServletFileUpload.isMultipartContent(request)) {

			// 1.1전송용량제한(10Mbtye)
			int maxSize = 1024 * 1024 * 10;

			// 1.2저장할 서버의 물리적 경로제시
			String savePath = request.getServletContext().getRealPath("/resources/product_sub_upfiles/");
			//// #####////// 경로 나중에 수정하던가 이대로쓰던가 ////#####///////

			String pathss="resources/product_sub_upfiles";
			
			// 2 MultipartRequest객체 생성(파일명 수정해서 올리기)
			MultipartRequest mulRe = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			//// #####////// 경로 나중에 수정하던가 이대로쓰던가 ////#####///////
			

			
			//값 뽑기
			int subNo=Integer.parseInt(mulRe.getParameter("subNo"));
			String subName=mulRe.getParameter("subName");
			String subPrice=mulRe.getParameter("subPrice");
			String subMonth=mulRe.getParameter("subMonth");		
			String subDetail=mulRe.getParameter("subDetail");
			String subOrigin1=mulRe.getParameter("subImage1");			
			String subOrigin2=mulRe.getParameter("subImage2");
			String subStatus=mulRe.getParameter("subStatus");
			
			//값 담기
			Subscription subscription=new Subscription();
			subscription.setSubscriptNo(subNo);
			subscription.setSubscriptName(subName);
			subscription.setSubscriptPrice(subPrice);
			subscription.setSubscriptMonth(subMonth);		
			subscription.setSubscriptDetail(subDetail);
			subscription.setSubscriptStatus(subStatus);
			
			if (subscription.getSubscriptImage1() == null) {
				subscription.setSubscriptImage1("첨부파일없음");
			}
			if (subscription.getSubscriptImage2() == null) {
				subscription.setSubscriptImage2("첨부파일없음");
			}
			
			
			
			
			
			

			if (mulRe.getOriginalFileName("upfile1") != null) {
				subscription.setSubscriptImage1(
						request.getContextPath() + "/" + pathss + "/" + mulRe.getFilesystemName("upfile1"));
			} else {
				subscription.setSubscriptImage1(subOrigin1);
			}

			if (mulRe.getOriginalFileName("upfile2") != null) {
				subscription.setSubscriptImage2(
						request.getContextPath() + "/" + pathss + "/" + mulRe.getFilesystemName("upfile2"));
			} else {
				subscription.setSubscriptImage2(subOrigin2);
			}
			
			int result = new SubscriptionService().updateEnrollSub(subscription);

			if (result > 0) {
				ArrayList<SubscriptionDetail> pList=new SubscriptionService().selectSubProducts(subNo);
				request.setAttribute("Subscription", subscription);//구독정보
				request.setAttribute("pList", pList);//구독안 상품정보
				
				
				request.getRequestDispatcher("views/product_sub/product_subUpdateForm2.jsp").forward(request, response);
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
