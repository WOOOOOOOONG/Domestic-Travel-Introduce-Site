package board.model.vo;


public class Information {
	private int bId;
	private String sDay;
	private String eDay;
	private String tel;
	private int price;
	private String address;
	private String page;
	
	public Information() {
		
	}
 
	public Information(int bId, String sDay, String eDay, String tel, int price, String address, String page) {
		super();
		this.bId = bId;
		this.sDay = sDay;
		this.eDay = eDay;
		this.tel = tel;
		this.price = price;
		this.address = address;
		this.page = page;
	}
	
	

	public Information(String sDay, String eDay, String tel, int price, String address, String page) {
		super();
		this.sDay = sDay;
		this.eDay = eDay;
		this.tel = tel;
		this.price = price;
		this.address = address;
		this.page = page;
	}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getsDay() {
		return sDay;
	}

	public void setsDay(String sDay) {
		this.sDay = sDay;
	}

	public String geteDay() {
		return eDay;
	}

	public void seteDay(String eDay) {
		this.eDay = eDay;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "Information [bId=" + bId + ", sDay=" + sDay + ", eDay=" + eDay + ", tel=" + tel + ", price=" + price
				+ ", address=" + address + ", page=" + page + "]";
	}

	

	

	
}
