package com.blanche.establish.vo;

/** 댓글 **/
public class ReplyVO {
	private int 		re_index;			// 댓글번호
	private String 	re_image		= "";	// 사진
	private String 	re_content	= "";	// 글내용
	private String 	re_date		= "";	// 작성일
	private String 	re_name		= "";	// 작성자
	private int 		re_count;			// 댓글개수
	private int 		intro_index;			// 프로젝트 번호
	
	public int getRe_index() {
		return re_index;
	}
	
	public void setRe_index(int re_index) {
		this.re_index = re_index;
	}

	public String getRe_image() {
		return re_image;
	}

	public void setRe_image(String re_image) {
		this.re_image = re_image;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getRe_date() {
		return re_date;
	}

	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}

	public String getRe_name() {
		return re_name;
	}

	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}

	public int getRe_count() {
		return re_count;
	}

	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}

	public int getIntro_index() {
		return intro_index;
	}

	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
}
