package com.hj.community.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.community.board.model.service.BoardService;
import com.hj.community.board.model.vo.Board;

/**
 * Servlet implementation class ReviewInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String boardType = "N";
		
		Board b = new Board();
		b.setBoardWriter(request.getParameter("userNo"));
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setBoardType(boardType);
		
		int result = new BoardService().insertNotice(b);
		
		response.sendRedirect(request.getContextPath() + "/aList.no?cpage=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
