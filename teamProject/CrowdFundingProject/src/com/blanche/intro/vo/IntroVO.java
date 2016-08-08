package com.blanche.intro.vo;

public class IntroVO {
	private String sponser_add;	//배송 주소
	private String sponser_addnum;	//배송 우편 번호
	private String sponser_p_method;	// 결제 방법
	private String sponser_p_confirm;	//결제 확인 유무
	private String usact_bank;	//환불 은행명
	private String usact_number;	//환불 계좌번호
	private String sponser_name;	//리워드 받는 사람명
	private String sponser_memo;	//리워드 배송메모
	private String sponser_email;		//리워드 이메일주소
	private String phone; //리워드 연락처
	private String intro_title;	//프로젝트 이름
	private String app_fund;	//프로젝트 목표금액
	private String intro_details; //프로젝트 상세내용
	private long sponser_invest; //프로젝트 모집 금액
	private String app_field;	//프로젝트 카테고리
	private String intro_image; //프로젝트 이미지 경로
	private int intro_index; //프로젝트 번호
	private int app_index; //개설신청 번호
	private int us_index;	//회원 정보 번호
	private long project_invest;	// 프로젝트 투자 금액
	private String sponser_phone;//후원자 연락처
	private int sponser_index;//기본키
	private int usact_index; //계좌 정보 번호
	
	
	
	private String		plist_image			= "";	// 프로젝트 이미지
	private String		plist_title			= "";	// 프로젝트 제목
	private String		plist_fund			= "";	// 목표 금액
	private String		plist_collection		= "0";	// 현재 모금된 금액
	private String		plist_abbreviation	= "";	// 프로젝트 간략소개
	private String		plist_startDate		= "";	// 프로젝트 시작일
	private String		plist_endDate		= "";	// 프로젝트 종료일
	private int			plist_dDay;					// 프로젝트 D-Day
	private int			plist_startCheck;			// 프로젝트 시작일 체크
	
	
	
	
	
	
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
	
	public int getUsact_index() {
		return usact_index;
	}
	public void setUsact_index(int usact_index) {
		this.usact_index = usact_index;
	}
	public long getProject_invest() {
		return project_invest;
	}
	public void setProject_invest(long project_invest) {
		this.project_invest = project_invest;
	}
	public String getSponser_phone() {
		return sponser_phone;
	}
	public void setSponser_phone(String sponser_phone) {
		this.sponser_phone = sponser_phone;
	}
	public int getSponser_index() {
		return sponser_index;
	}
	public void setSponser_index(int sponser_index) {
		this.sponser_index = sponser_index;
	}
	public int getIntro_index() {
		return intro_index;
	}
	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
	public String getIntro_image() {
		return intro_image;
	}
	public void setIntro_image(String intro_image) {
		this.intro_image = intro_image;
	}
	public String getApp_field() {
		return app_field;
	}
	public void setApp_field(String app_field) {
		this.app_field = app_field;
	}
	public String getIntro_title() {
		return intro_title;
	}
	public void setIntro_title(String intro_title) {
		this.intro_title = intro_title;
	}
	public String getApp_fund() {
		return app_fund;
	}
	public void setApp_fund(String app_fund) {
		this.app_fund = app_fund;
	}
	public String getIntro_details() {
		return intro_details;
	}
	public void setIntro_details(String intro_details) {
		this.intro_details = intro_details;
	}
	public long getSponser_invest() {
		return sponser_invest;
	}
	public void setSponser_invest(long sponser_invest) {
		this.sponser_invest = sponser_invest;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
	public String getSponser_add() {
		return sponser_add;
	}
	public void setSponser_add(String sponser_add) {
		this.sponser_add = sponser_add;
	}
	public String getSponser_addnum() {
		return sponser_addnum;
	}
	public void setSponser_addnum(String sponser_addnum) {
		this.sponser_addnum = sponser_addnum;
	}

	public String getSponser_p_method() {
		return sponser_p_method;
	}
	public void setSponser_p_method(String sponser_p_method) {
		this.sponser_p_method = sponser_p_method;
	}
	public String getSponser_p_confirm() {
		return sponser_p_confirm;
	}
	public void setSponser_p_confirm(String sponser_p_confirm) {
		this.sponser_p_confirm = sponser_p_confirm;
	}
	public String getUsact_bank() {
		return usact_bank;
	}
	public void setUsact_bank(String usact_bank) {
		this.usact_bank = usact_bank;
	}
	public String getUsact_number() {
		return usact_number;
	}
	public void setUsact_number(String usact_number) {
		this.usact_number = usact_number;
	}
	public String getSponser_name() {
		return sponser_name;
	}
	public void setSponser_name(String sponser_name) {
		this.sponser_name = sponser_name;
	}
	public String getSponser_memo() {
		return sponser_memo;
	}
	public void setSponser_memo(String sponser_memo) {
		this.sponser_memo = sponser_memo;
	}
	public String getSponser_email() {
		return sponser_email;
	}
	public void setSponser_email(String sponser_email) {
		this.sponser_email = sponser_email;
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
