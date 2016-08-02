package com.blanche.user.agree.vo;

public class UserAgreeVO {
	 private int		usagr_index	= 0; // 동의일련번호
	 private int		us_index		= 0; // 회원일련번호
	 private String	usagr_date1	= ""; // 개인정보취급약관동의일
	 private String	usagr_date2	= ""; // 홈페이지이용약관동의일
	 
	public int getUsagr_index() {
		return usagr_index;
	}
	public void setUsagr_index(int usagr_index) {
		this.usagr_index = usagr_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getUsagr_date1() {
		return usagr_date1;
	}
	public void setUsagr_date1(String usagr_date1) {
		this.usagr_date1 = usagr_date1;
	}
	public String getUsagr_date2() {
		return usagr_date2;
	}
	public void setUsagr_date2(String usagr_date2) {
		this.usagr_date2 = usagr_date2;
	}
}