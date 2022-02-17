package kr.co.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class OrderVO implements Serializable {

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
	
	public OrderVO() {}

	public OrderVO(String oid, String pid, String mid, Date odate, String ostatus, int amount, String postcode,
			String address, String extraAddress, String detailAddress, String oname, String ophone) {
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
