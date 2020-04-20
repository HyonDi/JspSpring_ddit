package com.jsp.action.board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dto.BoardVO;
import com.jsp.service.BoardService;

public class BoardDetailAction implements Action {
	
	// 의존주입위한코드.
	private BoardService boardService; // = new BoardServiceImpl.getInstance();
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/detailBoard";
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		try {
			BoardVO board = boardService.getBoard(bno);
			request.setAttribute("board", board);
		} catch(SQLException e) {
			e.printStackTrace();
			url="error/500_error";
		}
		
		return url;
	}

}
