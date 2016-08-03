package com.blanche.intro.vo;

public class investVO {
	private int inv_index;	//투자 정보 번호
	private int sponser_index; //투자자 정보 번호
	private int intro_index; //프로젝트 번호
	
	public int getInv_index() {
		return inv_index;
	}
	public void setInv_index(int inv_index) {
		this.inv_index = inv_index;
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
}
