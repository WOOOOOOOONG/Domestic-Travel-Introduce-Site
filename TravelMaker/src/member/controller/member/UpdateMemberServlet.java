package member.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member loginUser = (Member)(request.getSession().getAttribute("loginUser"));
		String updateId = loginUser.getmId();
		
		String upId = request.getParameter("upId");
		String upPass = request.getParameter("upPass");
		String upNick = request.getParameter("upNick");
		String upPhone = request.getParameter("upPhone");
		
		String email1 = request.getParameter("upEmail");
		String email2 = request.getParameter("upEmail2");
		String upEmail = email1 + "@" + email2;
		
		Member m = new Member(upId, upPass, upNick, upPhone, upEmail);
		Member updateMember = new MemberService().updateMember(m, updateId);
		if(updateMember != null) {
			request.getSession().setAttribute("msg", "회원정보 변경");
			request.getSession().setAttribute("loginUser", updateMember);
			response.sendRedirect(request.getContextPath() + "/views/myPage/Info-update.jsp");
		} else {
			request.setAttribute("msg", "회원정보 변경 실패");
			response.sendRedirect(request.getContextPath());
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
