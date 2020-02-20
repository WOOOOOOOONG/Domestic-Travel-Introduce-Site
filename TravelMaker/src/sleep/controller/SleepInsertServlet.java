package sleep.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import sleep.model.service.SleepService;
import sleep.model.vo.Attachment;
import sleep.model.vo.Room;
import sleep.model.vo.Sleep;

/**
 * Servlet implementation class SleepInsertServlet
 */
@WebServlet("/insert.sl")
public class SleepInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    /**
     * Default constructor. 
     */
    public SleepInsertServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
	if (ServletFileUpload.isMultipartContent(request)) {
		int maxSize = 1024 * 1024 * 10;

		String root = request.getSession().getServletContext().getRealPath("/");

		String savePath = root + "/resources/sleep_uploadFile/";

		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

		ArrayList<String> changeFiles = new ArrayList<String>();
		ArrayList<String> originFiles = new ArrayList<String>();

		Enumeration<String> files = multiRequest.getFileNames();
		// -> 전송 순서 역순으로 쌓여 있음

		while (files.hasMoreElements()) {

			// files에 담겨있는 파일 리스트들의 name 값을 반환
			String name = files.nextElement();

			// 해당 파일이 null이 아닌 경우
			if (multiRequest.getFilesystemName(name) != null) {
				// getFilesystemName() - MyRenamePolicy의 rename 메소드에서
				// 작성한대로 rename 된 파일명
				String changeName = multiRequest.getFilesystemName(name);

				// getOriginalFileName() - 실제 사용자가 업로드 할 때 파일명
				String originName = multiRequest.getOriginalFileName(name);

				changeFiles.add(changeName);
				originFiles.add(originName);
			}
		}

		// 3_1. 파일 외에 게시판 제목, 내용, 작성자 회원 번호 받아와서 Sleep 객체 생성
		
		String sType = multiRequest.getParameter("sType");
		String sName = multiRequest.getParameter("sName");
		String sContent  = multiRequest.getParameter("sContent");
		String lcode = multiRequest.getParameter("lCode");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		String address = multiRequest.getParameter("address");
		String enName = multiRequest.getParameter("enName");
		int mId = ((Member)request.getSession().getAttribute("loginUser")).getM_seq();
		String sWriter = ((Member) request.getSession().getAttribute("loginUser")).getNickName();
		int price1 = Integer.parseInt(multiRequest.getParameter("price1"));
		int price2 = Integer.parseInt(multiRequest.getParameter("price2"));
		int price3 = Integer.parseInt(multiRequest.getParameter("price3"));
		String rContent1  = multiRequest.getParameter("rContent1");
		String rContent2 = multiRequest.getParameter("rContent2");
		String rContent3  = multiRequest.getParameter("rContent3");

		
		Sleep s = new Sleep();
		s.setsType(sType);
		s.setsName(sName);
		s.setsContent(sContent);
		s.setlCode(lcode);
		s.setPrice(price);
		s.setmId(mId);
		s.setsWriter(sWriter);
		s.setAddress(address);
		s.setEnName(enName);
		
		Room r1 = new Room(price1, rContent1);
		Room r2 = new Room(price2, rContent2);
		Room r3 = new Room(price3, rContent3);
		ArrayList<Room> R = new ArrayList<>();
		R.add(r1);
		R.add(r2);
		R.add(r3);
		
		System.out.println("s : " + s + " r : " + R);

		// 3_2. Attachment 테이블에 값 삽입할 것들 작업하기
		// Attachment 객체들을 담을 리스트 만들어 주기
		ArrayList<Attachment> fileList = new ArrayList<>();
		// 전송 순서 역순으로 파일이 changeFiles, originFiles에 저장 되었기 때문
		// 에 반복문을 역으로 수행함
		for (int i = originFiles.size() - 1; i >= 0; i--) {
			System.out.println("어테치먼트");
			Attachment at = new Attachment();
			at.setFilePath(savePath);
			at.setOriginName(originFiles.get(i));
			at.setChangeName(changeFiles.get(i));
			System.out.println(at);

			// 타이틀 이미지인 경우 fileLevel을 2으로, 일반 이미지면 fileLevel이 3
			// 타이틀 이미지가 originFiles에서 마지막 인덱스이기 때문에
			if (i == originFiles.size() - 1) {
				at.setFileLevel(2);
			} else {
				at.setFileLevel(3);
			}

			fileList.add(at);
			System.out.println("fileList : " + fileList);
		}
		/*int result = new BoardService().insertThumbnail(b, fileList);

		if (result > 0) {
			response.sendRedirect("festivalall.fe");
		}else {
			// 실패 시 저장된 사진 삭제
			for (int i = 0; i < changeFiles.size(); i++) {
				// 파일 시스템에 저장 된 이름으로 파일 객체 생성함
				File failedFile = new File(savePath + changeFiles.get(i));
				failedFile.delete();
			}

			request.setAttribute("msg", "사진 게시판 등록 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

		}*/

		// 4. 사진 게시판 작성용 비즈니스 로직을 처리할 서비스 요청
		// (board 객체, Attachment 리스트 전달)
		int result = new SleepService().insertSleep(s,fileList);
		int sId = new SleepService().selectsId();
		System.out.println(sId);
		int result1 = new SleepService().insertRoom(R, sId);
		System.out.println(result);
 
		if (result > 0 && result1 > 0) {
			response.sendRedirect("list.sl");
			
		} else {
			// 실패 시 저장된 사진 삭제
			for (int i = 0; i < changeFiles.size(); i++) {
				// 파일 시스템에 저장 된 이름으로 파일 객체 생성함
				File failedFile = new File(savePath + changeFiles.get(i));
				failedFile.delete();
			}

			request.setAttribute("msg", "사진 게시판 등록 실패!!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

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
