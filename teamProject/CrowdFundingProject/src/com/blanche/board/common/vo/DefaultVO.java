package com.blanche.board.common.vo;

public class DefaultVO {
	private String	id				= "";		// 아이디
	private String	nickname		= "";		// 별칭
	private int		writable		= 0;	// 작성가능여부
	private int		editable		= 0;	// 수정가능여부
	private int		deletable		= 0;	// 삭제가능여부
	
	private String	search			= "";		// 검색방법
	private String	keyword			= "";		// 검색단어
	private int		page			= 1;		// 페이지
	private int		pageSize		= 5;		// 페이지 크기
	private int		pageCount		= 1;		// 페이지 개수
	private int		pageSpare		= 3;		// 페이지 표시여분
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getWritable() {
		return writable;
	}
	public void setWritable(int writable) {
		this.writable = writable;
	}
	public int getEditable() {
		return editable;
	}
	public void setEditable(int editable) {
		this.editable = editable;
	}
	public int getDeletable() {
		return deletable;
	}
	public void setDeletable(int deletable) {
		this.deletable = deletable;
	}
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search.trim();
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword.trim();
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