package com.blanche.establish.vo;

/** 댓글 **/
public class IntroApprovalVO {
	private int 		intapp_index;			// 프로젝트 승인번호
	private int 		intapp_check;			// 승인여부	// 0:진행중, 1:수정요청, 2:수정승인, 3:삭제요청, 4:기간만료
	private String 	intapp_reason	= "";	// 요청이유
	private String 	intapp_note		= "";	// 비고
	private int 		intro_index;				// 프로젝트 번호
	private int 		us_index;				// 회원일련번호
	
	public int getIntapp_index() {
		return intapp_index;
	}
	
	public void setIntapp_index(int intapp_index) {
		this.intapp_index = intapp_index;
	}
	
	public int getIntapp_check() {
		return intapp_check;
	}
	
	public void setIntapp_check(int intapp_check) {
		this.intapp_check = intapp_check;
	}
	
	public String getIntapp_reason() {
		return intapp_reason;
	}
	
	public void setIntapp_reason(String intapp_reason) {
		this.intapp_reason = intapp_reason;
	}
	
	public String getIntapp_note() {
		return intapp_note;
	}
	
	public void setIntapp_note(String intapp_note) {
		this.intapp_note = intapp_note;
	}
	
	public int getIntro_index() {
		return intro_index;
	}
	
	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}

	public int getUs_index() {
		return us_index;
	}

	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
}
