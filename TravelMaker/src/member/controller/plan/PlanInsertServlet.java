package member.controller.plan;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.PlanService;
import member.model.vo.Member;
import member.model.vo.MyPlan;

/**
 * Servlet implementation class PlanInsertServlet
 */
@WebServlet("/insert.pl")
public class PlanInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlanInsertServlet() {
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
		
		if(isMulti) {
			int maxSize = 1024 * 1024 * 10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String saveDir = root + "resources/myplan_upload/";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
			String planName = multi.getParameter("plan-name");
			String startDate = multi.getParameter("plan-start-date");
			String endDate = multi.getParameter("plan-end-date");
			String planStartTime = multi.getParameter("plan-start-time");
			String planEndTime = multi.getParameter("plan-start-time");
			String fileName = multi.getFilesystemName("thumbnailImg1");
			String url = "";
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
                	 planList = new PlanService().selectAllPlan();
                	 request.getSession().setAttribute("planList", planList);
                	 request.getRequestDispatcher("views/myPage/PlanList.jsp").forward(request, response);
                 } else {
                	 request.getRequestDispatcher("views/myPage/PlanList.jsp").forward(request, response);
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
