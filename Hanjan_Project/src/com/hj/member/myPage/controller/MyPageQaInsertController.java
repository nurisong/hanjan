package com.hj.member.myPage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.common.model.vo.Attachment;
import com.hj.community.qa.model.service.QAService;
import com.hj.community.qa.model.vo.QA;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MyPageQaInsertController
 */
@WebServlet("/insert.qa")
public class MyPageQaInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageQaInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024; // 10MByte
			
			HttpSession session = request.getSession();
			ServletContext application = session.getServletContext();
			
			String savePath = application.getRealPath("/resources/upfiles/board_upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userNo = multiRequest.getParameter("userNo");
			String qaCategory = multiRequest.getParameter("qaCategory");
			String qaTitle = multiRequest.getParameter("qaTitle");
			System.out.println(qaTitle);
			String qaContent = multiRequest.getParameter("qaContent");
			
			QA qa = new QA();
			qa.setQaWriter(userNo);
			qa.setQaCategory(qaCategory);
			qa.setQaTitle(qaTitle);
			qa.setQaContent(qaContent);
			System.out.println(qa);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/board_upfiles");
				at.setCommType("Q");
			}

			int result = new QAService().intsertQA(qa, at);
			
			if(result > 0) {
				// 작성  성공
				response.sendRedirect(request.getContextPath() + "/list.qa?cpage=1");
			} else {
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
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
