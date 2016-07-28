package com.blanche.user.main.vo;

public class UserMainVO {
	private int		us_index		= 0;	// 회원일련번호
	private String	us_email		= "";	// 이메일
	private String	us_password		= "";	// 비밀번호
	private String	us_name			= "";	// 이름
	private String	us_nickname		= "";	// 별칭
	private int		us_rank			= 0;	// 등급
	private String	us_phone		= "";	// 연락처
	private String	us_joindate		= "";	// 가입일
	private String	us_modidate1	= "";	// 회원정보변경일
	private String	us_modidate2	= "";	// 비밀번호변경일
	
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_password() {
		return us_password;
	}
	public void setUs_password(String us_password) {
		this.us_password = us_password;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_nickname() {
		return us_nickname;
	}
	public void setUs_nickname(String us_nickname) {
		this.us_nickname = us_nickname;
	}
	public int getUs_rank() {
		return us_rank;
	}
	public void setUs_rank(int us_rank) {
		this.us_rank = us_rank;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public String getUs_joindate() {
		return us_joindate;
	}
	public void setUs_joindate(String us_joindate) {
		this.us_joindate = us_joindate;
	}
	public String getUs_modidate1() {
		return us_modidate1;
	}
	public void setUs_modidate1(String us_modidate1) {
		this.us_modidate1 = us_modidate1;
	}
	public String getUs_modidate2() {
		return us_modidate2;
	}
	public void setUs_modidate2(String us_modidate2) {
		this.us_modidate2 = us_modidate2;
	}
}