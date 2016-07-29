package com.blanche.establish.vo;

/** 개설신청 **/
public class ApplicationVO {
	private int 		app_index;				// 신청번호
	private String 	app_topic		= "";	// 주제소개
	private String 	app_fund		= "";	// 목표자금
	private String 	app_field			= "";	// 분야
	private String 	app_reference	= "";	// 참고
	private String 	app_phone		= "";	// 연락처
	private int 		us_index;				// 회원일련번호

	/*// 조건 검색시 사용할 속성
	private String search = "";
	private String keyword = "";
	
	// 정렬을 위한 속성
	private String order_by;
	private String order_sc;*/
		
	public int getApp_index() {
		return app_index;
	}
	
	public void setApp_index(int app_index) {
		this.app_index = app_index;
	}

	public String getApp_topic() {
		return app_topic;
	}

	public void setApp_topic(String app_topic) {
		this.app_topic = app_topic;
	}

	public String getApp_fund() {
		return app_fund;
	}

	public void setApp_fund(String app_fund) {
		this.app_fund = app_fund;
	}

	public String getApp_field() {
		return app_field;
	}

	public void setApp_field(String app_field) {
		this.app_field = app_field;
	}

	public String getApp_reference() {
		return app_reference;
	}

	public void setApp_reference(String app_reference) {
		this.app_reference = app_reference;
	}

	public String getApp_phone() {
		return app_phone;
	}

	public void setApp_phone(String app_phone) {
		this.app_phone = app_phone;
	}

	public int getUs_index() {
		return us_index;
	}

	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}

	/*public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	public String getOrder_sc() {
		return order_sc;
	}

	public void setOrder_sc(String order_sc) {
		this.order_sc = order_sc;
	}*/
}
