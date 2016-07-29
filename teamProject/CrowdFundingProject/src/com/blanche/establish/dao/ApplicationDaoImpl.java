package com.blanche.establish.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {
	@Autowired
	private SqlSession session;
	
	// 개설신청 입력 구현
	@Override
	public int applicationInsert(ApplicationVO appvo) {
		return session.insert("applicationInsert", appvo);
	}
	
	// 승인 입력 구현
	@Override
	public int approvalInsert(ApprovalVO approvo) {
		return session.insert("approvalInsert", approvo);
	}

	// 글상세 구현
	@Override
	public ApplicationVO applicationDetail(Integer app_index) {
		return (ApplicationVO)session.selectOne("applicationDetail");
	}
}
