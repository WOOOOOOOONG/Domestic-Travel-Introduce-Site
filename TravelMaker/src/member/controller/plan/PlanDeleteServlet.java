package member.controller.plan;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.PlanService;
import member.model.vo.Member;
import member.model.vo.MyPlan;

/**
 * Servlet implementation class PlanDeleteServlet
 */
@WebServlet("/delete.pl")
public class PlanDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<MyPlan> planList = (ArrayList)request.getSession().getAttribute("planList");
		int mSeq = loginUser.getM_seq();
 		int pSeq = Integer.parseInt(request.getParameter("clickId"));
		
		
		int result = new PlanService().deletePlan(pSeq, mSeq);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			planList = new PlanService().selectAllPlan();
			request.getSession().setAttribute("planList", planList);
			session.setAttribute("msg", "게시글이 삭제되었습니다.");
			request.getRequestDispatcher("views/myPage/PlanList.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "게시글 삭제에 실패하였습니다.");
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
