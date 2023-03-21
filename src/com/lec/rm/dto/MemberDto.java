package com.lec.rm.dto;

import java.sql.Date;

public class MemberDto {
	private String mid;
	private String mpw;
	private String mname;
	private String mnickname;
	private String mtel;
	private String memail;
	private Date mbirth;
	private String mgender;
	private String maddress;
	private Date mrdate;
	public MemberDto() {}
	public MemberDto(String mid, String mpw, String mname, String mnickname, String mtel, String memail, Date mbirth,
			String mgender, String maddress, Date mrdate) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mnickname = mnickname;
		this.mtel = mtel;
		this.memail = memail;
		this.mbirth = mbirth;
		this.mgender = mgender;
		this.maddress = maddress;
		this.mrdate = mrdate;
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
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public Date getMrdate() {
		return mrdate;
	}
	public void setMrdate(Date mrdate) {
		this.mrdate = mrdate;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mnickname=" + mnickname + ", mtel="
				+ mtel + ", memail=" + memail + ", mbirth=" + mbirth + ", mgender=" + mgender + ", maddress=" + maddress
				+ ", mrdate=" + mrdate + "]";
	}
}
