package com.blanche.establish.vo;

/** 기획자 정보 **/
public class PlannerVO {
	private int 		plan_index;				// 정보번호
	private String 	plan_image		= "";	// 사진
	private String 	plan_name		= "";	// 이름
	private String 	plan_area		= "";	// 지역
	private String 	plan_account	= "";	// 계좌번호
	private int 		intro_index; 			// 프로젝트 번호
	
	public int getPlan_index() {
		return plan_index;
	}
	
	public void setPlan_index(int plan_index) {
		this.plan_index = plan_index;
	}

	public String getPlan_image() {
		return plan_image;
	}

	public void setPlan_image(String plan_image) {
		this.plan_image = plan_image;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public String getPlan_area() {
		return plan_area;
	}

	public void setPlan_area(String plan_area) {
		this.plan_area = plan_area;
	}

	public String getPlan_account() {
		return plan_account;
	}

	public void setPlan_account(String plan_account) {
		this.plan_account = plan_account;
	}

	public int getIntro_index() {
		return intro_index;
	}

	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
}
