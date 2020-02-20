package member.controller.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.service.PlanService;
import member.model.vo.Member;
import member.model.vo.MyPlan;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/findID.me")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String findName = request.getParameter("findName1");
		String findNo = request.getParameter("findNo1");
		String memberId = new MemberService().findMemberId(findName, findNo);
		if(memberId != "") {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", "사용자의 ID는 " + memberId + "입니다");
			response.sendRedirect(request.getContextPath() + "/views/join&login/FindIdPwd.jsp");
		}else {
			request.getSession().setAttribute("memberId", "해당 사용자에 대한 정보가 없습니다");
			response.sendRedirect(request.getContextPath() + "/views/join&login/FindIdPwd.jsp");
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
