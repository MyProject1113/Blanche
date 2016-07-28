package com.blanche.board.comment.vo;

import com.blanche.board.common.entity.DefaultDTO;

public class BoardCommentVO extends DefaultDTO {
	private int		bdcmt_index		= 0;	// 댓글일련번호
	private int		bd_index		= 0;	// 본문일련번호
	private int		us_index		= 0;	// 회원일련번호
	private String	bdcmt_content	= "";	// 내용
	private int		bdcmt_delete	= 0;	// 삭제여부
	private String	bdcmt_regdate	= "";	// 등록일
	private String	bdcmt_modidate	= "";	// 수정일
	
	public int getBdcmt_index() {
		return bdcmt_index;
	}
	public void setBdcmt_index(int bdcmt_index) {
		this.bdcmt_index = bdcmt_index;
	}
	public int getBd_index() {
		return bd_index;
	}
	public void setBd_index(int bd_index) {
		this.bd_index = bd_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getBdcmt_content() {
		return bdcmt_content;
	}
	public void setBdcmt_content(String bdcmt_content) {
		this.bdcmt_content = bdcmt_content.trim();
	}
	public int getBdcmt_delete() {
		return bdcmt_delete;
	}
	public void setBdcmt_delete(int bdcmt_delete) {
		this.bdcmt_delete = bdcmt_delete;
	}
	public String getBdcmt_regdate() {
		return bdcmt_regdate;
	}
	public void setBdcmt_regdate(String bdcmt_regdate) {
		this.bdcmt_regdate = bdcmt_regdate.trim();
	}
	public String getBdcmt_modidate() {
		return bdcmt_modidate;
	}
	public void setBdcmt_modidate(String bdcmt_modidate) {
		this.bdcmt_modidate = bdcmt_modidate.trim();
	}
}