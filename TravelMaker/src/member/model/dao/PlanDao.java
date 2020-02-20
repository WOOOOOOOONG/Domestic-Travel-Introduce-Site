package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.MyPlan;

public class PlanDao {
	private Properties prop = new Properties();

	public PlanDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 계획 넣기 
	public int insertPlan(Connection conn, MyPlan mp) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertPlan");

		// int pId, String mId, String pName, Date date, String startTime, String endTime
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mp.getpSeq());
			pstmt.setInt(2, mp.getmSeq());
			pstmt.setString(3, mp.getpName());
			Date sqlDate1 = new java.sql.Date(mp.getStartDate().getTime());
			pstmt.setDate(4, sqlDate1);
			Date sqlDate2 = new java.sql.Date(mp.getEndDate().getTime());
			pstmt.setDate(5, sqlDate2);
			pstmt.setString(6, mp.getStartTime());
			pstmt.setString(7, mp.getEndTime());
			pstmt.setString(8, mp.getFileName());
			pstmt.setString(9, mp.getUrl());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 계획 삭제 
	public int deletePlan(Connection conn, int pSeq, int mSeq) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deletePlan");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pSeq);
			pstmt.setInt(2, mSeq);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	// 계획 수정 
	public int updatePlan(Connection conn, MyPlan mp) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mp.getpName());
			Date sqlDate1 = new java.sql.Date(mp.getStartDate().getTime());
			pstmt.setDate(2, sqlDate1);
			Date sqlDate2 = new java.sql.Date(mp.getEndDate().getTime());
			pstmt.setDate(3, sqlDate2);
			pstmt.setString(4, mp.getStartTime());
			pstmt.setString(5, mp.getEndTime());
			pstmt.setString(6, mp.getFileName());
			pstmt.setInt(7, mp.getpSeq());
			pstmt.setInt(8, mp.getmSeq());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<MyPlan> selectAllPlan(Connection conn) {
		ArrayList<MyPlan> mp = new ArrayList<MyPlan>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlan");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				MyPlan m = new MyPlan(rset.getInt("p_seq"), rset.getInt("m_seq"), rset.getString("p_name"),
						rset.getDate("start_date"), rset.getDate("end_date"), rset.getString("start_time"), 
						rset.getString("end_time"), rset.getString("filename"), rset.getString("url"));
				mp.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mp;
	}
}
