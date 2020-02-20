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
 * Servlet implementation class FestivalDetailServlet
 */
@WebServlet("/detail.fe")
public class FestivalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));

		BoardService bService = new BoardService();

		int detailflag = 2;
		if(request.getParameter("flag") != null) {
			detailflag = Integer.parseInt(request.getParameter("flag"));
		}else {
			detailflag = 2;
		}
		// 1. 해당 게시판 정보 조회
		Board board = null;

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie c : cookies) {
				// bId 쿠키가 있는 경우
				if (c.getName().equals("bId" + bId)) {
					flag = true;
				}
			}
			System.out.println("쿠키아래");
			// bId 쿠키가 없는 경우
			if (!flag) {
				System.out.println("플래그아레");
				// 게시글을 처음 클릭했으므로 조회수 증가 + 셀렉
				board = new BoardService().selectBoard(bId);
				// 쿠키 객체 생성
				Cookie c1 = new Cookie("bId" + bId, String.valueOf(bId));
				// 하루동안 저장
				c1.setMaxAge(5);
				response.addCookie(c1);
			} else {
				// bId 쿠키가 있는 경우는 게시글을 하루 안에 다시 클릭하는 것이므로
				// 조회수 증가하지 않고 셀렉
				board = new BoardService().selectBoardNoCnt(bId);
			}

		}
		// 2. 해당 게시판의 사진들 리스트 조회
		ArrayList<Attachment> fileList = bService.selectThumbnail(bId);
		Information in = bService.selectInformation(bId);
		ArrayList<Reply> rlist = bService.selectReplyList(bId);
		
		if(fileList != null) {
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
			request.setAttribute("in", in);
			request.setAttribute("rlist",rlist);
			if(detailflag == 2) {
				request.getRequestDispatcher("views/board/festival/festivalDetail.jsp").forward(request, response);
			}else if(detailflag ==1) {
				request.getRequestDispatcher("views/board/trip/tripDetail.jsp").forward(request, response);
				
			}
			
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
