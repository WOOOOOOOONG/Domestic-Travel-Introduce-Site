package board.model.vo;

import java.util.Date;

public class Reply implements java.io.Serializable{
	private static final long serialVersionUID = -7801635027847112446L;
	private int rId;
	private String rContent;
	private int refbId;
	private String rWriter;
	private Date createDate;
	private String status;
	
	public Reply() {}
	
	
	public Reply(int rId, String rContent, int refbId, String rWriter, Date createDate, String status) {
		super();
		this.rId = rId;
		this.rContent = rContent;
		this.refbId = refbId;
		this.rWriter = rWriter;
		this.createDate = createDate;
		this.status = status;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getRefbId() {
		return refbId;
	}
	public void setRefbId(int refbId) {
		this.refbId = refbId;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Reply [rId=" + rId + ", rContent=" + rContent + ", refbId=" + refbId + ", rWriter=" + rWriter
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	/*R_ID	NUMBER
	R_CONTENT	VARCHAR2(300 BYTE)
	WRITE_DATE	DATE
	GOOD	NUMBER
	NOTGOOD	NUMBER
	VIEW_CNT	NUMBER
	B_ID	NUMBER
	M_SEQ	NUMBER
	
	RID	NUMBER
	RCONTENT	VARCHAR2(400 BYTE)
	REF_BID	NUMBER
	RWRITER	NUMBER
	CREATE_DATE	DATE
	MODIFY_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)*/

	

}
