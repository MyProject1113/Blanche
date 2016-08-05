package com.blanche.establish.vo;

import com.blanche.user.common.util.EncryptionUtil;

/** 댓글 **/
public class ReplyVO {
	private int		re_index			= 0;	// 댓글번호
	private String	re_name			= "";	// 작성자
	private String	re_password	= "";	// 비밀번호
	private String	re_content		= "";	// 글내용
	private String	re_date			= "";	// 작성일
	private int		intro_index		= 0;	// 프로젝트 번호
	private int		us_index;
	
	private int		page				= 1;		// 페이지
	private int		pageSize		= 20;		// 페이지 크기
	private int		pageCount		= 1;		// 페이지 개수
	private int		pageSpare		= 3;		// 페이지 표시여분
	
	public int getRe_index() {
		return re_index;
	}
	public void setRe_index(int re_index) {
		this.re_index = re_index;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_password() {
		return re_password;
	}
	public void setRe_password(String re_password) {
		this.re_password = EncryptionUtil.getSHA256(re_password);
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
	public int getIntro_index() {
		return intro_index;
	}
	public void setIntro_index(int intro_index) {
		this.intro_index = intro_index;
	}
	
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if (page > 0) {
			this.page = page;
		} else {
			this.page = 1;
		}
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if (pageSize > 0) {
			this.pageSize = pageSize;
		} else {
			this.pageSize = 1;
		}
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		if (pageCount > 0) {
			this.pageCount = pageCount;
		} else {
			this.pageCount = 1;
		}
	}
	public int getPageSpare() {
		return pageSpare;
	}
	public void setPageSpare(int pageSpare) {
		this.pageSpare = pageSpare;
	}
	public void setListCount(int listCount) {
		if (listCount > 0) {
			this.pageCount = ((listCount - 1) / pageSize) + 1;
		} else {
			this.pageCount = 1;
		}
	}
	public int getStartRow() {
		return ((page - 1) * pageSize) + 1;
	}
	public int getEndRow() {
		return page * pageSize;
	}
}