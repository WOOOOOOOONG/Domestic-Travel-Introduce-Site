package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static common.JDBCTemplate.*;

import member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void updateDate(Connection conn, String id) {
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateDate");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	}
	
	// 1.로그인
	public Member loginMember(Connection conn, String id, String pwd) {
		Member loginUser = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				loginUser = new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getDate(8), rset.getDate(9), rset.getString(10),
						rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	// 2. �쉶�썝 媛��엯�슜 dao
	public int insertMember(Connection conn, Member m) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getmName());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getmNo());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getNickName());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 3. �븘�씠�뵒 以묐났 �솗�씤�슜 dao
	public int idCheck(Connection conn, String mId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idCheck");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 4. �쉶�썝 �닔�젙�슜 dao
	public int updateMember(Connection conn, Member m, String updateId) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getmId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getNickName());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, updateId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 5. �쉶�썝 議고쉶�슜 dao
	public Member selectMember(Connection conn, String updateId) {
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updateId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				mem = new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getDate(8), rset.getDate(9), 
						rset.getString(10), rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}

	// 6. 鍮꾨�踰덊샇 蹂�寃쎌슜 dao
	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 7. �쉶�썝 �깉�눜�슜 dao
	public int deleteMember(Connection conn, String mId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int nicknameCheck(Connection conn, String nick) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("nicknameCheck");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectAllMember(Connection conn) {
	      ArrayList<Member> mList = new ArrayList<>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("selectAllMember");

	      try {
	         pstmt = conn.prepareStatement(sql);


	         rset = pstmt.executeQuery();
	         
	         while (rset.next()) {
	            mList.add(new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getDate(8), rset.getDate(9), 
						rset.getString(10), rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14)));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      return mList;
	   }
	
	public int insertProfile(Connection conn, int userSeq, String profile) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertProfile");

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, profile);
			pstmt.setInt(2, userSeq);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public String findMemberId(Connection conn, String findName, String findNo) {
		String memberId = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findMemberId");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, findName);
			pstmt.setString(2, findNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				memberId = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberId;
	}

	public String findMemberPwd(Connection conn, String findId, String findName, String findNo) {
		String memberPass = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findMemberPwd");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, findId);
			pstmt.setString(2, findName);
			pstmt.setString(3, findNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				memberPass = rset.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memberPass;
	}
	
	public int report(Connection conn, int mSeq) {

        PreparedStatement pstmt = null;
        int result = 0;
        String sql = prop.getProperty("report");
        try {
           pstmt = conn.prepareStatement(sql);

           pstmt.setInt(1, mSeq);
           

           result = pstmt.executeUpdate();
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        } finally {
           close(pstmt);
        }
        return result;
     }

  public Member reportNo(Connection conn, int mSeq) {
     PreparedStatement pstmt = null;
     ResultSet rset = null;
     String sql = prop.getProperty("reportNo");
     Member report = new Member();
     try {
        pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, mSeq);


        rset = pstmt.executeQuery();
        if (rset.next()) {
           report = new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
                 rset.getString(5), rset.getString(6), rset.getString(7), rset.getDate(8), rset.getDate(9), 
                 rset.getString(10), rset.getString(11), rset.getInt(12), rset.getString(13), rset.getString(14));
        }
     } catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
     } finally {
        close(rset);
        close(pstmt);
     }
     return report;
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
