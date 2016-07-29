package com.blanche.establish.vo;

/** 승인 **/
public class ApprovalVO {
	private int appro_index;	// 승인번호
	private int appro_check;	// 승인여부
	private int app_index;		// 신청번호
	private int us_index;		// 회원일련번호
	
	public int getAppro_index() {
		return appro_index;
	}
	
	public void setAppro_index(int appro_index) {
		this.appro_index = appro_index;
	}

	public int getAppro_check() {
		return appro_check;
	}

	public void setAppro_check(int appro_check) {
		this.appro_check = appro_check;
	}

	public int getApp_index() {
		return app_index;
	}

	public void setApp_index(int app_index) {
		this.app_index = app_index;
	}

	public int getUs_index() {
		return us_index;
	}

	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
}
