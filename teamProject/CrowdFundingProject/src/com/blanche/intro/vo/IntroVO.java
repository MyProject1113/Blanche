package com.blanche.intro.vo;

public class IntroVO {
	private String sponser_add;	//배송 주소
	private String sponser_addnum;	//배송 우편 번호
	private long project_invest;	// 프로젝트 투자 금액
	private String sponser_p_method;	// 결제 방법
	private String sponser_p_confirm;	//결제 확인 유무
	private String usact_bank;	//환불 은행명
	private String usact_number;	//환불 계좌번호
	private String sponser_name;	//리워드 받는 사람명
	private String sponser_memo;	//리워드 배송메모
	private String sponser_email;		//리워드 이메일주소
	private String phone; //리워드 연락처
	
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
	public long getProject_invest() {
		return project_invest;
	}
	public void setProject_invest(long project_invest) {
		this.project_invest = project_invest;
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
	
	
	
}
