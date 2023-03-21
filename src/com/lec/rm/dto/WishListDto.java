package com.lec.rm.dto;

public class WishListDto {
	private int wid;
	private String mid;
	private String mname;
	private String pname;
	private int pid;
	public WishListDto() {}
	public WishListDto(int wid, String mid, String mname, String pname, int pid) {
		this.wid = wid;
		this.mid = mid;
		this.mname = mname;
		this.pname = pname;
		this.pid = pid;
	}
	public int getWid() {
		return wid;
	}
	public void setWid(int wid) {
		this.wid = wid;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "WishListDto [wid=" + wid + ", mid=" + mid + ", mname=" + mname + ", pname=" + pname + ", pid=" + pid
				+ "]";
	}
}
