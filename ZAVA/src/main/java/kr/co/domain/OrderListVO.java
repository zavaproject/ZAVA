package kr.co.domain;

import java.io.Serializable;
import java.util.Date;

public class OrderListVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String oid;
	   private String pid;
	   private String mid;
	   private Date odate;
	   private int ostatus;
	   private int amount;
	   private String postcode;
	   private String address;
	   private String extraAddress;
	   private String detailAddress;
	   private String oname;
	   private String ophone;

	private int oDid;
	private int pcnt;

	private String pname;
	private int price;

	public OrderListVO() {
	}

	

	public OrderListVO(String oid, String pid, String mid, Date odate, int ostatus, int amount, String postcode,
			String address, String extraAddress, String detailAddress, String oname, String ophone, int oDid, int pcnt,
			String pname, int price) {
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



	public int getOstatus() {
		return ostatus;
	}



	public void setOstatus(int ostatus) {
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



	

}
