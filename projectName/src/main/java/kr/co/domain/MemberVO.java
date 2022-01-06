package kr.co.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class MemberVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private Date regdate;
	private Date updatedate;
	
	public MemberVO() {}
	
	public MemberVO(String userid, String userpw, String username, String email) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
	}

	public MemberVO(String userid, String userpw, String username, String email, Date regdate, Date updatedate) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.email = email;
		this.regdate = regdate;
		this.updatedate = updatedate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(userid, userpw);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		return Objects.equals(userid, other.userid) && Objects.equals(userpw, other.userpw);
	}

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", username=" + username + ", updatedate=" + updatedate + "]";
	}
	
	
	
	

}
