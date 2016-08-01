package com.blanche.user.access.vo;

public class UserAccessVO {
	private int usacc_index	= 0;	// 접속일련번호
	private int us_index 		= 0;	// 회원일련번호
	private String usacc_ip 	= "";	// 접속IP
	private String usacc_date	= "";	// 접속일
	
	public int getUsacc_index() {
		return usacc_index;
	}
	public void setUsacc_index(int usacc_index) {
		this.usacc_index = usacc_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getUsacc_ip() {
		return usacc_ip;
	}
	public void setUsacc_ip(String usacc_ip) {
		this.usacc_ip = usacc_ip;
	}
	public String getUsacc_date() {
		return usacc_date;
	}
	public void setUsacc_date(String usacc_date) {
		this.usacc_date = usacc_date;
	}
}