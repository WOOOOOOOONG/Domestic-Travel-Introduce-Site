package member.controller.member;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
// --> 암호화 처리 후
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		String pass = request.getParameter("pass");
		String phone = request.getParameter("phone");
		
		String mNo = request.getParameter("mNo1");
		
		String email1 = request.getParameter("email");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		
		String nickName = request.getParameter("nickName");
		
		Member mem = new Member(mId, pass, mName, phone, mNo, email, nickName);

		int result = new MemberService().insertMember(mem);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "회원 가입을 성공하였습니다");
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("msg", "회원 가입이 실패했습니다");
			RequestDispatcher view = request.getRequestDispatcher(request.getContextPath());
			view.forward(request, response);
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
