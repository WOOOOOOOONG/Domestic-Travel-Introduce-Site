package member.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.service.PlanService;
import member.model.vo.Member;

/**
 * Servlet implementation class InsertProfileServlet
 */
@WebServlet("/insertProfile.me")
public class InsertProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		boolean isMulti = ServletFileUpload.isMultipartContent(request);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if(isMulti) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDir = root + "resources/myplan_upload/";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
			String profile = multi.getFilesystemName("thumbnailImg1");
			System.out.println("profile: " + profile);
			int userSeq = loginUser.getM_seq();
			
			try {
				 int result = new MemberService().insertProfile(userSeq, profile);
                 if (result > 0) {
                	 loginUser = new MemberService().loginMember(loginUser.getmId(), loginUser.getPass());
                	 request.getSession().setAttribute("loginUser", loginUser);
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
