package com.blanche.user.accredit.vo;

public class UserAccreditVO {
	private int		usacd_index	= 0;	// 인증일련번호
	private int		us_index			= 0;	// 회원일련번호
	private String	usacd_code		= "";	// 인증코드
	private int		usacd_type		= 0;	// 인증종류

	private String	userName		= "";	// 회원 이름;
	private String	userEmail		= "";	// 회원 이메일;
	
	public int getUsacd_index() {
		return usacd_index;
	}
	public void setUsacd_index(int usacd_index) {
		this.usacd_index = usacd_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getUsacd_code() {
		return usacd_code;
	}
	public void setUsacd_code(String usacd_code) {
		this.usacd_code = usacd_code;
	}
	public int getUsacd_type() {
		return usacd_type;
	}
	public void setUsacd_type(int usacd_type) {
		this.usacd_type = usacd_type;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
}