package com.blanche.board.attach.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardAttachVO {
	private int				bdatt_index		= 0;	// 첨부일련번호
	private int				bd_index		= 0;	// 본문일련번호
	private String			bdatt_path		= "";	// 첨부파일경로
	private int				bdatt_delete	= 0;	// 삭제여부
	private String			bdatt_regdate	= "";	// 등록일
	private	String			bdatt_modidate	= "";	// 수정일
	
	private String			CKEditorFuncNum = null;	// CKEditer에서 전송되는 일련번호 
	private MultipartFile	upload			= null;	// CKEditer에서 전송되는 첨부파일
	
	public int getBdatt_index() {
		return bdatt_index;
	}
	public void setBdatt_index(int bdatt_index) {
		this.bdatt_index = bdatt_index;
	}
	public int getBd_index() {
		return bd_index;
	}
	public void setBd_index(int bd_index) {
		this.bd_index = bd_index;
	}
	public String getBdatt_path() {
		return bdatt_path;
	}
	public void setBdatt_path(String bdatt_path) {
		this.bdatt_path = bdatt_path.trim();
	}
	public int getBdatt_delete() {
		return bdatt_delete;
	}
	public void setBdatt_delete(int bdatt_delete) {
		this.bdatt_delete = bdatt_delete;
	}
	public String getBdatt_regdate() {
		return bdatt_regdate;
	}
	public void setBdatt_regdate(String bdatt_regdate) {
		this.bdatt_regdate = bdatt_regdate.trim();
	}
	public String getBdatt_modidate() {
		return bdatt_modidate;
	}
	public void setBdatt_modidate(String bdatt_modidate) {
		this.bdatt_modidate = bdatt_modidate.trim();
	}
	
	public String getFileName() {
		String fileName = "";
		int dot = bdatt_path.lastIndexOf("/") + 1;
		if (dot > 0) {
			fileName = bdatt_path.substring(dot);
		} else {
			fileName = bdatt_path;
		}
		return fileName;
	}
	
	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}
	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
}