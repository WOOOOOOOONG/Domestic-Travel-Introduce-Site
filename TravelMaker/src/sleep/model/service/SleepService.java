package sleep.model.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;

import static common.JDBCTemplate.*;

import sleep.model.dao.SleepDao;
import sleep.model.vo.Attachment;
import sleep.model.vo.Room;
import sleep.model.vo.Sleep;

public class SleepService {
	
	// 전체리스트
	public ArrayList selectList(int flag,int currentPage, int boardLimit){
		Connection conn=getConnection();
		ArrayList list = null;
		
		SleepDao sDao = new SleepDao();
		if(flag == 1) {
			list = sDao.selectSList(conn,currentPage,boardLimit);
		}else {
			list = sDao.selectFList(conn,currentPage,boardLimit);
		}
		
		close(conn);
		
		return list;
		
	}
	
	// 타입별 방보여주기
	public ArrayList<Room> selectrList(int sId){
		Connection conn = getConnection();
		ArrayList<Room> rlist = new SleepDao().selectrList(conn,sId);

		close(conn);
		return rlist;
		
	}
	
	
	
	
	// 숙박 상세
	public Sleep detailSleep(int sId) {
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		Sleep s = null;
		
		int result = sdao.increaseCount(conn,sId);
		
		if (result > 0) {
			commit(conn);
			s = sdao.detailSleep(conn, sId);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return s;
	}
	
	
	// insert하는 부분
	public int insertSleep(Sleep s, ArrayList<Attachment> fileList){
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		
		int result1 = 0;
		try {
			result1 = sdao.insertSleep(conn,s);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int result2 = sdao.insertAttachment(conn,fileList);
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
		
	}
	
	// 수정부분
	/*public int updateSleep(int sId , Sleep s) {
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		int result = 0;
		result = sdao.updateSleep(conn, sId, s);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}*/
	
	
	// 삭제
	public int deleteSleep(int sid) {
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		int result =0;
		result = sdao.deleteSleep(conn,sid);
		 
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 예약하기
	public int reservation(String mId, int sId ) {
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		Sleep s = null;
		
		int result = sdao.increaseCount(conn,sId);
		
		if (result > 0) {
			commit(conn);
			s = sdao.reservation(conn, sId);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	// 1. 게시글 리스트 갯수 조회용 서비스 메소드
		public int getListCount() {
			Connection con = getConnection();
			int result = new SleepDao().getListCount(con);
			
			close(con);

			return result;
		}

		public Sleep selectSleepNoCnt(int sId) {
			Connection con = getConnection();
			Sleep s = new SleepDao().selectSleep(con, sId);
			close(con);
			return s;
		}

		public ArrayList<Attachment> selectThumbnail(int sId) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new SleepDao().selectThumbnail(conn, sId);

		close(conn);

		return list;
		}
		
		public Sleep reservation(int sId) {
			Connection conn = getConnection();
			SleepDao sdao = new SleepDao();
			Sleep s = null;
			
			int result = sdao.increaseCount(conn,sId);
			
			if (result > 0) {
				commit(conn);
				s = sdao.reservation(conn, sId);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return s;
		}

		public int insertRoom(ArrayList<Room> R, int sId) {
			Connection conn = getConnection();
			
			int result = new SleepDao().insertRoom(conn, R, sId);
			
			if(result > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			return result;
		}

		public int selectsId() {
			Connection conn = getConnection();
			
			int sId = new SleepDao().selectsId(conn);
			
			if(sId > 0 ) {
				commit(conn);
			}else {
				rollback(conn);
			}
			return sId;
		}

		public Room selectreservationNoCnt(int rId, int sId) {
			Connection con = getConnection();
			Room r = new SleepDao().selectreservation(con, rId,sId);
			close(con);
			return r;
		}

		public int deleteAttachment(int sid) {
		Connection conn = getConnection();
		SleepDao sdao = new SleepDao();
		int result =0;
		result = sdao.deleteAttachment(conn,sid);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		}

		public int deleteroom(int sid) {
			Connection conn = getConnection();
			SleepDao sdao = new SleepDao();
			int result =0;
			result = sdao.deleteRoom(conn,sid);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close(conn);
			
			return result;
		}

		public ArrayList<Sleep> selectSearchList(String search, int currentPage, int boardLimit) {
			Connection con = getConnection();
			ArrayList<Sleep> list = new SleepDao().selectSearchList(con, search, currentPage, boardLimit);

			close(con);
			return list;
		}

	
		public int getListCount(int flag) {Connection con = getConnection();
		int result = new SleepDao().getListCount(con, flag);

		close(con);

		return result;
		}

		public ArrayList<Attachment> selectSearchAttachment(String search, int currentPage, int boardLimit) {
			Connection con = getConnection();
			ArrayList<Attachment> list = new SleepDao().selectSearchAttachment(con, search, currentPage, boardLimit);

			close(con);
			return list;
		}

		

		public ArrayList<Sleep> selectLocationList(int stype, int currentPage, int boardLimit) {
			Connection con = getConnection();

			ArrayList<Sleep> list = new SleepDao().selectLocationList(con, stype, currentPage, boardLimit);

			close(con);

			return list;
		}

		public ArrayList<Attachment> selectLocationAttachment(int stype, int currentPage, int boardLimit) {
			Connection con = getConnection();

			ArrayList<Attachment> list = new SleepDao().selectLocationAttachment(con, stype, currentPage, boardLimit);

			close(con);

			return list;
		}

		public ArrayList<Sleep> sleepLocation(int lId, int currentPage, int boardLimit) {
			Connection con = getConnection();

			ArrayList<Sleep> list = new SleepDao().sleepLocation(con, lId, currentPage, boardLimit);

			close(con);

			return list;
		}

		public ArrayList<Attachment> sleepAttachmentLocation(int lId, int currentPage, int boardLimit) {
			Connection con = getConnection();
 
			ArrayList<Attachment> list = new SleepDao().sleepAttachmentLocation(con, lId, currentPage, boardLimit);

			close(con);

			return list;
		}



	
	

}
