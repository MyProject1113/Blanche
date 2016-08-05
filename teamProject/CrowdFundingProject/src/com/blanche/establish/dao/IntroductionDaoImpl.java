package com.blanche.establish.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;
import com.blanche.establish.vo.ProjectListVO;
import com.blanche.establish.vo.ReplyVO;

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

	// 프로젝트 승인 입력 구현
	@Override
	public int introApprovalInsert(IntroApprovalVO intappvo) {
		return session.insert("introApprovalInsert", intappvo);
	}
	
	// 프로젝트 소개 상세 구현
	@Override
	//public IntroductionVO introductionDetail(IntroductionVO ivo) {
	public IntroductionVO introductionDetail(int intro_index) {
		return (IntroductionVO)session.selectOne("introductionDetail");
	}

	// 기획자 정보 상세 구현
	@Override
	//public PlannerVO plannerDetail(PlannerVO pvo) {
	public PlannerVO plannerDetail(int intro_index) {
		return (PlannerVO)session.selectOne("plannerDetail");
	}

	// 기부현황 상세 구현
	@Override
	//public DonationVO donationDetail(DonationVO dvo) {
	public DonationVO donationDetail(int intro_index) {
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
	
	@Override
	public IntroApprovalVO userProgressIntAppro(int us_index) {
		return (IntroApprovalVO)session.selectOne("userProgressIntAppro");
	}
	
	//
	@Override
	public int getIntroIndex(int app_index) {
		return (int)session.selectOne("getIntroIndex");
	}

	// 전체 레코드 건수 구현
	@Override
	public int projectListCnt(IntroductionVO ivo) {
		return (Integer)session.selectOne("projectListCnt");
	}

	// 회원 프로젝트 수정/삭제 요청
	@Override
	public int projectApprovalRequest(IntroApprovalVO intappvo) {
		return session.update("projectApprovalRequest");
	}

	@Override
	public List<ProjectListVO> projectContentList(String app_field) {
		return session.selectList("projectContentList");
	}

	//
	@Override
	public int sponserCount(int intro_index) {
		return session.update("sponserCount");
	}

	@Override
	public List<ProjectListVO> projectAllContentList(String app_field) {
		return session.selectList("projectAllContentList");
	}

	@Override
	public ApplicationVO getFundNField(int intro_index) {
		return (ApplicationVO)session.selectOne("getFundNField");
	}

	@Override
	public List<Integer> introdutionCount(String app_field) {
		return session.selectList("introdutionCount");
	}

	@Override
	public ProjectListVO lookRoundContentList(int intro_index) {
		return (ProjectListVO)session.selectOne("lookRoundContentList");
	}

	@Override
	public ProjectListVO noOneContentList(int intro_index) {
		return (ProjectListVO)session.selectOne("noOneContentList");
	}

	@Override
	public int introductionModifyUpdate(IntroductionVO introDetail) {
		return session.update("introductionModifyUpdate");
	}

	@Override
	public int plannerModifyUpdate(PlannerVO plannerDetail) {
		return session.update("plannerModifyUpdate");
	}

	@Override
	public DonationVO donationNoOnDetail(int intro_index) {
		return (DonationVO)session.selectOne("donationNoOnDetail");
	}

	@Override
	public List<Integer> introdutionAllCount(String app_field) {
		return session.selectList("introdutionAllCount");
	}

	@Override
	public IntroductionVO projectDateCheck(int intro_index) {
		return (IntroductionVO)session.selectOne("projectDateCheck");
	}

	@Override
	public List<ReplyVO> replyDetail(int intro_index) {
		return session.selectList("replyDetail");
	}

	@Override
	public int replyInsert(ReplyVO rvo) {
		return session.insert("replyInsert", rvo);
	}

	@Override
	public int replySponser(ReplyVO rvo) {
		return (int)session.selectOne("replySponser");
	}
}
