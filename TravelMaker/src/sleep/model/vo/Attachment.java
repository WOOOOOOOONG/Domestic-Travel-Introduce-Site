package sleep.model.vo;

import java.sql.Date;

public class Attachment {
	private int fId;		// 파일 아이디(시퀀스, pk)
	private int bId;		// 게시글 아이디(참조)
	private String originName;	// 사용자가 업로드한 파일명
	private String changeName;	// 변경 된 파일명
	private String filePath;	// 파일이 저장 된 경로
	private Date modifyDate; // 게시글 수정일
	private String status;		// 삭제여부
	private Date createDate; // 게시글 작성일
	private int fileLevel;		// 메인 사진 0, 일반 사진 1 

	
	public Attachment() {
		
	}

 
	public Attachment(int fId, int bId, String originName, String changeName, String filePath,
			int fileLevel, Date createDate, Date modifyDate, String status) {
		super();
		this.fId = fId;
		this.bId = bId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}


	public int getfId() {
		return fId;
	}


	public void setfId(int fId) {
		this.fId = fId;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Attachment [fId=" + fId + ", bId=" + bId + ", originName=" + originName + ", changeName=" + changeName
				+ ", filePath=" + filePath + ", fileLevel=" + fileLevel + ", createDate="
				+ createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
	
	
}
