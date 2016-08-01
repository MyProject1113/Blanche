package com.blanche.faq.main.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.blanche.board.common.vo.DefaultVO;

public class FaqMainVO extends DefaultVO {
	private int 	fq_index		= 0;		// 본문일련번호
	private int 	us_index		= 0;		// 회원일련번호
	private String 	fq_title		= "";		// 제목
	private String 	fq_content		= "";		// 내용
	private int 	fq_check		= 0;		// 조회수
	private int 	fq_important		= 0;		// 강조여부
	private int 	fq_delete		= 0;		// 삭제여부
	private String 	fq_regdate		= "";		// 등록일
	private String 	fq_modidate		= "";		// 수정일
	
	private int 	num				= 0;		// 글번호
	private int		pictureCount	= 0;		// 그림파일 개수
	private int		attachCount		= 0;		// 첨부파일 개수
	
	private List<MultipartFile> attachUpload	= null;	// 첨부파일 전송
	private List<Integer> attachDelete			= null;	// 첨부파일 삭제
	
	public int getFq_index() {
		return fq_index;
	}
	public void setFq_index(int fq_index) {
		this.fq_index = fq_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getFq_title() {
		return fq_title;
	}
	public void setFq_title(String fq_title) {
		this.fq_title = fq_title;
	}
	public String getFq_content() {
		return fq_content;
	}
	public void setFq_content(String fq_content) {
		this.fq_content = fq_content;
	}
	public int getFq_check() {
		return fq_check;
	}
	public void setFq_check(int fq_check) {
		this.fq_check = fq_check;
	}
	public int getFq_important() {
		return fq_important;
	}
	public void setFq_important(int fq_important) {
		this.fq_important = fq_important;
	}
	public int getFq_delete() {
		return fq_delete;
	}
	public void setFq_delete(int fq_delete) {
		this.fq_delete = fq_delete;
	}
	public String getFq_regdate() {
		return fq_regdate;
	}
	public void setFq_regdate(String fq_regdate) {
		this.fq_regdate = fq_regdate;
	}
	public String getFq_modidate() {
		return fq_modidate;
	}
	public void setFq_modidate(String fq_modidate) {
		this.fq_modidate = fq_modidate;
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