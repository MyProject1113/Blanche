package com.blanche.notice.main.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.blanche.board.common.vo.DefaultVO;

public class NoticeMainVO extends DefaultVO {
	private int 	nt_index		= 0;		// 본문일련번호
	private int 	us_index		= 0;		// 회원일련번호
	private String 	nt_title		= "";		// 제목
	private String 	nt_content		= "";		// 내용
	private int 	nt_check		= 0;		// 조회수
	private int 	nt_important		= 0;		// 강조여부
	private int 	nt_delete		= 0;		// 삭제여부
	private String 	nt_regdate		= "";		// 등록일
	private String 	nt_modidate		= "";		// 수정일
	
	private int 	num				= 0;		// 글번호
	private int		pictureCount	= 0;		// 그림파일 개수
	private int		attachCount		= 0;		// 첨부파일 개수
	
	private List<MultipartFile> attachUpload	= null;	// 첨부파일 전송
	private List<Integer> attachDelete			= null;	// 첨부파일 삭제
	
	public int getNt_index() {
		return nt_index;
	}
	public void setNt_index(int nt_index) {
		this.nt_index = nt_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public int getNt_check() {
		return nt_check;
	}
	public void setNt_check(int nt_check) {
		this.nt_check = nt_check;
	}
	public int getNt_important() {
		return nt_important;
	}
	public void setNt_important(int nt_important) {
		this.nt_important = nt_important;
	}
	public int getNt_delete() {
		return nt_delete;
	}
	public void setNt_delete(int nt_delete) {
		this.nt_delete = nt_delete;
	}
	public String getNt_regdate() {
		return nt_regdate;
	}
	public void setNt_regdate(String nt_regdate) {
		this.nt_regdate = nt_regdate;
	}
	public String getNt_modidate() {
		return nt_modidate;
	}
	public void setNt_modidate(String nt_modidate) {
		this.nt_modidate = nt_modidate;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPictureCount() {
		return pictureCount;
	}
	public void setPictureCount(int pictureCount) {
		this.pictureCount = pictureCount;
	}
	public int getAttachCount() {
		return attachCount;
	}
	public void setAttachCount(int attachCount) {
		this.attachCount = attachCount;
	}
	
	public List<MultipartFile> getAttachUpload() {
		return attachUpload;
	}
	public void setAttachUpload(List<MultipartFile> attachUpload) {
		this.attachUpload = attachUpload;
	}
	public List<Integer> getAttachDelete() {
		return attachDelete;
	}
	public void setAttachDelete(List<Integer> attachDelete) {
		this.attachDelete = attachDelete;
	}
}