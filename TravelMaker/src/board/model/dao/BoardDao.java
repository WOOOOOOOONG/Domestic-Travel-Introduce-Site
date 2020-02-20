package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Information;
import board.model.vo.Reply;
import member.model.vo.Member;

public class BoardDao {

	private Properties prop = new Properties();

	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int getListCount(Connection con, int flag) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("getListCount");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, flag);
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

	public Board selectBoard(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("selectBoard");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, bid);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board(rset.getInt("b_id"), rset.getDate("write_date"), rset.getDate("update_date"),
						rset.getString("title"), rset.getString("content"), rset.getInt("view_cnt"),
						rset.getString("writer"), rset.getString("status"), rset.getString("l_code"),
						rset.getInt("b_type"),rset.getInt("m_seq"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public Board selectBoardNoCnt(Connection con, int bid) {
		// TODO Auto-generated method stub
		return new Board();
	}

	public int deleteBoard(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int deleteAttachment(Connection con, int bid) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertBoard(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			pstmt.setInt(4, b.getmId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBoard(Connection con, Board b, int flag) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBoard");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(b.getlCode()));
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setInt(4, b.getbId());
			pstmt.setInt(5, flag);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateInformation(Connection con, Information info, int flag) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateInformation");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, info.getsDay());
			pstmt.setString(2, info.geteDay());
			pstmt.setString(3, info.getTel());
			pstmt.setInt(4, info.getPrice());
			pstmt.setString(5, info.getAddress());
			pstmt.setString(6, info.getPage());
			pstmt.setInt(7, info.getbId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시판 조회용
	public ArrayList<Board> selectBList(Connection con, int currentPage, int boardLimit, int flag) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;

		String query = prop.getProperty("selectBList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rs.next()) {
				list.add(new Board(rs.getInt("b_id"), rs.getDate("write_date"), rs.getDate("update_date"),
						rs.getString("title"), rs.getString("content"), rs.getInt("view_cnt"), rs.getInt("good"),
						rs.getInt("notgood"), rs.getString("writer"), rs.getString("status"), rs.getString("l_code"),
						rs.getInt("s_type"), rs.getInt("b_type"), rs.getInt("m_seq")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList selectFList(Connection con, int currentPage, int boardLimit, int flag) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectFList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("b_id"));
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

	public int insertThumbnail(Connection con, Board b, ArrayList<Attachment> fileList) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 축제 디테일
	public ArrayList<Attachment> selectThumbnail(Connection con, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("selectThumbnail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bId);

			rs = pstmt.executeQuery();

			list = new ArrayList<Attachment>();

			while (rs.next()) {
				Attachment at = new Attachment();
				at.setfId(rs.getInt("no"));
				at.setbId(rs.getInt("b_id"));
				at.setOriginName(rs.getString("originname"));
				at.setChangeName(rs.getString("newfilename"));
				at.setFilePath(rs.getString("filepath"));
				at.setCreateDate(rs.getDate("write_date"));

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

	public Information selectInformtion(Connection con, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Information in = null;

		String query = prop.getProperty("selectInformation");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, bId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				in = new Information();
				in.setsDay(rs.getString("to_char(sday)"));
				in.seteDay(rs.getString("to_char(eday)"));
				in.setTel(rs.getString("tel"));
				in.setPrice(rs.getInt("price"));
				in.setAddress(rs.getString("address"));
				in.setPage(rs.getString("pageaddress"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return in;
	}

	public ArrayList<Reply> selectReplyList(Connection con, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> rlist = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bId);
			
			rs = pstmt.executeQuery();
			
			rlist = new ArrayList<Reply>();
			
			while(rs.next()) {
				rlist.add(new Reply(rs.getInt("r_id"),
									rs.getString("r_content"),
									rs.getInt("b_id"),
									rs.getString("m_name"),
									rs.getDate("write_date"),
									rs.getString("status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return rlist;
	}

	public int insertReply(Connection con, Reply r) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("insertReply");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, r.getrContent());
			pstmt.setInt(2, r.getRefbId());
			pstmt.setInt(3, Integer.parseInt(r.getrWriter()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*
	 * public ArrayList<Board> selectList(Connection con, int currentPage, int
	 * boardLimit) { ArrayList<Board> list = new ArrayList<>(); PreparedStatement
	 * pstmt = null; ResultSet rset = null;
	 * 
	 * String sql = prop.getProperty("selectList");
	 * 
	 * try { pstmt = con.prepareStatement(sql);
	 * 
	 * int startRow = (currentPage-1) * boardLimit +1; int endRow = startRow +
	 * boardLimit -1;
	 * 
	 * pstmt.setInt(1, startRow); pstmt.setInt(2, endRow);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while(rset.next()) { list.add(new Board(rset.getInt(2), rset.getDate(3),
	 * rset.getDate(4),rset.getString(5),rset.getString(6),
	 * rset.getInt(7),rset.getInt(8),rset.getInt(9),rset.getString(10),rset.
	 * getString(11),rset.getInt(12),rset.getInt(13),rset.getInt(14),rset.getInt(15)
	 * )); } } catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }finally { close(rset); close(pstmt); }
	 * 
	 * 
	 * 
	 * return list; }
	 */

	public int insertThBoard(Connection conn, Board b, int flag) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertThBoard");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			pstmt.setInt(4, Integer.parseInt(b.getlCode()));
			pstmt.setInt(5, flag);
			pstmt.setInt(6, b.getmId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertAttachment");

		try {

			for (int i = 0; i < fileList.size(); i++) {
				Attachment at = fileList.get(i);

				pstmt = conn.prepareStatement(query);

				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());

				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertInformation(Connection conn, Information in) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertInformation");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, in.getsDay());
			pstmt.setString(2, in.geteDay());
			pstmt.setString(3, in.getTel());
			pstmt.setInt(4, in.getPrice());
			pstmt.setString(5, in.getAddress());
			pstmt.setString(6, in.getPage());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int increaseCount(Connection con, int bid) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("increaseCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/*
	 * public ArrayList<Board> selectList(Connection con, String search, String
	 * searchCondition) { ArrayList<Board> list = new ArrayList<>();
	 * PreparedStatement pstmt = null; ResultSet rset = null;
	 * 
	 * String sql= "";
	 * 
	 * if(searchCondition.equals("title")) {
	 * sql=prop.getProperty("selectSearchTitleList");
	 * 
	 * }else { sql = prop.getProperty("selectSearchContentList"); }
	 * 
	 * try { pstmt = con.prepareStatement(sql); pstmt.setString(1, search);
	 * 
	 * rset = pstmt.executeQuery();
	 * 
	 * while(rset.next()) { list.add(new
	 * Board(rset.getInt("b_id"),rset.getDate("write_date"),rset.getDate(
	 * "update_date"),rset.getString("title")
	 * ,rset.getString("content"),rset.getInt("view_cnt"),rset.getInt("good"),rset.
	 * getInt("notgood"),rset.getString("writer")
	 * ,rset.getString("status"),rset.getString("l_code"),rset.getInt("s_type"),rset
	 * .getInt("b_type"),rset.getInt("m_seq"))); } } catch (SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); }finally { close(rset);
	 * close(pstmt); }
	 * 
	 * return list; }
	 */

	public ArrayList<Board> selectSearchList(Connection con, String search, int currentPage,
			int boardLimit, int flag) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		String sql = prop.getProperty("selectSearchTitleList");


		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setString(2, search);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rs = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rs.next()) {
				list.add(new Board(rs.getInt("b_id"), rs.getDate("write_date"), rs.getDate("update_date"),
						rs.getString("title"), rs.getString("content"), rs.getInt("view_cnt"), rs.getInt("good"),
						rs.getInt("notgood"), rs.getString("writer"), rs.getString("status"), rs.getString("l_code"),
						rs.getInt("s_type"), rs.getInt("b_type"), rs.getInt("m_seq")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Attachment> selectSearchAttachment(Connection con, String search, int currentPage, int boardLimit, int flag) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectSearchAttachment");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setString(2, search);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("b_id"));
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

	public ArrayList<Board> selectLocationList(Connection con, int lId, int currentPage, int boardLimit, int flag) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		
		String sql = prop.getProperty("selectLocationList");

		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setInt(2, lId);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rs = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rs.next()) {
				list.add(new Board(rs.getInt("b_id"), rs.getDate("write_date"), rs.getDate("update_date"),
						rs.getString("title"), rs.getString("content"), rs.getInt("view_cnt"), rs.getInt("good"),
						rs.getInt("notgood"), rs.getString("writer"), rs.getString("status"), rs.getString("l_code"),
						rs.getInt("s_type"), rs.getInt("b_type"), rs.getInt("m_seq")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Attachment> selectLocationAttachment(Connection con, int lId, int currentPage, int boardLimit, int flag) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectLocationAttachment");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, flag);
			pstmt.setInt(2, lId);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("b_id"));
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

	public ArrayList<Board> selectMonthList(Connection con, int month, int currentPage, int boardLimit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> list = null;
		String sql = "";
		
		if(month==1) {
			sql = prop.getProperty("selectMonth1");
		}else if(month==2) {
			sql = prop.getProperty("selectMonth2");
		}else if(month==3) {
			sql = prop.getProperty("selectMonth3");
		}else if(month==4) {
			sql = prop.getProperty("selectMonth4");
		}

		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rs = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while (rs.next()) {
				list.add(new Board(rs.getInt("b_id"), rs.getDate("write_date"), rs.getDate("update_date"),
						rs.getString("title"), rs.getString("content"), rs.getInt("view_cnt"), rs.getInt("good"),
						rs.getInt("notgood"), rs.getString("writer"), rs.getString("status"), rs.getString("l_code"),
						rs.getInt("s_type"), rs.getInt("b_type"), rs.getInt("m_seq")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Attachment> selectMonthAttachment(Connection con, int month, int currentPage, int boardLimit) {
		ArrayList<Attachment> list = new ArrayList<Attachment>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = "";
		
		if(month==1) {
			sql = prop.getProperty("selectMonthAttachment1");
		}else if(month==2) {
			sql = prop.getProperty("selectMonthAttachment2");
		}else if(month==3) {
			sql = prop.getProperty("selectMonthAttachment3");
		}else if(month==4) {
			sql = prop.getProperty("selectMonthAttachment4");
		}

		try {
			pstmt = con.prepareStatement(sql);

			int startRow = (currentPage - 1) * boardLimit + 1;
			int endRow = startRow + boardLimit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				Attachment at = new Attachment();
				at.setbId(rset.getInt("b_id"));
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

	public ArrayList<Information> InformationAll(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Information> in = new ArrayList<Information>();

		String query = prop.getProperty("InformationAll");

		try {
			pstmt = con.prepareStatement(query);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				in.add(new Information(rs.getInt("b_id"),rs.getString("to_char(sday)"),
						rs.getString("to_char(eday)"), rs.getString("tel"),rs.getInt("price"),
						rs.getString("address"),rs.getString("pageaddress")));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return in;
	}
	
	public int updateCBoard(Connection con, Board b) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("updateCBoard");

	      try {
	         pstmt = con.prepareStatement(query);

	         pstmt.setString(1, b.getbTitle());
	         pstmt.setString(2, b.getbContent());
	         pstmt.setInt(3, b.getbId());

	         result = pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }

	public int deleteReply(Connection con, int rId) {
		 PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("deleteReply");

	      try {
	         pstmt = con.prepareStatement(query);

	         pstmt.setInt(1, rId);

	         result = pstmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	}

	public ArrayList selectAllList(Connection con, int currentPage, int boardLimit, int flag) {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<Board> list = null;
			String sql = prop.getProperty("selectAllList");


			try {
				pstmt = con.prepareStatement(sql);

				int startRow = (currentPage - 1) * boardLimit + 1;
				int endRow = startRow + boardLimit - 1;

				pstmt.setInt(1, flag);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);				

				rs = pstmt.executeQuery();

				list = new ArrayList<Board>();

				while (rs.next()) {
					list.add(new Board(rs.getInt("b_id"), rs.getDate("write_date"), rs.getDate("update_date"),
							rs.getString("title"), rs.getString("content"), rs.getInt("view_cnt"), rs.getInt("good"),
							rs.getInt("notgood"), rs.getString("writer"), rs.getString("status"), rs.getString("l_code"),
							rs.getInt("s_type"), rs.getInt("b_type"), rs.getInt("m_seq")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return list;
	}

}
