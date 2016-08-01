package com.blanche.notice.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.notice.main.vo.NoticeMainVO;

@Repository
public class NoticeMainMapperImpl implements NoticeMainMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeMainVO> noticeList(NoticeMainVO param) {
		return session.selectList("noticeList");
	}
	
	@Override
	public NoticeMainVO noticeDetail(NoticeMainVO param) {
		return session.selectOne("noticeDetail");
	}
	
	@Override
	public int noticeCheck(NoticeMainVO param) {
		return session.update("noticeCheck");
	}
	
	@Override
	public int noticeInsert(NoticeMainVO param) {
		return session.insert("noticeInsert");
	}
	
	@Override
	public int noticeUpdate(NoticeMainVO param) {
		return session.update("noticeUpdate");
	}
	
	@Override
	public int noticeDelete(NoticeMainVO param) {
		return session.update("noticeDelete");
	}
	
	@Override
	public int noticeListCount(NoticeMainVO param) {
		return session.update("noticeListCount");
	}
}