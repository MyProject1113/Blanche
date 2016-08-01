package com.blanche.notice.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.notice.main.dao.NoticeMainMapper;
import com.blanche.notice.main.vo.NoticeMainVO;

@Service
@Transactional
public class NoticeMainServiceImpl implements NoticeMainService {
	@Autowired
	private NoticeMainMapper noticeMainMapper;
	
	@Override
	public List<NoticeMainVO> noticeList(NoticeMainVO param) {
		return noticeMainMapper.noticeList(param);
	}
	
	@Override
	public NoticeMainVO noticeDetail(NoticeMainVO param) {
		return noticeMainMapper.noticeDetail(param);
	}
	
	@Override
	public int noticeCheck(NoticeMainVO param) {
		return noticeMainMapper.noticeCheck(param);
	}
	
	@Override
	public int noticeInsert(NoticeMainVO param) {
		return noticeMainMapper.noticeInsert(param);
	}
	
	@Override
	public int noticeUpdate(NoticeMainVO param) {
		return noticeMainMapper.noticeUpdate(param);
	}
	
	@Override
	public int noticeDelete(NoticeMainVO param) {
		return noticeMainMapper.noticeDelete(param);
	}
	
	@Override
	public int noticeListCount(NoticeMainVO param) {
		return noticeMainMapper.noticeListCount(param);
	}
}