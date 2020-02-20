package member.model.vo;

import java.util.Date;

public class MyPlan {
	private int pSeq;
	private int mSeq;
	private String pName;
	private Date startDate;
	private Date endDate;
	private String startTime;
	private String endTime;
	private String fileName;
	private String url;

	public MyPlan() {
	}
	
	

	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public MyPlan(int pSeq, int mSeq, String pName, Date startDate, Date endDate, String startTime, String endTime,
			String fileName, String url) {
		super();
		this.pSeq = pSeq;
		this.mSeq = mSeq;
		this.pName = pName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.fileName = fileName;
		this.url = url;
	}



	public MyPlan(int pSeq, int mSeq, String pName, Date startDate, Date endDate, String startTime, String endTime,
			String fileName) {
		super();
		this.pSeq = pSeq;
		this.mSeq = mSeq;
		this.pName = pName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.fileName = fileName;
	}

	public MyPlan(int mSeq, String pName, Date startDate, Date endDate, String startTime, String endTime,
			String fileName) {
		super();
		this.mSeq = mSeq;
		this.pName = pName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.fileName = fileName;
	}

	public int getpSeq() {
		return pSeq;
	}

	public void setpSeq(int pSeq) {
		this.pSeq = pSeq;
	}

	public int getmSeq() {
		return mSeq;
	}

	public void setmSeq(int mSeq) {
		this.mSeq = mSeq;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getFileName() {
		return fileName;
	}
	
	public boolean isFileBoard() {
		if(fileName != null) {
			if(fileName.length() > 4) {
				if(fileName.substring(0, 4).equals("2019")) {
					return true;
				}
			}
		}
		
		return false;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	@Override
	public String toString() {
		return "MyPlan [pSeq=" + pSeq + ", mSeq=" + mSeq + ", pName=" + pName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", startTime=" + startTime + ", endTime=" + endTime + ", fileName="
				+ fileName + ", url=" + url + "]";
	}

	
}
