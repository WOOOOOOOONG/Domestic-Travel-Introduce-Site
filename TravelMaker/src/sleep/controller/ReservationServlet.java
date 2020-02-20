package sleep.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import sleep.model.service.SleepService;
import sleep.model.vo.Attachment;
import sleep.model.vo.Room;
import sleep.model.vo.Sleep;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/reser.re")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet() 
     */
    public ReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rId = Integer.parseInt(request.getParameter("rId"));
		int sId = Integer.parseInt(request.getParameter("sId"));
		String rContent = request.getParameter("rContent");
		int price =Integer.parseInt( request.getParameter("price"));
		
		

		System.out.println("rId확인"+rId);
		System.out.println("rcontent"+rContent);
		System.out.println("price"+price);
		
		SleepService sService = new SleepService();
		Room room = new Room();
		ArrayList<Room> RList = new ArrayList<>();

		// 1. 해당 게시판 정보 조회
		Sleep sleep = new Sleep();

		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie c : cookies) {
				// bId 쿠키가 있는 경우
				if (c.getName().equals("bId" + rId)) {
					flag = true;
				}
			}
			System.out.println("쿠키아래");
			// bId 쿠키가 없는 경우
			if (!flag) {
				System.out.println("플래그아레");
				// 게시글을 처음 클릭했으므로 조회수 증가 + 셀렉
				room = new SleepService().selectreservationNoCnt(rId,sId);
				sleep = new SleepService().detailSleep(sId);
				// 쿠키 객체 생성
				Cookie c1 = new Cookie("bId" + rId, String.valueOf(rId));
				// 하루동안 저장
				c1.setMaxAge(5);
				response.addCookie(c1);
			} else {
				// bId 쿠키가 있는 경우는 게시글을 하루 안에 다시 클릭하는 것이므로
				// 조회수 증가하지 않고 셀렉
				room = new SleepService().selectreservationNoCnt(rId,sId);
				sleep = new SleepService().selectSleepNoCnt(sId);
			}

		}
		// 2. 해당 게시판의 사진들 리스트 조회
		

		if(room != null) {
			request.setAttribute("room", room);
			request.setAttribute("sleep", sleep);
		
			request.getRequestDispatcher("views/Sleep/reservation.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "사진게시판 상세 보기 실패!!!");
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
