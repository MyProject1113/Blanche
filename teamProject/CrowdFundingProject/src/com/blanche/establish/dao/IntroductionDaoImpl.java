package com.blanche.establish.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;

@Repository
public class IntroductionDaoImpl implements IntroductionDao {
	@Autowired
	private SqlSession session;
	
	// 프로젝트 소개 입력 구현
	@Override
	public int introductionInsert(IntroductionVO ivo) {
		return session.insert("introductionInsert", ivo);
	}
	
	// 기획자 정보 입력 구현
	@Override
	public int plannerInsert(PlannerVO pvo) {
		return session.insert("plannerInsert", pvo);
	}

	// 프로젝트 소개 상세 구현
	@Override
	public IntroductionVO introductionDetail(IntroductionVO ivo) {
		return (IntroductionVO)session.selectOne("introductionDetail");
	}

	// 기획자 정보 상세 구현
	@Override
	public PlannerVO plannerDetail(PlannerVO pvo) {
		return (PlannerVO)session.selectOne("plannerDetail");
	}

	// 기부현황 상세 구현
	@Override
	public DonationVO donationDetail(DonationVO dvo) {
		return (DonationVO)session.selectOne("donationDetail");
	}
	
	
	

	
	
	@Override
	public String usermainEmail(int index) {
		return (String)session.selectOne("usermainEmail");
	}
	
	

	// 글목록 구현
	@Override
	public List<IntroductionVO> projectAdminList(IntroductionVO ivo) {
		return session.selectList("projectAdminList");
	}

	// 글수정 구현
	@Override
	public int projectApprovalUpdate(IntroApprovalVO intappvo) {
		return session.update("projectApprovalUpdate");
	}
	
	

	

	// MyPage 글목록 구현
	@Override
	public List<IntroductionVO> projectMyPageList(int us_index) {
		return session.selectList("projectMyPageList");
	}
}
