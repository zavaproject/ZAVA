package kr.co.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class MemberVO implements Serializable {

	private static final long serialVersionUID = 1L;
	private String mid;
	private String mpw;
	private String mname;
	private String mgender;
	private String mphonenumber;
	private String memail;
	private String postcode;
	private String address;
	private String extraAddress;
	private String detailAddress;
	private int mcode;

	public MemberVO() {
	}

	public MemberVO(String mid, String mpw, String mname, String memail) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.memail = memail;
	}

	public MemberVO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}



	public MemberVO(String mid, String mpw, String mname, String mgender, String mphonenumber, String memail,
			String postcode, String address, String extraAddress, String detailAddress, int mcode) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mgender = mgender;
		this.mphonenumber = mphonenumber;
		this.memail = memail;
		this.postcode = postcode;
		this.address = address;
		this.extraAddress = extraAddress;
		this.detailAddress = detailAddress;
		this.mcode = mcode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMphonenumber() {
		return mphonenumber;
	}

	public void setMphonenumber(String mphonenumber) {
		this.mphonenumber = mphonenumber;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(mid, mpw);
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
		return Objects.equals(mid, other.mid) && Objects.equals(mpw, other.mpw);
	}

	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mname=" + mname + ", mphonenumber=" + mphonenumber + "]";
	}

}
