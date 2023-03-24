package com.hj.community.review_sub.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.common.model.vo.Attachment;
import com.hj.community.review.model.service.ReviewService;
import com.hj.community.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Review_subInsertController
 */
@WebServlet("/insert.rs")
public class Review_subInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_subInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String revType = "S";
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/review_sub_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String sProNo = "1"; // String sProNo = multi.getParameter("sProNo");
			String userNo = multiRequest.getParameter("userNo");
			String content = multiRequest.getParameter("content");
			int sRate = Integer.parseInt(multiRequest.getParameter("rate"));
			
			
			Review r = new Review();
			r.setRevWriter(userNo);
			r.setRevContent(content);
			r.setRevRate(sRate);
			r.setRevType(revType);
			r.setRevProduct(sProNo);
			
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 3; i++) {
				
				String key = "file" + i;
				
				if(multiRequest.getOriginalFileName(key) != null) {
					
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName(key)); 
					at.setChangeName(multiRequest.getFilesystemName(key)); 
					at.setFilePath("/resources/upfiles/review_sub_upfiles/");
					at.setCommType("S");
					
					list.add(at);
					
				}
			}
			
			int result = new ReviewService().insertReview(r, list);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/list.rs?cpage=1");
			} else {
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
