package com.blanche.notice.attach.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeAttachVO {
	private int				ntatt_index		= 0;	// 첨부일련번호
	private int				nt_index		= 0;	// 본문일련번호
	private String			ntatt_path		= "";	// 첨부파일경로
	private int				ntatt_delete	= 0;	// 삭제여부
	private String			ntatt_regdate	= "";	// 등록일
	private	String			ntatt_modidate	= "";	// 수정일
	
	private String			CKEditorFuncNum = null;	// CKEditer에서 전송되는 일련번호 
	private MultipartFile	upload			= null;	// CKEditer에서 전송되는 첨부파일
	
	public int getNtatt_index() {
		return ntatt_index;
	}
	public void setNtatt_index(int ntatt_index) {
		this.ntatt_index = ntatt_index;
	}
	public int getNt_index() {
		return nt_index;
	}
	public void setNt_index(int nt_index) {
		this.nt_index = nt_index;
	}
	public String getNtatt_path() {
		return ntatt_path;
	}
	public void setNtatt_path(String ntatt_path) {
		this.ntatt_path = ntatt_path;
	}
	public int getNtatt_delete() {
		return ntatt_delete;
	}
	public void setNtatt_delete(int ntatt_delete) {
		this.ntatt_delete = ntatt_delete;
	}
	public String getNtatt_regdate() {
		return ntatt_regdate;
	}
	public void setNtatt_regdate(String ntatt_regdate) {
		this.ntatt_regdate = ntatt_regdate;
	}
	public String getNtatt_modidate() {
		return ntatt_modidate;
	}
	public void setNtatt_modidate(String ntatt_modidate) {
		this.ntatt_modidate = ntatt_modidate;
	}
	
	public String getFileName() {
		String fileName = "";
		int dot = ntatt_path.lastIndexOf("/") + 1;
		if (dot > 0) {
			fileName = ntatt_path.substring(dot);
		} else {
			fileName = ntatt_path;
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