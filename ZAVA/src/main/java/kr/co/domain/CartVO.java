package kr.co.domain;

import java.io.Serializable;
import java.util.Objects;

public class CartVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String cid;
	private String pid;
	private String mid;
	private int pcnt;
	
	private String pname;
	private int price;
	private int money;
	
	public CartVO() {}

	public CartVO(String cid, String pid, String mid, int pcnt, String pname, int price, int money) {
		super();
		this.cid = cid;
		this.pid = pid;
		this.mid = mid;
		this.pcnt = pcnt;
		this.pname = pname;
		this.price = price;
		this.money = money;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cid, mid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartVO other = (CartVO) obj;
		return Objects.equals(cid, other.cid) && Objects.equals(mid, other.mid);
	}

	@Override
	public String toString() {
		return "CartVO [cid=" + cid + ", pid=" + pid + ", mid=" + mid + ", pcnt=" + pcnt + ", pname=" + pname
				+ ", price=" + price + ", money=" + money + "]";
	}
	
	

}
