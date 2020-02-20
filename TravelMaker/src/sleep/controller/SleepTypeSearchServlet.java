package sleep.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.Information;
import sleep.model.service.SleepService;
import sleep.model.vo.Attachment;
import sleep.model.vo.PageInfo;
import sleep.model.vo.Sleep;

/**
 * Servlet implementation class SleepTypeSearchServlet
 */
@WebServlet("/type.sl")
public class SleepTypeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SleepTypeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	SleepService ss = new SleepService();

	String lname = "";
	
	int stype = Integer.parseInt(request.getParameter("stype"));
	
	System.out.println("stype : " +stype);
	// 1_1. 게시판 리스트 총 갯수 구하기
	int listCount = ss.getListCount();


	// 1_2. 페이징 처리 추가

	// 페이지 수 처리용 변수 선언
	int currentPage; // 현재 페이지
	int pageLimit; // 한 페이지 하단에 보여질 페이지 수
	int maxPage; // 전체 페이지에 가장 마지막 페이지
	int startPage; // 한 페이지 하단에 보여질 시작 페이지
	int endPage; // 한 페이지 하단에 보여질 끝 페이지

	int boardLimit = 4; // 한 페이지에 보여질 게시글 최대 수

	currentPage = 1;

	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}

	pageLimit = 5;
	maxPage = (int) Math.ceil((double) listCount / boardLimit);

	startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

	endPage = startPage + pageLimit - 1;

	if (maxPage < endPage) {
		endPage = maxPage;
	}

	PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);

	ArrayList<Sleep> list = new SleepService().selectLocationList(stype, currentPage, boardLimit);
	ArrayList<Attachment> list2 = ss.selectLocationAttachment(stype,currentPage,boardLimit);
	
	switch(stype) {
	case 1 : lname="호텔"; break;
	case 2 : lname="모텔"; break;
	case 3 : lname="펜션"; break;
	
	
	}

	if (list != null && list2 != null) {
		
		request.setAttribute("lname", lname);
		request.setAttribute("slist", list);
		request.setAttribute("flist", list2);
		request.setAttribute("pi", pi);
		request.setAttribute("listCount", listCount);
			
			RequestDispatcher view = request.getRequestDispatcher("views/Sleep/SleepAll.jsp");
			view.forward(request, response);
		

	} else {
		request.setAttribute("msg", "지역별 조회 실패!!");
		request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
