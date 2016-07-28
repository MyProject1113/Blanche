package com.blanche.establish.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.IntroductionVO;

@Repository
public class IntroductionDaoImpl implements IntroductionDao {
	@Autowired
	private SqlSession session;
	
	// 프로젝트 소개 입력 구현
	@Override
	public int introductionInsert(IntroductionVO ivo) {
		return session.insert("introductionInsert", ivo);
	}
}
