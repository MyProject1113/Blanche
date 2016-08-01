package com.blanche.notice.attach.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.notice.attach.vo.NoticeAttachVO;

@Repository
public class NoticeAttachMapperImpl implements NoticeAttachMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeAttachVO> attachList(NoticeAttachVO param) {
		return session.selectList("attachList");
	}
	
	@Override
	public int attachInsert(NoticeAttachVO param) {
		return session.insert("attachInsert");
	}
	
	@Override
	public int attachDelete(NoticeAttachVO param) {
		return session.delete("attachDelete");
	}
}