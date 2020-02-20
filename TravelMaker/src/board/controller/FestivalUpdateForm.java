package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;

/**
 * Servlet implementation class FestivalUpdateForm
 */
@WebServlet("/updateForm.fe")
public class FestivalUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalUpdateForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		BoardService bs = new BoardService();
		
		Board board = bs.selectBoardNoCnt(bId);
		Information info = bs.selectInformation(bId);
		ArrayList<Attachment> fileList = bs.selectThumbnail(bId);
		
		if(board != null && info != null) {
			request.setAttribute("board", board);
			request.setAttribute("info", info);
			request.setAttribute("flist",fileList);
			if(flag == 1) {
				request.getRequestDispatcher("views/board/trip/tripUpdateForm.jsp").forward(request, response);
			} else if(flag ==2) {
				request.getRequestDispatcher("views/board/festival/festivalUpdateForm.jsp").forward(request, response);
			}
			
		}else {
			request.setAttribute("msg", "수정할 게시글을 불러오는데 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
