package com.blanche.notice.attach.dao;

import java.util.List;

import com.blanche.notice.attach.vo.NoticeAttachVO;

public interface NoticeAttachMapper {
	public List<NoticeAttachVO> attachList(NoticeAttachVO param);
	public int attachInsert(NoticeAttachVO param);
	public int attachDelete(NoticeAttachVO param);
}