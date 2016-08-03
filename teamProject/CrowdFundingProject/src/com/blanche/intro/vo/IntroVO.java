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
	private long intro_index; //프로젝트 번호
	private long app_index; //개설신청 번호
	private int us_index;	//회원 정보 번호
	private long project_invest;	// 프로젝트 투자 금액
	private String sponser_phone;//후원자 연락처
	private int sponser_index;//기본키
	
	
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
	public long getIntro_index() {
		return intro_index;
	}
	public void setIntro_index(long intro_index) {
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
	public long getApp_index() {
		return app_index;
	}
	public void setApp_index(long app_index) {
		this.app_index = app_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	
}
