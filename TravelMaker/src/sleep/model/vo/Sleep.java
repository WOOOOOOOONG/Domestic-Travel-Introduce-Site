package sleep.model.vo;

public class Sleep {
	private int sId; // 숙박업체no seq로 번호주기
	private String sType; // 숙박업체 타입(1.호텔 2.모텔 3.펜션)
	private String sName; // 숙박업체명
	private String sContent; // 숙박업체 설명
	private String lCode; // 지역코드
	private int price;
	private int mId; 
	private String sWriter;
	private int sCount;
	private String status;
	private String address;
	private String enName;
	
	
	
	public  Sleep() {}


	

	 

	public Sleep(int sId, String sType, String sName, String sContent, String lCode, int price, int mId, String sWriter,
			int sCount, String status, String address, String enName) {
		super();
		this.sId = sId;
		this.sType = sType;
		this.sName = sName;
		this.sContent = sContent;
		this.lCode = lCode;
		this.price = price;
		this.mId = mId;
		this.sWriter = sWriter;
		this.sCount = sCount;
		this.status = status;
		this.address = address;
		this.enName = enName;
	}






	


	public int getsId() {
		return sId;
	}






	public void setsId(int sId) {
		this.sId = sId;
	}






	public String getsType() {
		return sType;
	}






	public void setsType(String sType) {
		this.sType = sType;
	}






	public String getsName() {
		return sName;
	}






	public void setsName(String sName) {
		this.sName = sName;
	}






	public String getsContent() {
		return sContent;
	}






	public void setsContent(String sContent) {
		this.sContent = sContent;
	}






	public String getlCode() {
		return lCode;
	}






	public void setlCode(String lCode) {
		this.lCode = lCode;
	}






	public int getPrice() {
		return price;
	}






	public void setPrice(int price) {
		this.price = price;
	}






	public int getmId() {
		return mId;
	}






	public void setmId(int mId) {
		this.mId = mId;
	}






	public String getsWriter() {
		return sWriter;
	}






	public void setsWriter(String sWriter) {
		this.sWriter = sWriter;
	}






	public int getsCount() {
		return sCount;
	}






	public void setsCount(int sCount) {
		this.sCount = sCount;
	}






	public String getStatus() {
		return status;
	}






	public void setStatus(String status) {
		this.status = status;
	}






	public String getAddress() {
		return address;
	}






	public void setAddress(String address) {
		this.address = address;
	}






	public String getEnName() {
		return enName;
	}






	public void setEnName(String enName) {
		this.enName = enName;
	}






	@Override
	public String toString() {
		return "Sleep [sId=" + sId + ", sType=" + sType + ", sName=" + sName + ", sContent=" + sContent + ", lCode="
				+ lCode + ", price=" + price + ", mId=" + mId + ", sWriter=" + sWriter + ", sCount=" + sCount
				+ ", status=" + status + ", address=" + address + ", enName=" + enName + "]";
	}








	
	
	


	
	
	

}
