package com.blanche.faq.attach.vo;

import org.springframework.web.multipart.MultipartFile;

public class FaqAttachVO {
	private int				fqatt_index		= 0;	// 첨부일련번호
	private int				fq_index		= 0;	// 본문일련번호
	private String			fqatt_path		= "";	// 첨부파일경로
	private int				fqatt_delete	= 0;	// 삭제여부
	private String			fqatt_regdate	= "";	// 등록일
	private	String			fqatt_modidate	= "";	// 수정일
	
	private String			CKEditorFuncNum = null;	// CKEditer에서 전송되는 일련번호 
	private MultipartFile	upload			= null;	// CKEditer에서 전송되는 첨부파일
	
	public int getFqatt_index() {
		return fqatt_index;
	}

	public void setFqatt_index(int fqatt_index) {
		this.fqatt_index = fqatt_index;
	}

	public int getFq_index() {
		return fq_index;
	}

	public void setFq_index(int fq_index) {
		this.fq_index = fq_index;
	}

	public String getFqatt_path() {
		return fqatt_path;
	}

	public void setFqatt_path(String fqatt_path) {
		this.fqatt_path = fqatt_path;
	}

	public int getFqatt_delete() {
		return fqatt_delete;
	}

	public void setFqatt_delete(int fqatt_delete) {
		this.fqatt_delete = fqatt_delete;
	}

	public String getFqatt_regdate() {
		return fqatt_regdate;
	}

	public void setFqatt_regdate(String fqatt_regdate) {
		this.fqatt_regdate = fqatt_regdate;
	}

	public String getFqatt_modidate() {
		return fqatt_modidate;
	}

	public void setFqatt_modidate(String fqatt_modidate) {
		this.fqatt_modidate = fqatt_modidate;
	}

	public String getFileName() {
		String fileName = "";
		int dot = fqatt_path.lastIndexOf("/") + 1;
		if (dot > 0) {
			fileName = fqatt_path.substring(dot);
		} else {
			fileName = fqatt_path;
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