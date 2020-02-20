package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;
import board.model.vo.Reply;

/**
 * Servlet implementation class CommunityDetailServlet
 */
@WebServlet("/detail.co")
public class CommunityDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		BoardService bService = new BoardService();

		// 1. 해당 게시판 정보 조회
		Board board = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		
		if (cookies  != null) {
			for (Cookie c : cookies) {
				// bId 쿠키가 있는 경우
				if (c.getName().equals("bId" + bId)) {
					flag = true;
				}
			}
			// bId 쿠키가 없는 경우
			if (!flag) {
				// 게시글을 처음 클릭했으므로 조회수 증가 + 셀렉
				board = new BoardService().selectBoard(bId);
				// 쿠키 객체 생성
				Cookie c1 = new Cookie("bId" + bId, String.valueOf(bId));
				// 하루동안 저장
				c1.setMaxAge(300);
				response.addCookie(c1);
			} else {
				// bId 쿠키가 있는 경우는 게시글을 하루 안에 다시 클릭하는 것이므로
				// 조회수 증가하지 않고 셀렉
				board = new BoardService().selectBoardNoCnt(bId);
			}

		}
		ArrayList<Reply> rlist = bService.selectReplyList(bId);
		

		if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("rlist",rlist);
			request.getRequestDispatcher("views/board/community/communityDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "사진게시판 상세 보기 실패!!!");
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
