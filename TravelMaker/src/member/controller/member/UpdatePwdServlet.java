package member.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
// @WebServlet("/updatePwd.me") --> 암호화 처리 전
@WebServlet(name="UpdatePwdServlet", urlPatterns="/updatePwd.me")
// --> 암호화 처리 후
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		// 현재 비밀번호
		String userPwd = request.getParameter("userPwd");
		// 새로운 비밀번호
		String newPwd = request.getParameter("newPwd");
		
		Member updateMember = new MemberService().updatePwd(userId, userPwd, newPwd);
		
		if(updateMember != null) {
			request.setAttribute("msg", "성공적으로 비밀번호를 변경하였습니다.");
			request.getSession().setAttribute("loginUser", updateMember);
		}else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
		}
		
		request.getRequestDispatcher("views/member/pwdUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
