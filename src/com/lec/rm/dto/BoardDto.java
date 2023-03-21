package com.lec.rm.dto;

import java.sql.Date;

public class BoardDto {
	private int bid;
	private String mid;
	private String mname;
	private String mnickname;
	private String btitle;
	private String bcontent;
	private String bfilename;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private Date brdate;
	public BoardDto() {}
	public BoardDto(int bid, String mid, String mname, String mnickname, String btitle, String bcontent,
			String bfilename, int bhit, int bgroup, int bstep, int bindent, Date brdate) {
		this.bid = bid;
		this.mid = mid;
		this.mname = mname;
		this.mnickname = mnickname;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfilename = bfilename;
		this.bhit = bhit;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
		this.brdate = brdate;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBfilename() {
		return bfilename;
	}
	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}
	public int getBhit() {
		return bhit;
	}
	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getBindent() {
		return bindent;
	}
	public void setBindent(int bindent) {
		this.bindent = bindent;
	}
	public Date getBrdate() {
		return brdate;
	}
	public void setBrdate(Date brdate) {
		this.brdate = brdate;
	}
	@Override
	public String toString() {
		return "BoardDto [bid=" + bid + ", mid=" + mid + ", mname=" + mname + ", mnickname=" + mnickname + ", btitle="
				+ btitle + ", bcontent=" + bcontent + ", bfilename=" + bfilename + ", bhit=" + bhit + ", bgroup="
				+ bgroup + ", bstep=" + bstep + ", bindent=" + bindent + ", brdate=" + brdate + "]";
	}
}
