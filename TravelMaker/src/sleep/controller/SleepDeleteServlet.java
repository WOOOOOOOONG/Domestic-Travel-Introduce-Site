package sleep.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sleep.model.service.SleepService;

/**
 * Servlet implementation class SleepDeleteServlet
 */
@WebServlet("/delete.sl")
public class SleepDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SleepDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sid = Integer.parseInt(request.getParameter("sId"));
		
		System.out.println("sid : " +sid); 

    
    int result = new SleepService().deleteSleep(sid);
    int result1 = new SleepService().deleteAttachment(sid);
    int result2 = new SleepService().deleteroom(sid);
     
    if(result>0 && result1>0 && result2>0) {
       response.sendRedirect("list.sl");
    }else {
       request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
       request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
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
