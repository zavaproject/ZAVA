package kr.co.domain;

public class OptionVO {
private String ocode;
private String pid;
private int ostock;
private String ocolor;
private String osize;

public OptionVO() {
	// TODO Auto-generated constructor stub
}



@Override
public String toString() {
	return "OpVO [ocode=" + ocode + ", pid=" + pid + ", ostock=" + ostock + ", ocolor=" + ocolor + ", osize=" + osize
			+ "]";
}



public OptionVO(String ocode, String pid, int ostock, String ocolor, String osize) {
	super();
	this.ocode = ocode;
	this.pid = pid;
	this.ostock = ostock;
	this.ocolor = ocolor;
	this.osize = osize;
}



public String getOcode() {
	return ocode;
}

public void setOcode(String ocode) {
	this.ocode = ocode;
}

public String getPid() {
	return pid;
}

public void setPid(String pid) {
	this.pid = pid;
}

public int getOstock() {
	return ostock;
}

public void setOstock(int ostock) {
	this.ostock = ostock;
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



}
