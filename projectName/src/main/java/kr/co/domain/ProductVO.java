package kr.co.domain;

import java.io.Serializable;

public class ProductVO implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private String pid;
private String pname;
private String descript;
private int category;
private int price;
private String regdate;
private int readcnt;
private String mid;
private String[] insertfiles;
private String[] deletefiles;
private String filename;

public ProductVO() {}

public ProductVO(String pid, String pname, String descript, int category, int price, String regdate,
		int readcnt, String mid) {
	super();
	this.pid = pid;
	this.pname = pname;
	this.descript = descript;
	this.category = category;
	this.price = price;
	this.regdate = regdate;
	this.readcnt = readcnt;
	this.mid = mid;
}



public ProductVO(String pid, String pname, String descript, int category, int price, String regdate, int readcnt,
		String mid, String[] insertfiles, String[] deletefiles) {
	super();
	this.pid = pid;
	this.pname = pname;
	this.descript = descript;
	this.category = category;
	this.price = price;
	this.regdate = regdate;
	this.readcnt = readcnt;
	this.mid = mid;
	this.insertfiles = insertfiles;
	this.deletefiles = deletefiles;
}

public String getFilename() {
	return filename;
}

public void setFilename(String filename) {
	this.filename = filename;
}

public String[] getInsertfiles() {
	return insertfiles;
}

public void setInsertfiles(String[] insertfiles) {
	this.insertfiles = insertfiles;
}

public String[] getDeletefiles() {
	return deletefiles;
}

public void setDeletefiles(String[] deletefiles) {
	this.deletefiles = deletefiles;
}

public String getPid() {
	return pid;
}

public void setPid(String pid) {
	this.pid = pid;
}

public String getPname() {
	return pname;
}

public void setPname(String pname) {
	this.pname = pname;
}

public String getDescript() {
	return descript;
}

public void setDescript(String descript) {
	this.descript = descript;
}

public int getCategory() {
	return category;
}

public void setCategory(int category) {
	this.category = category;
}

public int getPrice() {
	return price;
}

public void setPrice(int price) {
	this.price = price;
}


public String getRegdate() {
	return regdate;
}

public void setRegdate(String regdate) {
	this.regdate = regdate;
}

public int getReadcnt() {
	return readcnt;
}

public void setReadcnt(int readcnt) {
	this.readcnt = readcnt;
}

public String getMid() {
	return mid;
}

public void setMid(String mid) {
	this.mid = mid;
}


}
