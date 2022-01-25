package kr.co.domain;

import java.io.Serializable;
import java.util.Objects;

public class CartVO implements Serializable {

	private static final long serialVersionUID = 1L;

	// cart
	private String cid;
	private String pid;
	private String mid;
	private int pcnt;

	// product
	private String pname;
	private int price;
	private double pDiscount;

	// option
	private int ostock;
	private String ocolor;
	private String osize;
	private String ocode;

	// attach
	private String filename;

	private int salePrice;
	private int totalPrice;

	public CartVO() {
	}

	public CartVO(String cid, String pid, String mid, int pcnt, String pname, int price, double pDiscount,
			String ocolor, String osize, String ocode, String filename, int salePrice, int totalPrice) {
		super();
		this.cid = cid;
		this.pid = pid;
		this.mid = mid;
		this.pcnt = pcnt;
		this.pname = pname;
		this.price = price;
		this.pDiscount = pDiscount;
		this.ocolor = ocolor;
		this.osize = osize;
		this.ocode = ocode;
		this.filename = filename;
		this.salePrice = salePrice;
		this.totalPrice = totalPrice;
	}

	
	public int getOstock() {
		return ostock;
	}

	public void setOstock(int ostock) {
		this.ostock = ostock;
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

	public double getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(double pDiscount) {
		this.pDiscount = pDiscount;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getOcode() {
		return ocode;
	}

	public void setOcode(String ocode) {
		this.ocode = ocode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.price * (1 - this.pDiscount));
		this.totalPrice = this.salePrice * this.pcnt;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cid, mid, pid);
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
		return Objects.equals(cid, other.cid) && Objects.equals(mid, other.mid) && Objects.equals(pid, other.pid);
	}

	@Override
	public String toString() {
		return "CartVO [cid=" + cid + ", pid=" + pid + ", mid=" + mid + ", pcnt=" + pcnt + ", pname=" + pname
				+ ", price=" + price + ", pDiscount=" + pDiscount + ", ocolor=" + ocolor + ", osize=" + osize
				+ ", ocode=" + ocode + ", filename=" + filename + ", salePrice=" + salePrice + ", totalPrice="
				+ totalPrice + "]";
	}

}
