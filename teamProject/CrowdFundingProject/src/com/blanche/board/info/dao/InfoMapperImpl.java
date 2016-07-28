package com.blanche.board.info.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.board.info.vo.BoardInfoVO;

@Repository
public class InfoMapperImpl implements InfoMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public BoardInfoVO infoDetail(BoardInfoVO param) {
		return (BoardInfoVO) session.selectOne("infoDetail");
	}
	
	@Override
	public int infoInsert(BoardInfoVO param) {
		return session.selectOne("infoInsert");
	}
}