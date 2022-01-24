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

	private int ostock;

	private String pname;
	private int price;

	public OrderListVO() {
	}

	public OrderListVO(String oid, String pid, String mid, Date odate, String ostatus, int amount, String postcode,
			String address, String extraAddress, String detailAddress, String oname, String ophone, int oDid, int pcnt,
			int ostock, String pname, int price) {
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
		return Objects.hash(address, amount, detailAddress, extraAddress, mid, oDid, odate, oid, oname, ophone, ostatus,
				ostock, pcnt, pid, pname, postcode, price);
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
				&& Objects.equals(extraAddress, other.extraAddress) && Objects.equals(mid, other.mid)
				&& oDid == other.oDid && Objects.equals(odate, other.odate) && Objects.equals(oid, other.oid)
				&& Objects.equals(oname, other.oname) && Objects.equals(ophone, other.ophone)
				&& Objects.equals(ostatus, other.ostatus) && ostock == other.ostock && pcnt == other.pcnt
				&& Objects.equals(pid, other.pid) && Objects.equals(pname, other.pname)
				&& Objects.equals(postcode, other.postcode) && price == other.price;
	}

	@Override
	public String toString() {
		return "OrderListVO [oid=" + oid + ", pid=" + pid + ", mid=" + mid + ", odate=" + odate + ", ostatus=" + ostatus
				+ ", amount=" + amount + ", postcode=" + postcode + ", address=" + address + ", extraAddress="
				+ extraAddress + ", detailAddress=" + detailAddress + ", oname=" + oname + ", ophone=" + ophone
				+ ", oDid=" + oDid + ", pcnt=" + pcnt + ", ostock=" + ostock + ", pname=" + pname + ", price=" + price
				+ "]";
	}

}
