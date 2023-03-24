package com.hj.community.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hj.common.model.vo.Attachment;
import com.hj.community.board.model.service.BoardService;
import com.hj.community.board.model.vo.Board;

/**
 * Servlet implementation class BoardDetailViewController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		int count = new BoardService().increaseCount(boardNo);
		
		BoardService bService = new BoardService();
		
		if(count > 0) {
			Board b = bService.selectBoard(boardNo);
			b.setBoardNo(boardNo);
			
			Attachment at = bService.selectAttachment(boardNo);
			
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/community/board/boardDetailView.jsp").forward(request, response);
			
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
