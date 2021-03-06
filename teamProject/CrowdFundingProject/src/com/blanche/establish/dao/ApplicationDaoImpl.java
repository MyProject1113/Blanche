package com.blanche.establish.dao;

import java.util.List;

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

	// 개설신청 목록 구현
	@Override
	public List<ApplicationVO> applicationAdminList(ApplicationVO appvo) {
		return session.selectList("applicationAdminList");
	}

	// 승인 목록 구현
	@Override
	public List<ApprovalVO> approvalAdminList(ApprovalVO approvo) {
		return session.selectList("approvalAdminList");
	}

	// 전체 레코드 건수 구현
	@Override
	public int applicationListCnt(ApplicationVO appvo) {
		return (Integer)session.selectOne("applicationListCnt");
	}
	
	
	

	// 글상세 구현
	@Override
	public ApplicationVO applicationAdminDetail(ApplicationVO appvo) {
		return (ApplicationVO)session.selectOne("applicationAdminDetail");
	}

	// 글수정 구현
	@Override
	public int approvalUpdate(ApprovalVO approvo) {
		return session.update("approvalUpdate");
	}
	
	// 개설승인 삭제 구현
	@Override
	public int approvalDelete(int app_index) {
		return session.delete("approvalDelete");
	}

	// 개설신청 삭제 구현
	@Override
	public int applicationDelete(int app_index) {
		return session.delete("applicationDelete");
	}
	
	

	// MyPage 글목록 구현
	@Override
	public List<ApplicationVO> applicationMyPageList(ApplicationVO appvo) {
		return session.selectList("applicationMyPageList");
	}
	
	@Override
	public ApprovalVO userProgressAppro(int us_index) {
		return (ApprovalVO)session.selectOne("userProgressAppro");
	}
}
