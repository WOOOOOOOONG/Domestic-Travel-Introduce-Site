package sleep.model.vo;

public class Room {
	private int rId; // 방번호 seq로 번호
	private int price; // 방 가격
	private String rName; // 방 이름
	private String rContent; // 방 설명
	private int sId;
	private int sType;
	
	public Room() {}
 
	public Room(int rId, int price, String rName, String rContent, int sId, int sType) {
		super();
		this.rId = rId;
		this.price = price;
		this.rName = rName;
		this.rContent = rContent;
		this.sId = sId;
		this.sType = sType;
	}
	
	
 
	public Room(int price, String rContent) {
		super();
		this.price = price;
		this.rContent = rContent;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public int getsType() {
		return sType;
	}

	public void setsType(int sType) {
		this.sType = sType;
	}

	@Override
	public String toString() {
		return "Room [rId=" + rId + ", price=" + price + ", rName=" + rName + ", rContent=" + rContent + ", sId=" + sId
				+ ", sType=" + sType + "]";
	}

	

	
	
	
	
}
