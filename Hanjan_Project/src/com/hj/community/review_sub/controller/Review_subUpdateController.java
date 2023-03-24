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
 * Servlet implementation class Review_subUpdateController
 */
@WebServlet("/update.rs")
public class Review_subUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review_subUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent((request))) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/review_sub_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int revNo = Integer.parseInt(multiRequest.getParameter("rno"));
			String content = multiRequest.getParameter("content");
			int revRate = Integer.parseInt(multiRequest.getParameter("rate"));
			
			Review r = new Review();
			r.setRevNo(revNo);
			r.setRevContent(content);
			r.setRevRate(revRate);
			
			ArrayList<Attachment> list = new ArrayList();
			
			for(int i = 1; i <= 3; i++) {
				
				String key = "reUpfile" + i;
				
					
				if(multiRequest.getOriginalFileName(key) != null) {
					Attachment at = new Attachment();
					
					at.setOriginName(multiRequest.getOriginalFileName(key)); 
					at.setChangeName(multiRequest.getFilesystemName(key)); 
					at.setFilePath("/resources/upfiles/review_sub_upfiles/");
					at.setCommType("S");
					
					if(multiRequest.getParameter("originFileNo" + i) != null) {
						
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo" + i)));
						new File(savePath + multiRequest.getParameter("originFileName" + i)).delete();
						
					}else {
						at.setRefNo(revNo);
					}
					list.add(at);
				}
			}
			
			
			int result = new ReviewService().updateReview(r, list);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/detail.rs?rno=" + revNo);
			} else {
				request.setAttribute("errorMsg", "수정 실패");
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
