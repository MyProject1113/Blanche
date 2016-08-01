package com.blanche.establish.vo;

/** 기부현황 **/
public class DonationVO {
	/*private int 		dona_index;			// 기부번호*/
	private String 	dona_purpose	= "";	// 투자받은 금액
	private int 		dona_report;			// 모금현황
	private String 	dona_fund		= "";	// 투자받은 금액
	private int 		dona_count;			// 후원자 수
	private int 		dona_dday;				// 남은 시간
	private String 	dona_endDate	= "";	// 투자받은 금액
	/*private int 		app_index;				// 신청번호*/
	private int 		intro_index;				// 프로젝트 번호
	
	/*public int getDona_index() {
		return dona_index;
	}
	
	public void setDona_index(int dona_index) {
		this.dona_index = dona_index;
	}*/

	public int getDona_report() {
		return dona_report;
	}

	public String getDona_purpose() {
		return dona_purpose;
	}

	public void setDona_purpose(String dona_purpose) {
		this.dona_purpose = dona_purpose;
	}

	public void setDona_report(int dona_report) {
		this.dona_report = dona_report;
	}

	public String getDona_fund() {
		return dona_fund;
	}

	public void setDona_fund(String dona_fund) {
		this.dona_fund = dona_fund;
	}

	public int getDona_count() {
		return dona_count;
	}

	public void setDona_count(int dona_count) {
		this.dona_count = dona_count;
	}

	public int getDona_dday() {
		return dona_dday;
	}

	public void setDona_dday(int dona_dday) {
		this.dona_dday = dona_dday;
	}

	public String getDona_endDate() {
		return dona_endDate;
	}

	public void setDona_endDate(String dona_endDate) {
		this.dona_endDate = dona_endDate;
	}

	/*public int getApp_index() {
		return app_index;
	}

	public void setApp_index(int app_index) {
		this.app_index = app_index;
	}*/

	public int getIntro_index() {
		return intro_index;
	}

	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
}
