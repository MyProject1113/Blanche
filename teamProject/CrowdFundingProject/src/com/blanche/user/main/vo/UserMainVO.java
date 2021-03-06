package com.blanche.user.main.vo;

import com.blanche.user.common.util.EncryptionUtil;

public class UserMainVO {
	private int		us_index			= 0;	// 회원일련번호
	private String	us_email			= "";	// 이메일
	private String	us_password	= "";	// 비밀번호
	private String	us_name			= "";	// 이름
	private String	us_nickname	= "";	// 별칭
	private int		us_rank			= 0;	// 등급
	private String	us_phone		= "";	// 연락처
	private String	us_joindate		= "";	// 가입일
	private String	us_modidate1	= "";	// 회원정보변경일
	private String	us_modidate2	= "";	// 비밀번호변경일
	
	private String	agreeDate1		= "";	// 개인정보이용약관 동의일
	private String	agreeDate2		= "";	// 홈페이지이용약관 동의일
	private String remainCookie		= ""; // iD 저장
	private int		accreditState 	= 0;	// 인증 상태
	private String accessIP		= "";	// 마지막 접속 IP
	private String accessDate		= "";	// 마지막 접속 시간
	
	private String	method			= "";		// 검색방법
	private String	keyword			= "";		// 검색단어
	private int		page			= 1;		// 페이지
	private int		pageSize		= 20;		// 페이지 크기
	private int		pageCount		= 1;		// 페이지 개수
	private int		pageSpare		= 3;		// 페이지 표시여분
	private String	orderBy			= "us_index";	// 정렬 컬럼
	private String orderSc			= "DESC";		// 정렬 방식 
	
	public int getUs_index() {
		return us_index;
	}
	public void setUs_index(int us_index) {
		this.us_index = us_index;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_password() {
		return us_password;
	}
	public void setUs_password(String us_password) {
		this.us_password = EncryptionUtil.getSHA256(us_password);
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_nickname() {
		return us_nickname;
	}
	public void setUs_nickname(String us_nickname) {
		this.us_nickname = us_nickname;
	}
	public int getUs_rank() {
		return us_rank;
	}
	public void setUs_rank(int us_rank) {
		this.us_rank = us_rank;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public String getUs_joindate() {
		return us_joindate;
	}
	public void setUs_joindate(String us_joindate) {
		this.us_joindate = us_joindate;
	}
	public String getUs_modidate1() {
		return us_modidate1;
	}
	public void setUs_modidate1(String us_modidate1) {
		this.us_modidate1 = us_modidate1;
	}
	public String getUs_modidate2() {
		return us_modidate2;
	}
	public void setUs_modidate2(String us_modidate2) {
		this.us_modidate2 = us_modidate2;
	}
	public String getRemainCookie() {
		return remainCookie;
	}
	public void setRemainCookie(String remainCookie) {
		this.remainCookie = remainCookie;
	}
	public String getAgreeDate1() {
		return agreeDate1;
	}
	public void setAgreeDate1(String agreeDate1) {
		this.agreeDate1 = agreeDate1;
	}
	public String getAgreeDate2() {
		return agreeDate2;
	}
	public void setAgreeDate2(String agreeDate2) {
		this.agreeDate2 = agreeDate2;
	}

	public int getAccreditState() {
		return accreditState;
	}
	public void setAccreditState(int accreditState) {
		this.accreditState = accreditState;
	}
	public String getAccessIP() {
		return accessIP;
	}
	public void setAccessIP(String accessIP) {
		this.accessIP = accessIP;
	}
	public String getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
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
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrderSc() {
		return orderSc;
	}
	public void setOrderSc(String orderSc) {
		this.orderSc = orderSc;
	}
}