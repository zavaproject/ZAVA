package kr.co.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class OrderListVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String oid;
	private String pid;
	private String mid;
	private Date odate;
	private String ostatus;
	private int amount;
	private String postcode;
	private String address;
	private String extraAddress;
	private String detailAddress;
	private String oname;
	private String ophone;

	private int oDid;
	private int pcnt;
	
	// option
	private int ostock;
	private String ocolor;
	private String osize;
	private String ocode;
	
	// attach
	private String filename; 

	private String pname;
	private int price;
	
	public OrderListVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderListVO(String oid, String pid, String mid, Date odate, String ostatus, int amount, String postcode,
			String address, String extraAddress, String detailAddress, String oname, String ophone, int oDid, int pcnt,
			int ostock, String ocolor, String osize, String ocode, String filename, String pname, int price) {
		super();
		this.oid = oid;
		this.pid = pid;
		this.mid = mid;
		this.odate = odate;
		this.ostatus = ostatus;
		this.amount = amount;
		this.postcode = postcode;
		this.address = address;
		this.extraAddress = extraAddress;
		this.detailAddress = detailAddress;
		this.oname = oname;
		this.ophone = ophone;
		this.oDid = oDid;
		this.pcnt = pcnt;
		this.ostock = ostock;
		this.ocolor = ocolor;
		this.osize = osize;
		this.ocode = ocode;
		this.filename = filename;
		this.pname = pname;
		this.price = price;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public String getOstatus() {
		return ostatus;
	}

	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public int getoDid() {
		return oDid;
	}

	public void setoDid(int oDid) {
		this.oDid = oDid;
	}

	public int getPcnt() {
		return pcnt;
	}

	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}

	public int getOstock() {
		return ostock;
	}

	public void setOstock(int ostock) {
		this.ostock = ostock;
	}

	public String getOcolor() {
		return ocolor;
	}

	public void setOcolor(String ocolor) {
		this.ocolor = ocolor;
	}

	public String getOsize() {
		return osize;
	}

	public void setOsize(String osize) {
		this.osize = osize;
	}

	public String getOcode() {
		return ocode;
	}

	public void setOcode(String ocode) {
		this.ocode = ocode;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(address, amount, detailAddress, extraAddress, filename, mid, oDid, ocode, ocolor, odate,
				oid, oname, ophone, osize, ostatus, ostock, pcnt, pid, pname, postcode, price);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderListVO other = (OrderListVO) obj;
		return Objects.equals(address, other.address) && amount == other.amount
				&& Objects.equals(detailAddress, other.detailAddress)
				&& Objects.equals(extraAddress, other.extraAddress) && Objects.equals(filename, other.filename)
				&& Objects.equals(mid, other.mid) && oDid == other.oDid && Objects.equals(ocode, other.ocode)
				&& Objects.equals(ocolor, other.ocolor) && Objects.equals(odate, other.odate)
				&& Objects.equals(oid, other.oid) && Objects.equals(oname, other.oname)
				&& Objects.equals(ophone, other.ophone) && Objects.equals(osize, other.osize)
				&& Objects.equals(ostatus, other.ostatus) && ostock == other.ostock && pcnt == other.pcnt
				&& Objects.equals(pid, other.pid) && Objects.equals(pname, other.pname)
				&& Objects.equals(postcode, other.postcode) && price == other.price;
	}

	@Override
	public String toString() {
		return "OrderListVO [oid=" + oid + ", pid=" + pid + ", mid=" + mid + ", odate=" + odate + ", ostatus=" + ostatus
				+ ", amount=" + amount + ", postcode=" + postcode + ", address=" + address + ", extraAddress="
				+ extraAddress + ", detailAddress=" + detailAddress + ", oname=" + oname + ", ophone=" + ophone
				+ ", oDid=" + oDid + ", pcnt=" + pcnt + ", ostock=" + ostock + ", ocolor=" + ocolor + ", osize=" + osize
				+ ", ocode=" + ocode + ", filename=" + filename + ", pname=" + pname + ", price=" + price + "]";
	}

}
