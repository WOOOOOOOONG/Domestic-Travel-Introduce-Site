package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;
import member.model.dao.MemberDao;
import member.model.dao.PlanDao;
import member.model.vo.Member;
import member.model.vo.MyPlan;

public class PlanService {
	// 계획 변경
	public int updatePlan(MyPlan p) {
		Connection conn = getConnection();
		
		int result = new PlanDao().updatePlan(conn, p);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 계획 삭제
	public int deletePlan(int pSeq, int mSeq) {
		Connection conn = getConnection();

		int result = new PlanDao().deletePlan(conn, pSeq, mSeq);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int insertPlan(MyPlan p) {
		Connection conn = getConnection();

		int result = new PlanDao().insertPlan(conn, p);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<MyPlan> selectAllPlan() {
		Connection conn = getConnection();

		ArrayList<MyPlan> result = new PlanDao().selectAllPlan(conn);

		close(conn);

		return result;
	}
}
