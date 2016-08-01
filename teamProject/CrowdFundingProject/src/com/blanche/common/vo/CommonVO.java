package com.blanche.common.vo;

public class CommonVO {
	private String page;		// 페이지 번호
	private String pageSize;	// 페이지에 보여주는 줄 수
	private String start_row;	// 시작 레코드 번호
	private String end_row;	// 종료 레코드 번호
	
	// 조건 검색시 사용할 속성
	private String search = "";
	private String keyword = "";
	
	// 제목 클릭시 정렬을 위한 속성
	private String order_by;
	private String order_sc;
	
	public String getPage() {
		return page;
	}
	
	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getStart_row() {
		return start_row;
	}

	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}

	public String getEnd_row() {
		return end_row;
	}

	public void setEnd_row(String end_row) {
		this.end_row = end_row;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOrder_by() {
		return order_by;
	}

	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}

	public String getOrder_sc() {
		return order_sc;
	}

	public void setOrder_sc(String order_sc) {
		this.order_sc = order_sc;
	}
}
