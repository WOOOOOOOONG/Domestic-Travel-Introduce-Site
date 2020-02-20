package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class FestivalUpdateServlet
 */
@WebServlet("/update.fe")
public class FestivalUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		BoardService bs = new BoardService();
		/*MultipartRequest multiRequest = new MultipartRequest(request,"utf-8");*/
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		
		
		Board board = new Board();
		board.setbTitle(request.getParameter("title"));
		board.setbContent(request.getParameter("content"));
		board.setlCode(request.getParameter("lcode"));
		board.setbId(bId);
		
		Information info = new Information();
		info.setsDay(request.getParameter("sdate"));
		info.seteDay(request.getParameter("edate"));
		info.setTel(request.getParameter("tel"));
		info.setPrice(Integer.parseInt(request.getParameter("price")));
		info.setAddress(request.getParameter("address"));
		info.setPage(request.getParameter("home"));
		info.setbId(bId);
		
		int result = bs.updateBoard(board,flag);
		int result1 = bs.updateInformation(info,flag);
		
		if(result>0 && result1>0) {
			
			request.setAttribute("bId", bId);
			request.setAttribute("flag",flag);
			request.getRequestDispatcher("detail.fe").forward(request, response);
		}else {
			request.setAttribute("msg", "게시글 수정 실패");
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
