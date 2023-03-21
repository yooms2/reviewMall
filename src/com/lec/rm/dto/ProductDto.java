package com.lec.rm.dto;

public class ProductDto {
	private int pid;
	private String pname;
	private int pprice;
	private String psize;
	private String pcategory;
	private String paimage;
	private String pbimage;
	private String pcontent;
	public ProductDto() {}
	public ProductDto(int pid, String pname, int pprice, String psize, String pcategory, String paimage, String pbimage,
			String pcontent) {
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.psize = psize;
		this.pcategory = pcategory;
		this.paimage = paimage;
		this.pbimage = pbimage;
		this.pcontent = pcontent;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public String getPcategory() {
		return pcategory;
	}
	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}
	public String getPaimage() {
		return paimage;
	}
	public void setPaimage(String paimage) {
		this.paimage = paimage;
	}
	public String getPbimage() {
		return pbimage;
	}
	public void setPbimage(String pbimage) {
		this.pbimage = pbimage;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	@Override
	public String toString() {
		return "ProductDto [pid=" + pid + ", pname=" + pname + ", pprice=" + pprice + ", psize=" + psize + ", pcategory="
				+ pcategory + ", paimage=" + paimage + ", pbimage=" + pbimage + ", pcontent=" + pcontent + "]";
	}
}
