package sleep.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.*;

import board.model.vo.Board;

import static common.JDBCTemplate.*;

import sleep.model.vo.Attachment;
import sleep.model.vo.Room;
import sleep.model.vo.Sleep;

public class SleepDao {
	private Properties prop = new Properties();

	public SleepDao() {
		String fileName = SleepDao.class.getResource("/sql/Sleep/Sleep-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 전체 리스트
	public ArrayList<Sleep> selectList(Connection conn) {
		ArrayList<Sleep> list = new ArrayList<>();

		return list;
	}

	// 삽입
	public int insertSleep(Connection conn, Sleep s) throws FileNotFoundException, IOException {
		PreparedStatement pstmt = null;
		int result = 0;

		String sql = prop.getProperty("insertSleep");

		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s.getsType());
			pstmt.setString(2, s.getsName());
			pstmt.setString(3, s.getsContent());
			pstmt.setString(4, s.getlCode());
			pstmt.setInt(5, s.getPrice());
			pstmt.setInt(6, s.getmId());
			pstmt.setString(7, s.getsWriter());
			pstmt.setString(8, s.getAddress());
			pstmt.setString(9, s.getEnName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println();
		return result;
	}

	// 수정
	/*
	 * public int updateSleep(Connection conn, int sId, Sleep s) { Properties prop =
	 * null; PreparedStatement pstmt = null; int result = 0; String sql =
	 * prop.getProperty("updateSleep");
	 * 
	 * try { pstmt=conn.prepareStatement(sql);
	 * 
	 * pstmt.setInt(1, s.getsId()); pstmt.setString(2, s.getsType());
	 * pstmt.setString(3, s.getsName()); pstmt.setString(4, s.getsContent());
	 * pstmt.setInt(5, s.getrId()); pstmt.setInt(6, s.getlCode());
	 * 
	 * result = pstmt.executeUpdate();
	 * 
	 * 
	 * 
	 * 
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }finally { close(pstmt); }
	 * return result; }
	 */

	// 삭제
	public int deleteSleep(Connection conn, int sid) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("rid dao" + sid);
		String sql = prop.getProperty("deleteSleep");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	// 상세보기
	public Sleep detailSleep(Connection conn, int sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sleep s = null;

		String query = prop.getProperty("selectSleep");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, sId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enname"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	// 타입별 방보여주기(호텔,모텔,팬션)
	public ArrayList<Room> selectrList(Connection conn, int sId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Room> RList  = new ArrayList<>();

		String query = prop.getProperty("selectrList");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, sId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				RList.add(new Room(rset.getInt("r_id"),rset.getInt("price"),rset.getString("r_name"),rset.getString("r_content"),rset.getInt("s_id"),rset.getInt("s_type")
									));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("RList : " + RList);
		return RList;
	}

	// 예약하기
	public int reservation(Connection conn, String mId, String rId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 사진 게시판 게시글 리스트 조회
	public ArrayList<Sleep> selectSFist(Connection conn) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Sleep> selectSList(Connection conn, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sleep> list = null;

		String sql = prop.getProperty("selectBList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Sleep>();

			while (rset.next()) {
				list.add(new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enname")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList selectFList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectFList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("s_id"));
				at.setChangeName(rset.getString("newfilename"));

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("insertAttachment");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());

				result += pstmt.executeUpdate();

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getListCount(Connection con) {
		int listCount = 0;

		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

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

	public int increaseCount(Connection conn, int sId) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sId);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Sleep selectSleep(Connection conn, int sId) {
		PreparedStatement pstmt = null;
		Sleep s = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectSleep");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("eeName"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return s;

	}

	public ArrayList<Attachment> selectThumbnail(Connection conn, int sId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("selectThumbnail");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sId);

			rs = pstmt.executeQuery();

			list = new ArrayList<Attachment>();

			while (rs.next()) {
				Attachment at = new Attachment();
				at.setfId(rs.getInt("no"));
				at.setbId(rs.getInt("s_id"));
				at.setOriginName(rs.getString("originname"));
				at.setChangeName(rs.getString("newfilename"));
				at.setFilePath(rs.getString("filepath"));

				list.add(at);

			}
			System.out.println("ㅁ너아ㅣ런ㅇㄹ  : " + list);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int increaseCount(Connection conn, String sId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Sleep reservation(Connection conn, int rId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Sleep s = null;

		String query = prop.getProperty("selectSleep");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, rId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				s = new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enname"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return s;
	}

	public int insertRoom(Connection conn, ArrayList<Room> R, int sId) {
		PreparedStatement pstmt = null;
		int result = 0;
		for (Room r : R) {

			String sql = prop.getProperty("insertRoom");

			System.out.println(sql);

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, r.getPrice());
				pstmt.setString(2, r.getrContent());
				pstmt.setInt(3, sId);

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	public int selectsId(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int sId = 0;

		String query = prop.getProperty("selectsId");

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				sId = rset.getInt("s_id");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sId;
	}

	public Room selectreservation(Connection con, int rId, int sId) {
		PreparedStatement pstmt = null;
		Room r = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectreser");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rId);
			pstmt.setInt(2, sId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				r = new Room(rset.getInt("r_id"),rset.getInt("price"),rset.getString("r_name"),rset.getString("r_content"),rset.getInt("s_id"),rset.getInt("s_type"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return r;
	}

	public int deleteAttachment(Connection conn, int sid) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteAttachment");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteRoom(Connection conn, int sid) {
		int result = 0;

	PreparedStatement pstmt = null;
	String sql = prop.getProperty("deleteRoom");
 
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, sid);

		result = pstmt.executeUpdate();

	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	return result;
}

	public ArrayList<Sleep> selectSearchList(Connection con, String search, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sleep> list = null;
		String sql = prop.getProperty("selectSearchTitleList");


		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


			rset = pstmt.executeQuery();

			list = new ArrayList<Sleep>();

			while (rset.next()) {
				list.add(new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection con, int flag) {
	int listCount = 0;
	PreparedStatement pstmt = null;
	ResultSet rset = null;

	String sql = prop.getProperty("getListCounts");

	try {
		pstmt = con.prepareStatement(sql);

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

	public ArrayList<Attachment> selectSearchAttachment(Connection con, String search, int currentPage, int boardLimit) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectSearchAttachment");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);


			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("s_id"));
				at.setChangeName(rset.getString("newfilename"));

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}



	public ArrayList<Sleep> selectLocationList(Connection con, int stype, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sleep> list = null;
		
		String sql = prop.getProperty("selectStype");

		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;


			pstmt.setInt(1, stype);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Sleep>();

			while (rset.next()) {
				list.add(new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Attachment> selectLocationAttachment(Connection con, int stype, int currentPage, int boardLimit) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

	PreparedStatement pstmt = null;
	ResultSet rset = null;

	String query = prop.getProperty("selectLocationAttachment");

	try {
		pstmt = con.prepareStatement(query);

		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		pstmt.setInt(1, stype);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, endRow);

		rset = pstmt.executeQuery();

		while (rset.next()) {
			Attachment at = new Attachment();
			at.setbId(rset.getInt("s_id"));
			at.setChangeName(rset.getString("newfilename"));

			list.add(at);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return list;
}

	public ArrayList<Sleep> sleepLocation(Connection con, int lId, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Sleep> list = null;
		
		String sql = prop.getProperty("sleepLocation");

		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;


			pstmt.setInt(1, lId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Sleep>();

			while (rset.next()) {
				list.add(new Sleep(rset.getInt("s_id"), rset.getString("s_type"), rset.getString("s_Name"),
						rset.getString("s_content"), rset.getString("l_code"), rset.getInt("price"),
						rset.getInt("m_seq"), rset.getString("writer"), rset.getInt("view_cnt"),
						rset.getString("status"), rset.getString("address"), rset.getString("enName")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Attachment> sleepAttachmentLocation(Connection con, int lId, int currentPage, int boardLimit) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
 
		String query = prop.getProperty("sleepAttachmentLocation");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, lId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("s_id"));
				at.setChangeName(rset.getString("newfilename"));

				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	

	}

