package com.blanche.notice.attach.service;

import java.util.List;

import com.blanche.notice.attach.vo.NoticeAttachVO;

public interface NoticeAttachService {
	public List<NoticeAttachVO> attachList(NoticeAttachVO param);
	public int attachInsert(NoticeAttachVO param);
	public int attachDelete(NoticeAttachVO Param);
}