package member.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String findId = request.getParameter("findID2");
		String findName = request.getParameter("findName2");
		String findNo = request.getParameter("findNo2");
		String memberPass = new MemberService().findMemberPwd(findId, findName, findNo);
		
		if(memberPass != "") {
			HttpSession session = request.getSession();
			session.setAttribute("memberPwd", "사용자의 비밀번호는 " + memberPass + "입니다");
			response.sendRedirect(request.getContextPath() + "/views/join&login/FindIdPwd.jsp");
		}else {
			request.getSession().setAttribute("memberPwd", "해당 사용자에 대한 정보가 없습니다");
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
