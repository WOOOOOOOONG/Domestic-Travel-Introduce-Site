package QA.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QA.model.service.QAService;
import QA.model.vo.QA;
import member.model.vo.Member;

/**
 * Servlet implementation class QAInsertSelvlet
 */
@WebServlet("/insert.qa")
public class QAInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QAInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		Member m = (Member)request.getSession().getAttribute("loginUser");
		QA q = new QA(type, title, content);
		
		int result = new QAService().insertQuestion(q, m.getM_seq());
		
		if(result > 0) {
			response.sendRedirect("select.qa?mSeq=" + m.getM_seq());
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
