package member.controller.plan;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;
import board.model.vo.PageInfo;
import member.model.service.PlanService;
import member.model.vo.Member;
import member.model.vo.MyPlan;

/**
 * Servlet implementation class DragDropServlet
 */
@WebServlet("/dragDrop.pl")
public class DragDropServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DragDropServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		ArrayList<MyPlan> planList = (ArrayList)request.getSession().getAttribute("planList");
		
		int flag = 2;
		BoardService bs = new BoardService();

		
		// 1_1. 게시판 리스트 총 갯수 구하기
		int listCount = bs.getListCount(flag);
		
		// System.out.println("listCount : " + listCount);
		
		// 1_2. 페이징 처리 추가
		
		// 페이지 수 처리용 변수 선언
		int currentPage;		// 현재 페이지
		int pageLimit;			// 한 페이지 하단에 보여질 페이지 수
		int maxPage;			// 전체 페이지에 가장 마지막 페이지
		int startPage;			// 한 페이지 하단에 보여질 시작 페이지
		int endPage;			// 한 페이지 하단에 보여질 끝 페이지
		
		int boardLimit = 6;	// 한 페이지에 보여질 게시글 최대 수
		
		// * currentPage : 현재 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		currentPage = 1;
		
		// 하지만 게시판 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// * pageLimit : 한 페이지 하단에 보여질 페이지 수
		pageLimit = 5;
		
		// * maxPage : 총 페이지의 마지막 수
		// 예를 들어 글 개수가 101개이면 페이지 수는 10 페이지가 아닌 짜투리 1개까지 한페이지로
		// 쳐서 11페이지가 되어야 함
		// (전체 게시글 수 / 한 페이지에 보여질 개수) 결과를 올림 처리
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 수
		// 나의 현재 페이지(currentPage)에서 pageLimit만큼을 나누고 다시 곱한 뒤 1을 더한다 
		// 1 / 10 * 10 + 1 -> 1
		// 5 / 10 * 10 + 1 -> 1
		// 11 / 10 * 10 + 1 -> 11
		// 15 / 10 * 10 + 1 -> 11
		// 여기서 한가지 예외 상황은 10(20, 30, ...)인데 딱 떨어지는 숫자는 몫이 하나 더 늘어남
		// 그것을 처리하기 위해 currentPage-1을 한다
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에서 보여질 마지막 페이지 수
		endPage = startPage + pageLimit - 1;
		
		// 하지만 마지막 페이지 수가 총 페이지 수보다 클 경우
		// maxPage가 13페이지인데 endPage가 20페이지 일 수는 없음
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 위에서 계산 된 모든 페이지 관련 변수들을 따로 관리하기는 어려우므로
		// 페이지 정보를 공유할 vo 객체 PageInfo 클래스를 만들고 오자
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		ArrayList<Board> blist = bs.selectList(flag,currentPage, boardLimit, 1);
		ArrayList<Attachment> flist = bs.selectList(flag,currentPage, boardLimit, 2);
		ArrayList<Information> in = bs.InformationAll();
		
		if(isMulti) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDir = root + "resources/myplan_upload/";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
			String planName = multi.getParameter("addtitle");
			String startDate = multi.getParameter("startDate");
			String endDate = multi.getParameter("startDate");
			String planStartTime = "12:00";
			String planEndTime = "12:00";
			String fileName = multi.getParameter("filename");
			String url = multi.getParameter("url");
			
			fileName = fileName.substring(43, 66);
			System.out.println("substring : " + fileName);
			int userSeq = loginUser.getM_seq();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date planStartDate = null;
			Date planEndDate = null;
			try {
				planStartDate = sdf.parse(startDate);
				planEndDate = sdf.parse(endDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int pId = 1;
			if(planList != null) {
				int max = 1;
				for(MyPlan p : planList) {
					if(p.getmSeq() == userSeq && p.getpSeq() >= max) {
						max = p.getpSeq();
					}
				}
				pId = ++max;
			}
			MyPlan p = new MyPlan(pId, userSeq, planName, planStartDate
						, planEndDate, planStartTime, planEndTime, fileName, url);
			try {
				 int result = new PlanService().insertPlan(p);
                 if (result > 0) {
                	 request.setAttribute("in", in);
         			 request.setAttribute("blist", blist);
         			 request.setAttribute("flist", flist);
         			 request.setAttribute("pi", pi);
                	 planList = new PlanService().selectAllPlan();
                	 request.getSession().setAttribute("planList", planList);
                	 request.getRequestDispatcher("festivalMember.fe").forward(request, response);
                 } else {
                	 request.getRequestDispatcher("festivalMember.fe").forward(request, response);
                 }
           } catch (Exception e) {
                 e.printStackTrace();
           }
		}else {
			
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
