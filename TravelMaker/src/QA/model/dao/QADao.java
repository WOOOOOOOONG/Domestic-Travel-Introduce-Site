package QA.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import QA.model.vo.QA;
import board.model.dao.BoardDao;
import static common.JDBCTemplate.*;

public class QADao {
	private Properties prop = new Properties();
	public QADao() {
		String fileName = BoardDao.class.getResource("/sql/QA/QA-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	// 내가 문의한 내역 리스트
	public ArrayList<QA> selectQAList(Connection conn, int mSeq, int currentPage, int boardLimit) {
		ArrayList<QA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQAList");
		
		try {
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			System.out.println("mSeq, startRow, endRow : " + mSeq + ", " + startRow + ", " + endRow);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mSeq);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new QA(rset.getInt("qa_id"),
								rset.getString("QA_TYPE_NAME"),
								rset.getString("QA_TITLE"),
								rset.getString("QA_STATUS"),
								rset.getDate("ENROLL_DATE")));
				 
			}
			System.out.println("list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 전체 회원이 문의한 내역 리스트(m_id로 m_name 조인해서 가져옴)
	public ArrayList<QA> selectAllQAList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<QA> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectAllQAList");
		
		try {
			
			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QA(rset.getInt("QA_ID"),
								rset.getString("QA_TYPE_NAME"),
								rset.getString("QA_TITLE"),
								rset.getString("QA_STATUS"),
								rset.getDate("ENROLL_DATE"),
								rset.getString("M_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 문의하기
	public int insertQuestion(Connection conn, QA q, int mSeq) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			
			pstmt.setString(1, q.getqTitle());
			pstmt.setString(2, q.getqContent());
			pstmt.setInt(3, mSeq);
			pstmt.setString(4, q.getqType());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 문의 삭제하기
	public int deleteQuestion(Connection conn, int qId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, qId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 문의 수정하기
	public int updateQuestion(Connection conn, QA q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQuestion");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, q.getqType());
			pstmt.setString(2, q.getqTitle());
			pstmt.setString(3, q.getqContent());
			pstmt.setInt(4, q.getqId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 문의 상세 내역
	public QA selectQA(Connection conn, int qId) {
		QA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQA");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, qId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				q = new QA(rset.getInt("QA_ID"),
							rset.getString("QA_TYPE"),
								rset.getString("QA_TITLE"),
								rset.getString("QA_CONTENT"),
								rset.getString("QA_STATUS"),
								rset.getDate("ENROLL_DATE"),
								rset.getString("ANSWER"),
								rset.getDate("AN_DATE"),
								rset.getString("m_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}
	
	// 쿼리문 update로 answer 컬럼 content 값으로 수정(답변 수정할때도 이 메소드씀)
	public int insertAnswer(Connection conn, int qId, String answer) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, answer);
			pstmt.setInt(2, qId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	//쿼리문 update로 answer 컬럼 null값으로 수정
	public int deleteAnswer(Connection conn, int qId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAnswer");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, qId);
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con, int mSeq) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mSeq);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public int getAllListCount(Connection con) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getAllListCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

}
