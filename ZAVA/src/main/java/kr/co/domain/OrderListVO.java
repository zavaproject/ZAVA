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
	private String address1;
	private String address2;
	private String address3;
	private String oname;
	private String ophone;

	private int oDid;
	private int pcnt;

	private String pname;
	private int price;

	public OrderListVO() {
	}

	public OrderListVO(String oid, String pid, String mid, Date odate, int ostatus, int amount, String address1,
			String address2, String address3, String oname, String ophone, int oDid, int pcnt, String pname,
			int price) {
		super();
		this.oid = oid;
		this.pid = pid;
		this.mid = mid;
		this.odate = odate;
		this.ostatus = ostatus;
		this.amount = amount;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.oname = oname;
		this.ophone = ophone;
		this.oDid = oDid;
		this.pcnt = pcnt;
		this.pname = pname;
		this.price = price;
	}

	public OrderListVO(String oid, String mid, Date odate, int ostatus, int amount, String address1, String address2,
			String address3, String oname, String ophone, int oDid, int pcnt, String pname, int price) {
		super();
		this.oid = oid;
		this.mid = mid;
		this.odate = odate;
		this.ostatus = ostatus;
		this.amount = amount;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
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

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
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
