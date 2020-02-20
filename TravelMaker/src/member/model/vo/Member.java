package member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

public class Member {
	private int m_seq;
	private String mId;
	private String pass;
	private String mName;
	private String phone;
	private String mNo;
	private String email;
	private Date joinDate;
	private Date accessDate;
	private String nickName;
	private String bIdArray;
	private int report;
	private String status;
	private String profile;

	public Member() {
	}
	
	
	
	public Date getAccessDate() {
		return accessDate;
	}



	public void setAccessDate(Date accessDate) {
		this.accessDate = accessDate;
	}


	public int getReport() {
		return report;
	}



	public void setReport(int report) {
		this.report = report;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	

	public String getProfile() {
		return profile;
	}



	public void setProfile(String profile) {
		this.profile = profile;
	}



	public Member(int m_seq, String mId, String pass, String mName, String phone, String mNo, String email,
			Date joinDate, Date accessDate, String nickName, String bIdArray, int report, String status,
			String profile) {
		super();
		this.m_seq = m_seq;
		this.mId = mId;
		this.pass = pass;
		this.mName = mName;
		this.phone = phone;
		this.mNo = mNo;
		this.email = email;
		this.joinDate = joinDate;
		this.accessDate = accessDate;
		this.nickName = nickName;
		this.bIdArray = bIdArray;
		this.report = report;
		this.status = status;
		this.profile = profile;
	}



	public Member(int m_seq, String mId, String pass, String mName, String phone, String mNo, String email,
			Date joinDate, Date accessDate, String nickName, String bIdArray, int report, String status) {
		super();
		this.m_seq = m_seq;
		this.mId = mId;
		this.pass = pass;
		this.mName = mName;
		this.phone = phone;
		this.mNo = mNo;
		this.email = email;
		this.joinDate = joinDate;
		this.accessDate = accessDate;
		this.nickName = nickName;
		this.bIdArray = bIdArray;
		this.report = report;
		this.status = status;
	}

	public Member(String nickName) {
		super();
		this.nickName = nickName;
	}

	public Member(String mId, String pass, String mName, String phone, String mNo, String email, String nickName) {
		super();
		this.mId = mId;
		this.pass = pass;
		this.mName = mName;
		this.phone = phone;
		this.mNo = mNo;
		this.email = email;
		this.nickName = nickName;
	}
	
	public Member(String mId, String pass, String nickName, String phone, String email) {
		super();
		this.mId = mId;
		this.pass = pass;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
	}

	public Member(String mId, String pass, String mName, String phone, String mNo, String email, Date joinDate,
			String nickName, String bIdArray) {
		super();
		this.mId = mId;
		this.pass = pass;
		this.mName = mName;
		this.phone = phone;
		this.mNo = mNo;
		this.email = email;
		this.joinDate = joinDate;
		this.nickName = nickName;
		this.bIdArray = bIdArray;
	}

	public int getM_seq() {
		return m_seq;
	}

	public Member(String mId, String phone, String email, String nickName) {
		super();
		this.mId = mId;
		this.phone = phone;
		this.email = email;
		this.nickName = nickName;
	}

	public Member(int m_seq, String mId, String pass, String mName, String phone, String mNo, String email,
			Date joinDate, String nickName, String bIdArray) {
		super();
		this.m_seq = m_seq;
		this.mId = mId;
		this.pass = pass;
		this.mName = mName;
		this.phone = phone;
		this.mNo = mNo;
		this.email = email;
		this.joinDate = joinDate;
		this.nickName = nickName;
		this.bIdArray = bIdArray;
	}

	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getbIdArray() {
		return bIdArray;
	}

	public void setbIdArray(String bIdArray) {
		this.bIdArray = bIdArray;
	}



	@Override
	public String toString() {
		return "Member [m_seq=" + m_seq + ", mId=" + mId + ", pass=" + pass + ", mName=" + mName + ", phone=" + phone
				+ ", mNo=" + mNo + ", email=" + email + ", joinDate=" + joinDate + ", accessDate=" + accessDate
				+ ", nickName=" + nickName + ", bIdArray=" + bIdArray + ", report=" + report + ", status=" + status
				+ "]";
	}
}
