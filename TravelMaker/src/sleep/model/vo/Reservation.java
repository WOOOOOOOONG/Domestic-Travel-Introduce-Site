package sleep.model.vo;

import java.util.Date;

public class Reservation {
	private int rsv_id; // 예약번호
	private String m_id; // 사람번호
	private Date checkin; // 체크인날짜
	private Date checkout; // 체크아웃날짜
	private int r_id; //방번호
	
	public Reservation() {}

	public Reservation(int rsv_id, String m_id, Date checkin, Date checkout, int r_id) {
		super();
		this.rsv_id = rsv_id;
		this.m_id = m_id;
		this.checkin = checkin;
		this.checkout = checkout;
		this.r_id = r_id;
	}
 
	public int getRsv_id() {
		return rsv_id;
	}

	public void setRsv_id(int rsv_id) {
		this.rsv_id = rsv_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

	@Override
	public String toString() {
		return "Reservation [rsv_id=" + rsv_id + ", m_id=" + m_id + ", checkin=" + checkin + ", checkout=" + checkout
				+ ", r_id=" + r_id + "]";
	}
	
	

}
