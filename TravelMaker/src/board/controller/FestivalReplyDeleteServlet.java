package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class FestivalReplyDeleteServlet
 */
@WebServlet("/deleteReply.fe")
public class FestivalReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FestivalReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rId = Integer.parseInt(request.getParameter("rId"));
		int bId = Integer.parseInt(request.getParameter("bId"));
		int flag = Integer.parseInt(request.getParameter("flag"));
				
		
		int result = new BoardService().deleteReply(rId);
		
		if(result>0) {
			request.setAttribute("bId", bId);
			request.setAttribute("flag", flag);
			if(flag == 2) {
				request.getRequestDispatcher("detail.fe").forward(request, response);
			}else {
				request.getRequestDispatcher("detail.co").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "댓글 삭제 실패");
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
