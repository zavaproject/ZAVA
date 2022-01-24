package kr.co.domain;

import java.io.Serializable;
import java.util.Objects;

public class OrderDetailVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private int oDid;
	private String oid;
	private String pid;
	private int pcnt;
	
	public OrderDetailVO() {}

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

	@Override
	public int hashCode() {
		return Objects.hash(oDid, oid, pcnt, pid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailVO other = (OrderDetailVO) obj;
		return oDid == other.oDid && Objects.equals(oid, other.oid) && pcnt == other.pcnt
				&& Objects.equals(pid, other.pid);
	}

	@Override
	public String toString() {
		return "OrderDetailVO [oDid=" + oDid + ", oid=" + oid + ", pid=" + pid + ", pcnt=" + pcnt + "]";
	}	
	
	
}
