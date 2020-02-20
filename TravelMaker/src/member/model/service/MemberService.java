package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.dao.PlanDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

public class MemberService {

	// 로그인
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();

		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		
		if(loginUser != null) {
			new MemberDao().updateDate(conn, userId);
			commit(conn);
		}
		
		close(conn);

		return loginUser;
	}

	// 멤버 추가
	public int insertMember(Member m) {
		Connection conn = getConnection();

		int result = new MemberDao().insertMember(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
	
	// 멤버 확인
	public int idCheck(String mId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, mId);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Member> selectAllMember() {
	      Connection conn = getConnection();
	      
	      ArrayList<Member> mList = new MemberDao().selectAllMember(conn);
	      close(conn);
	      return mList;
	}
	
	// 멤버 정보 변경 
	public Member updateMember(Member m, String updateId) {
		Connection conn = getConnection();
		Member updateMember = null;
		
		int result = new MemberDao().updateMember(conn, m, updateId);
		System.out.println(result);
		if(result > 0) {
			updateMember = new MemberDao().selectMember(conn, updateId);
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMember;
	}
	
	// 멤버 비밀번호 변경
	public Member updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updateMember = null;
		int result = new MemberDao().updatePwd(conn, userId, userPwd, newPwd);
		if(result > 0) {
			updateMember = new MemberDao().selectMember(conn, userId);
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return updateMember;
	}
	
	// 6. 회원 탈퇴용 서비스
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int nicknameCheck(String nick) {
		Connection conn = getConnection();
		int result = new MemberDao().nicknameCheck(conn, nick);
		
		close(conn);
		
		return result;
	}

	public int insertProfile(int userSeq, String profile) {
		Connection conn = getConnection();

		int result = new MemberDao().insertProfile(conn, userSeq, profile);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public String findMemberId(String findName, String findNo) {
		Connection conn = getConnection();

		String memberId = new MemberDao().findMemberId(conn, findName, findNo);
		
		if(memberId != null) {
			commit(conn);
		}
		
		close(conn);

		return memberId;
	}

	public String findMemberPwd(String findId, String findName, String findNo) {
		Connection conn = getConnection();

		String memberPass = new MemberDao().findMemberPwd(conn, findId, findName, findNo);
		
		if(memberPass != null) {
			commit(conn);
		}
		
		close(conn);

		return memberPass;
	}
	
	public int report(int mSeq) {

        Connection conn = getConnection();
        
        int result = new MemberDao().report(conn, mSeq);
        
        if(result > 0) {
           commit(conn);
        }else {
           rollback(conn);
        }
        return result;
     }

	public Member reportNo(int mSeq) {
     Connection conn = getConnection();
     Member report = new MemberDao().reportNo(conn, mSeq);
     
     close(conn);
     return report;
	}

	public int getListCount() {
     Connection con = getConnection();
     int result = new MemberDao().getAllListCount(con);

     close(con);

     return result;


	  }


}
