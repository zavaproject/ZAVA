package kr.co.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

public class OrderVO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String oid;
	private String pid;
	private Date odate;
	private int ostatus;
	private int payment;
	private String address;
	private String oname;
	private String ophone;
	
	public OrderVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderVO(String oid, String pid, Date odate, int ostatus, int payment, String address, String oname,
			String ophone) {
		super();
		this.oid = oid;
		this.pid = pid;
		this.odate = odate;
		this.ostatus = ostatus;
		this.payment = payment;
		this.address = address;
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

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public int hashCode() {
		return Objects.hash(oid, oname, pid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderVO other = (OrderVO) obj;
		return Objects.equals(oid, other.oid) && Objects.equals(oname, other.oname) && Objects.equals(pid, other.pid);
	}

	@Override
	public String toString() {
		return "OrderVO [pid=" + pid + ", address=" + address + ", oname=" + oname + ", ophone=" + ophone + "]";
	}
	
	
}
