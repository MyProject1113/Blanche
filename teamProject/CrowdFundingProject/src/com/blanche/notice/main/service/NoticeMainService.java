package com.blanche.notice.main.service;

import java.util.List;

import com.blanche.notice.main.vo.NoticeMainVO;

public interface NoticeMainService {
	public List<NoticeMainVO> noticeList(NoticeMainVO param);
	public NoticeMainVO noticeDetail(NoticeMainVO param);
	public int noticeCheck(NoticeMainVO param);
	public int noticeInsert(NoticeMainVO param);
	public int noticeUpdate(NoticeMainVO param);
	public int noticeDelete(NoticeMainVO param);
	public int noticeListCount(NoticeMainVO param);
}