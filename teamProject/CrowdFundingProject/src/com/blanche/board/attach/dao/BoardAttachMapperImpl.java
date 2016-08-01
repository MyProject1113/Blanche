package com.blanche.board.attach.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.board.attach.vo.BoardAttachVO;

@Repository
public class BoardAttachMapperImpl implements BoardAttachMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<BoardAttachVO> attachList(BoardAttachVO param) {
		return session.selectList("attachList");
	}
	
	@Override
	public int attachInsert(BoardAttachVO param) {
		return session.insert("attachInsert");
	}
	
	@Override
	public int attachDelete(BoardAttachVO param) {
		return session.delete("attachDelete");
	}
}