package kr.co.domain;

import java.io.Serializable;

public class OrderDetailVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int oDid;
	private String oid;
	private String pid;
	private int pcnt;
	
	public OrderDetailVO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetailVO(int oDid, String oid, String pid, int pcnt) {
		super();
		this.oDid = oDid;
		this.oid = oid;
		this.pid = pid;
		this.pcnt = pcnt;
	}

	public int getoDid() {
		return oDid;
	}

	public void setoDid(int oDid) {
		this.oDid = oDid;
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

	public int getPcnt() {
		return pcnt;
	}

	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
