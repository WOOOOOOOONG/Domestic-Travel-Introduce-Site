package board.model.vo;

import java.sql.Date;

public class Board {
	private int bId;	// 게시글 고유 번호
	private Date wDate;
	private Date uDate;
	private String bTitle;	// 게시글 제목
	private String bContent; // 게시글 내용
	private int bCount; 	// 게시글 조회수
	private int good;
	private int ngood;
	private String bWriter; // 게시글 작성자 이름
	private String status; 	// 게시글 상태(Y, N)
	private String lCode;
	private int sType;  // 숙박 타입(1.호텔  2. 모텔  3. 펜션)
	private int bType;  // 게시글 타입(1. 여행 게시판, 2. 축제 게시판  3. 숙박게시판  4.커뮤니티)
	private int mId;
	
	public Board() {}

	public Board(int bId, Date wDate, Date uDate, String bTitle, String bContent, int bCount, int good, int ngood,
			String bWriter, String status, String lCode, int sType, int bType, int mId) {
		super();
		this.bId = bId;
		this.wDate = wDate;
		this.uDate = uDate;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.good = good;
		this.ngood = ngood;
		this.bWriter = bWriter;
		this.status = status;
		this.lCode = lCode;
		this.sType = sType;
		this.bType = bType;
		this.mId = mId;
	}
	
	
	public Board(int bId, Date wDate, Date uDate, String bTitle, String bContent, int bCount, String bWriter,
			String status, int bType) {
		super();
		this.bId = bId;
		this.wDate = wDate;
		this.uDate = uDate;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bWriter = bWriter;
		this.status = status;
		this.bType = bType;
	}
	

	public Board(int bId, Date wDate, Date uDate, String bTitle, String bContent, int bCount, String bWriter,
			String status, String lCode, int bType,int mId) {
		this.bId = bId;
		this.wDate = wDate;
		this.uDate = uDate;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bWriter = bWriter;
		this.status = status;
		this.lCode = lCode;
		this.bType = bType;
		this.mId = mId;
	}
	
	public Board(String bTitle, String bContent, String bWriter, int mId) {
	      super();
	      this.bTitle = bTitle;
	      this.bContent = bContent;
	      this.bWriter = bWriter;
	      this.mId = mId;
	   }



	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public Date getwDate() {
		return wDate;
	}

	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}

	public Date getuDate() {
		return uDate;
	}

	public void setuDate(Date uDate) {
		this.uDate = uDate;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getNgood() {
		return ngood;
	}

	public void setNgood(int ngood) {
		this.ngood = ngood;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getlCode() {
		return lCode;
	}

	public void setlCode(String lCode) {
		this.lCode = lCode;
	}

	public int getsType() {
		return sType;
	}

	public void setsType(int sType) {
		this.sType = sType;
	}

	public int getbType() {
		return bType;
	}

	public void setbType(int bType) {
		this.bType = bType;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", wDate=" + wDate + ", uDate=" + uDate + ", bTitle=" + bTitle + ", bContent="
				+ bContent + ", bCount=" + bCount + ", good=" + good + ", ngood=" + ngood + ", bWriter=" + bWriter
				+ ", status=" + status + ", lCode=" + lCode + ", sType=" + sType + ", bType=" + bType + ", mId=" + mId
				+ "]";
	}

	
	
	
	

}



