package com.hj.community.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.hj.common.MyFileRenamePolicy;
import com.hj.common.model.vo.Attachment;
import com.hj.community.board.model.service.BoardService;
import com.hj.community.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardInsertController
 */
@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardInsertController() {
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
			
			String boardType = "B";
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/board_upfiles/");
			
			MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String userNo = multi.getParameter("userNo");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			
			Board b = new Board();
			b.setBoardWriter(userNo);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardType(boardType);
			
			Attachment at = null;
			
			if(multi.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				
				at.setOriginName(multi.getOriginalFileName("upfile"));
				at.setChangeName(multi.getFilesystemName("upfile"));
				at.setFilePath("/resources/upfiles/board_upfiles/");
				at.setCommType("B");
			}
			
			int result = new BoardService().insertBoard(b, at);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/list.bo?cpage=1");
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
