package com.blanche.establish.vo;

public class ProjectListVO {
	private String		plist_image			= "";	// 프로젝트 이미지
	private String		plist_title			= "";	// 프로젝트 제목
	private String		plist_fund			= "";	// 목표 금액
	private String		plist_collection		= "0";	// 현재 모금된 금액
	private String		plist_abbreviation	= "";	// 프로젝트 간략소개
	private String		plist_startDate		= "";	// 프로젝트 시작일
	private String		plist_endDate		= "";	// 프로젝트 종료일
	private int			plist_dDay;					// 프로젝트 D-Day
	private int			plist_startCheck;			// 프로젝트 시작일 체크
	private int 		app_index;					// 개설 신청 번호
	private int			intro_index;					// 프로젝트 번호
	
	public String getPlist_image() {
		return plist_image;
	}
	
	public void setPlist_image(String plist_image) {
		this.plist_image = plist_image;
	}
	
	public String getPlist_title() {
		return plist_title;
	}
	
	public void setPlist_title(String plist_title) {
		this.plist_title = plist_title;
	}
	
	public String getPlist_fund() {
		return plist_fund;
	}
	
	public void setPlist_fund(String plist_fund) {
		this.plist_fund = plist_fund;
	}
	
	public String getPlist_collection() {
		return plist_collection;
	}
	
	public void setPlist_collection(String plist_collection) {
		this.plist_collection = plist_collection;
	}
	
	public String getPlist_abbreviation() {
		return plist_abbreviation;
	}
	
	public void setPlist_abbreviation(String plist_abbreviation) {
		this.plist_abbreviation = plist_abbreviation;
	}
	
	public String getPlist_startDate() {
		return plist_startDate;
	}
	
	public void setPlist_startDate(String plist_startDate) {
		this.plist_startDate = plist_startDate;
	}
	
	public String getPlist_endDate() {
		return plist_endDate;
	}
	
	public void setPlist_endDate(String plist_endDate) {
		this.plist_endDate = plist_endDate;
	}
	
	public int getPlist_dDay() {
		return plist_dDay;
	}

	public void setPlist_dDay(int plist_dDay) {
		this.plist_dDay = plist_dDay;
	}

	public int getPlist_startCheck() {
		return plist_startCheck;
	}

	public void setPlist_startCheck(int plist_startCheck) {
		this.plist_startCheck = plist_startCheck;
	}

	public int getApp_index() {
		return app_index;
	}
	
	public void setApp_index(int app_index) {
		this.app_index = app_index;
	}
	
	public int getIntro_index() {
		return intro_index;
	}
	
	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
}
