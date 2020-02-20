package board.model.service;

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
import board.model.vo.Reply;

public class BoardService {

	// 1. 게시글 리스트 갯수 조회용 서비스 메소드
	public int getListCount(int flag) {
		Connection con = getConnection();
		int result = new BoardDao().getListCount(con, flag);

		close(con);

		return result;
	}

	// 3. 게시판 상세보기(조회수 증가)
	public Board selectBoard(int bid) {
		Connection con = getConnection();
		BoardDao bDao = new BoardDao();
		Board b = null;

		int result = bDao.increaseCount(con, bid);

		if (result > 0) {
			commit(con);
			b = bDao.selectBoard(con, bid);
		} else {
			rollback(con);
		}

		close(con);

		return b;
	}

	// 4. 게시판 상세보기(조회수 증가 없이)
	public Board selectBoardNoCnt(int bid) {
		Connection con = getConnection();
		Board b = new BoardDao().selectBoard(con, bid);
		close(con);
		return b;
	}

	// 5. 게시글 삭제 서비스
	public int deleteBoard(int bid) {
		Connection con = getConnection();
		int result = new BoardDao().deleteBoard(con, bid);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int deleteAttachment(int bid) {
		Connection con = getConnection();
		int result = new BoardDao().deleteAttachment(con, bid);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	// 6. 게시글 입력용 서비스
	public int insertBoard(Board b) {
		Connection con = getConnection();
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	// 7. 게시글 수정 서비스
	public int updateBoard(Board b, int flag) {

		Connection con = getConnection();
		int result = new BoardDao().updateBoard(con, b , flag);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	public int updateInformation(Information info, int flag) {
		Connection con = getConnection();
		int result = new BoardDao().updateInformation(con, info ,flag);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

	// 사진 게시판 리스트에 보여질 게시판 리스트 조회용 서비스
	// 전달 받은 flag 값이 1인 경우 게시판 정보 리스트가 리턴
	// 2인 경우 메인 사진 리스트가 리턴
	public ArrayList selectList(int flag, int currentPage, int boardLimit, int BF) {
		Connection con = getConnection();
		ArrayList list = null;

		BoardDao bDao = new BoardDao();

		if (BF == 1) {
			list = bDao.selectBList(con, currentPage, boardLimit, flag);
		} else {
			list = bDao.selectFList(con, currentPage, boardLimit, flag);
		}

		close(con);

		return list;
	}

	// 사진 게시판 글쓰기
	public int insertThumbnail(Board b, Information in, ArrayList<Attachment> fileList, int flag) {
		Connection conn = getConnection();

		BoardDao bDao = new BoardDao();

		int result1 = bDao.insertThBoard(conn, b,flag);
		int result2 = bDao.insertAttachment(conn, fileList);
		int result3 = bDao.insertInformation(conn, in);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1;
	}

	// 사진 게시판 상세보기
	public ArrayList<Attachment> selectThumbnail(int bId) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectThumbnail(con, bId);

		close(con);

		return list;

	}

	// 게시판 상세보기 정보가져오기
	public Information selectInformation(int bId) {
		Connection con = getConnection();
		Information in = new BoardDao().selectInformtion(con, bId);

		close(con);
		return in;
	}

	public ArrayList<Reply> selectReplyList(int bId) {
		Connection con = getConnection();
		ArrayList<Reply> rlist = new BoardDao().selectReplyList(con, bId);

		close(con);

		return rlist;

	}

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();

		BoardDao bDao = new BoardDao();

		int result = bDao.insertReply(conn, r);

		ArrayList<Reply> rlist = null;

		if (result > 0) {
			commit(conn);
			rlist = bDao.selectReplyList(conn, r.getRefbId());
		} else {
			rollback(conn);
		}

		close(conn);

		return rlist;
	}

	public ArrayList<Board> selectSearchList(String search, int currentPage, int boardLimit, int flag) {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectSearchList(con, search, currentPage, boardLimit,flag);

		close(con);
		return list;
	}

	public ArrayList<Attachment> selectSearchAttachment(String search, int currentPage, int boardLimit, int flag) {
		Connection con = getConnection();
		ArrayList<Attachment> list = new BoardDao().selectSearchAttachment(con, search, currentPage, boardLimit,flag);

		close(con);
		return list;
	}

	// 지역별 조회
	public ArrayList<Board> selectLocationList(int lId, int currentPage, int boardLimit, int flag) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectLocationList(con, lId, currentPage, boardLimit,flag);

		close(con);

		return list;
	}

	public ArrayList<Attachment> selectLocationAttachment(int lId, int currentPage, int boardLimit, int flag) {
		Connection con = getConnection();

		ArrayList<Attachment> list = new BoardDao().selectLocationAttachment(con, lId, currentPage, boardLimit,flag);

		close(con);

		return list;
	}

	public ArrayList<Board> selectMonthList(int month, int currentPage, int boardLimit) {
		Connection con = getConnection();

		ArrayList<Board> list = new BoardDao().selectMonthList(con, month, currentPage, boardLimit);

		close(con);

		return list;
	}

	public ArrayList<Attachment> selectMonthAttachment(int month, int currentPage, int boardLimit) {
		Connection con = getConnection();

		ArrayList<Attachment> list = new BoardDao().selectMonthAttachment(con, month, currentPage, boardLimit);

		close(con);

		return list;
	}

	public ArrayList<Information> InformationAll() {
		Connection con = getConnection();
		ArrayList<Information> in = new BoardDao().InformationAll(con);

		close(con);
		return in;
	}
	
	
	public int updateCBoard(Board b) {
	      Connection con = getConnection();
	      int result = new BoardDao().updateCBoard(con, b);
	      
	      if(result > 0) {
	         commit(con);
	      }else {
	         rollback(con);
	      }
	      return result;
	   }

	public int deleteReply(int rId) {
		Connection con = getConnection();
	      int result = new BoardDao().deleteReply(con, rId);
	      
	      if(result > 0) {
	         commit(con);
	      }else {
	         rollback(con);
	      }
	      return result;
	}

	public ArrayList<Board> selectAllList(int flag, int currentPage, int boardLimit) {
		Connection con = getConnection();
		ArrayList list = null;
		
		list = new BoardDao().selectAllList(con, currentPage, boardLimit, flag);
		

		close(con);

		return list;
	}
	

}
