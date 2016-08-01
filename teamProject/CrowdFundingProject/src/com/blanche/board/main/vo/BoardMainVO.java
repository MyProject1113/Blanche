package com.blanche.board.main.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.blanche.board.common.vo.DefaultVO;

public class BoardMainVO extends DefaultVO {
	private int 	bd_index		= 0;		// 본문일련번호
	private int 	bdinf_index		= 0;		// 목록일련번호
	private int 	us_index		= 0;		// 회원일련번호
	private String 	bd_title		= "";		// 제목
	private String 	bd_content		= "";		// 내용
	private int 	bd_root			= 0;		// 답변원본
	private int 	bd_parent		= 0;		// 답변부모
	private int 	bd_step			= 0;		// 답변계층
	private int 	bd_indent		= 0;		// 답변위치
	private int 	bd_check		= 0;		// 조회수
	private int 	bd_delete		= 0;		// 삭제여부
	private String 	bd_regdate		= "";		// 등록일
	private String 	bd_modidate		= "";		// 수정일
	
	private int 	num				= 0;		// 글번호
	private String	boardTitle		= "";		// 게시판이름
	private String	boardUri		= "";		// 게시판식별자
	private int		boardType		= 0;		// 게시판종류
	private int		parent		= 0;		// 부모글 일련번호
	private int		replyCount	= 0;		// 답변 개수
	private int		commentCount	= 0;		// 댓글 개수
	private int		pictureCount	= 0;		// 그림파일 개수
	private int		attachCount		= 0;		// 첨부파일 개수
	
	private List<MultipartFile> attachUpload	= null;	// 첨부파일 전송
	private List<Integer> attachDelete			= null;	// 첨부파일 삭제
	
	public int getBd_index() {
		return bd_index;
	}
	public void setBd_index(int bd_index) {
		this.bd_index = bd_index;
	}
	public int getBdinf_index() {
		return bdinf_index;
	}
	public void setBdinf_index(int bdinf_index) {
		this.bdinf_index = bdinf_index;
	}
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title.trim();
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content.trim();
	}
	public int getBd_root() {
		return bd_root;
	}
	public void setBd_root(int bd_root) {
		this.bd_root = bd_root;
	}
	public int getBd_parent() {
		return bd_parent;
	}
	public void setBd_parent(int bd_parent) {
		this.bd_parent = bd_parent;
	}
	public int getBd_step() {
		return bd_step;
	}
	public void setBd_step(int bd_step) {
		this.bd_step = bd_step;
	}
	public int getBd_indent() {
		return bd_indent;
	}
	public void setBd_indent(int bd_indent) {
		this.bd_indent = bd_indent;
	}
	public int getBd_check() {
		return bd_check;
	}
	public void setBd_check(int bd_check) {
		this.bd_check = bd_check;
	}
	public int getBd_delete() {
		return bd_delete;
	}
	public void setBd_delete(int bd_delete) {
		this.bd_delete = bd_delete;
	}
	public String getBd_regdate() {
		return bd_regdate;
	}
	public void setBd_regdate(String bd_regdate) {
		this.bd_regdate = bd_regdate.trim();
	}
	public String getBd_modidate() {
		return bd_modidate;
	}
	public void setBd_modidate(String bd_modidate) {
		this.bd_modidate = bd_modidate.trim();
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardUri() {
		return boardUri;
	}
	public void setBoardUri(String boardUri) {
		this.boardUri = boardUri;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
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