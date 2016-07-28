package com.blanche.board.info.vo;

public class BoardInfoVO {
	private int		bdinf_index			= 0;	// 목록일련번호
	private String	bdinf_title			= "";	// 게시판이름
	private String	bdinf_uri			= "";	// 게시판식별자
	
	public int getBdinf_index() {
		return bdinf_index;
	}
	public void setBdinf_index(int bdinf_index) {
		this.bdinf_index = bdinf_index;
	}
	public String getBdinf_title() {
		return bdinf_title;
	}
	public void setBdinf_title(String bdinf_title) {
		this.bdinf_title = bdinf_title;
	}
	public String getBdinf_uri() {
		return bdinf_uri;
	}
	public void setBdinf_uri(String bdinf_uri) {
		this.bdinf_uri = bdinf_uri;
	}
}