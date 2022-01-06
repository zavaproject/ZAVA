package kr.co.domain;

import java.io.Serializable;
import java.util.Objects;

public class ReplyVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int rno;
	private int bno; 
	private String replyer; 
	private String reply; 
	private String regdate;
	private String updatedate;
	
	public ReplyVO() {}

	public ReplyVO(int bno, String replyer, String reply) {
		this.bno = bno;
		this.replyer = replyer;
		this.reply = reply;
	}

	public ReplyVO(int rno, int bno, String replyer, String reply, String regdate, String updatedate) {
		this.rno = rno;
		this.bno = bno;
		this.replyer = replyer;
		this.reply = reply;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}



	public int getRno() {
		return rno;
	}



	public void setRno(int rno) {
		this.rno = rno;
	}



	public int getBno() {
		return bno;
	}



	public void setBno(int bno) {
		this.bno = bno;
	}



	public String getReplyer() {
		return replyer;
	}



	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}



	public String getReply() {
		return reply;
	}



	public void setReply(String reply) {
		this.reply = reply;
	}



	public String getRegdate() {
		return regdate;
	}



	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	public String getUpdatedate() {
		return updatedate;
	}



	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replyer=" + replyer + ", updatedate=" + updatedate + "]";
	}



	@Override
	public int hashCode() {
		return Objects.hash(bno, rno);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVO other = (ReplyVO) obj;
		return bno == other.bno && rno == other.rno;
	}
	
	
	

}
