package QA.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import QA.model.dao.QADao;
import QA.model.vo.QA;
import board.model.dao.BoardDao;

public class QAService {
	
	// 1. 나의 QA 리스트(회원)
	public ArrayList<QA> selectQAList(int mSeq, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		
		ArrayList<QA> list = new QADao().selectQAList(conn, mSeq, currentPage, boardLimit);
		
		close(conn);
		System.out.println(list);
		return list;
	}
	 
	// 2. 전체 QA 리스트(관리자가 회원들이 한 문의 내역 확인)
	public ArrayList<QA> selectAllQAList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<QA> list = new QADao().selectAllQAList(conn, currentPage, boardLimit);
		
		close(conn);
		
		return list;
	}
	
	// 3. 문의하기(회원)
	public int insertQuestion(QA q, int mSeq) {
		Connection conn = getConnection();
		
		int result = new QADao().insertQuestion(conn, q, mSeq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		
		return result;
	}
	
	// 4. 문의삭제(회원)
	public int deleteQuestion(int qId) {
		Connection conn = getConnection();
		
		int result = new QADao().deleteQuestion(conn, qId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 5. 문의수정(회원)
	public int updateQuestion(QA q) {
		Connection conn = getConnection();
		
		int result = new QADao().updateQuestion(conn, q);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 6. 문의상세페이지
	public QA selectQA(int qId) {
		Connection conn = getConnection();
		
		QA q = new QADao().selectQA(conn, qId);
		
		close(conn);
		
		return q;
	}
	
	// 6. 답변하기(관리자)
	public int insertAnswer(int qId, String answer) {
		Connection conn = getConnection();
		
		int result = new QADao().insertAnswer(conn, qId, answer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 7. 답변삭제(관리자)
	public int deleteAnswer(int qId) {
		Connection conn = getConnection();
		
		int result = new QADao().deleteAnswer(conn, qId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 8. 답변수정(관리자)
	public int updateAnswer(int qId, String answer) {
		Connection conn = getConnection();
		
		int result = new QADao().insertAnswer(conn, qId, answer);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int getListCount(int mSeq) {
		Connection con = getConnection();
		int result = new QADao().getListCount(con, mSeq);

		close(con);

		return result;
	}

	public int getAllListCount() {
		Connection con = getConnection();
		int result = new QADao().getAllListCount(con);

		close(con);

		return result;
	}
	

}
