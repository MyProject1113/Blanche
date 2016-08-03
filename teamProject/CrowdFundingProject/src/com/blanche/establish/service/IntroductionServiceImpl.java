package com.blanche.establish.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.establish.dao.IntroductionDao;
import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;
import com.blanche.establish.vo.ProjectListVO;

@Service
@Transactional
public class IntroductionServiceImpl implements IntroductionService {
	Logger logger = Logger.getLogger(IntroductionServiceImpl.class);
	
	@Autowired
	private IntroductionDao introductionDao;
	
	// 프로젝트 소개, 기획자 정보 입력 구현
	@Override
	public int introductionInsert(IntroductionVO ivo, PlannerVO pvo, IntroApprovalVO intappvo) {
		int result = 0, result1 = 0, result2 = 0, result3 = 0;

		result1 = introductionDao.introductionInsert(ivo);	// 프로젝트 소개
		result2 = introductionDao.plannerInsert(pvo);	// 기획자 정보
		result3 = introductionDao.introApprovalInsert(intappvo);	// 프로젝트 승인

		if ((result1 == 1) && (result2 == 1) && (result3 == 1))
			result = 1;
		
		return result;
	}
	
	// 프로젝트 소개 상세 구현
	@Override
	//public IntroductionVO introductionDetail(IntroductionVO ivo) {
	public IntroductionVO introductionDetail(int intro_index) {
		IntroductionVO detail = null;
		//detail = introductionDao.introductionDetail(ivo);
		detail = introductionDao.introductionDetail(intro_index);
		return detail;
	}
	
	// 기획자 정보 상세 구현
	@Override
	//public PlannerVO plannerDetail(PlannerVO pvo) {
	public PlannerVO plannerDetail(int intro_index) {
		PlannerVO detail = null;
		//detail = introductionDao.plannerDetail(pvo);
		detail = introductionDao.plannerDetail(intro_index);
		return detail;
	}

	// 기부현황 상세 구현
	@Override
	//public DonationVO donationDetail(DonationVO dvo) {
	public DonationVO donationDetail(int intro_index) {
		DonationVO detail = null;
		//detail = introductionDao.donationDetail(dvo);
		detail = introductionDao.donationDetail(intro_index);
		return detail;
	}
	
	
	
	
	

	@Override
	public String usermainEmail(int index) {
		String email = "";
		email = introductionDao.usermainEmail(index);
		return email;
	}
	
	
	// 글목록 구현
	@Override
	public List<IntroductionVO> projectAdminList(IntroductionVO ivo) {
		List<IntroductionVO> myList = null;
		myList = introductionDao.projectAdminList(ivo);
		return myList;
	}

	// 글수정 구현
	@Override
	public int projectApprovalUpdate(IntroApprovalVO intappvo) {
		int result = 0;
		result = introductionDao.projectApprovalUpdate(intappvo);
		return result;
	}
	
	
	// MyPage 글목록 구현
	@Override
	public List<IntroductionVO> projectMyPageList(int us_index) {
		List<IntroductionVO> myList = null;
		myList = introductionDao.projectMyPageList(us_index);
		return myList;
	}
	
	//
	@Override
	public IntroApprovalVO userProgressIntAppro(int us_index) {
		IntroApprovalVO detail = null;
		detail = introductionDao.userProgressIntAppro(us_index);
		return detail;
	}
	
	//
	@Override
	public int getIntroIndex(int app_index) {
		int result = 0;
		result = introductionDao.getIntroIndex(app_index);
		return result;
	}
	

	// 전체 레코드 수 구현
	@Override
	public int projectListCnt(IntroductionVO ivo) {
		return introductionDao.projectListCnt(ivo);
	}

	// 회원 프로젝트 수정/삭제 요청
	@Override
	public int projectApprovalRequest(IntroApprovalVO intappvo) {
		int result = 0;
		result = introductionDao.projectApprovalRequest(intappvo);
		return result;
	}

	@Override
	public List<ProjectListVO> projectContentList(String app_field) {
		List<ProjectListVO> myList = null;
		myList = introductionDao.projectContentList(app_field);
		return myList;
	}

	//
	@Override
	public int sponserCount() {
		int result = 0;
		result = introductionDao.sponserCount();
		return result;
	}

	@Override
	public List<ProjectListVO> projectAllContentList(String app_field) {
		List<ProjectListVO> myList = null;
		myList = introductionDao.projectAllContentList(app_field);
		return myList;
	}

	@Override
	public ApplicationVO getFundNField(int intro_index) {
		ApplicationVO detail = null;
		detail = introductionDao.getFundNField(intro_index);
		return detail;
	}
}
