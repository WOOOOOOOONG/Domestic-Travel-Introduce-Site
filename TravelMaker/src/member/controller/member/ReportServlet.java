package member.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/report.me")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mSeq = Integer.parseInt(request.getParameter("mSeq"));
		int bId = Integer.parseInt(request.getParameter("bId"));
		int result = 0;
		
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		
		if (cookies  != null) {
			for (Cookie c : cookies) {
				// bId 쿠키가 있는 경우
				System.out.println("c.getName : " + c.getName());
				if (c.getName().equals("bId" + bId)) {
					flag = true;
				}
			}
			// bId 쿠키가 없는 경우
			if (!flag) {
				// 게시글을 처음 클릭했으므로 조회수 증가 + 셀렉
				result = new MemberService().report(mSeq);
				// 쿠키 객체 생성
				Cookie c1 = new Cookie("bId" + bId, String.valueOf(bId));
				// 하루동안 저장
				c1.setMaxAge(5);
				response.addCookie(c1);
				
				Member m = new MemberService().reportNo(mSeq);
				if(m.getReport() == 5) {
					int delete = new MemberService().deleteMember(m.getmId());
				}
				
				if(result > 0) {
					response.sendRedirect("detail.co?bId=" + bId);
				}else {
					request.setAttribute("msg", "신고 실패!!");
					request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
				}
				
			} else {
				// bId 쿠키가 있는 경우는 게시글을 하루 안에 다시 클릭하는 것이므로
				// 조회수 증가하지 않고 셀렉
				System.out.println("result : " + result);
				request.setAttribute("msg", "같은 게시물은 일주일에 한번만 신고가능합니다.");
				request.getRequestDispatcher("detail.co?bId=" + bId).forward(request, response);
			}

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
