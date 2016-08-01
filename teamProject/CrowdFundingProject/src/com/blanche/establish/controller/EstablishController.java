package com.blanche.establish.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blanche.establish.service.ApplicationService;
import com.blanche.establish.service.IntroductionService;
import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;
import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;
import com.blanche.common.page.Paging;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/establish")
public class EstablishController {
	Logger logger = Logger.getLogger(EstablishController.class);

	@Autowired
	private ApplicationService applicationService;	// 인터페이스 구현체 생성
	
	@Autowired
	private IntroductionService introductionService;
	
	/****************************************************************
	 * 글목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/notice.do")
	public String notice(Model model) {
		logger.info("notice 호출 성공");
		
		return "establish/notice";
	}

	/****************************************************************
	 * 개설 신청하기 폼 출력하기
	 ****************************************************************/
	@RequestMapping(value="/applicationForm.do")
	public String applicationForm() {
		logger.info("applicationForm 호출 성공");
		
		return "establish/applicationForm";
	}

	/****************************************************************
	 * 상세 내용 작성하기 폼 출력하기
	 ****************************************************************/
	@RequestMapping(value="/applicationDetailForm.do", method=RequestMethod.GET)
	public String applicationDetailForm(@RequestParam("app_index") int index, Model model) {
		logger.info("applicationDetailForm 호출 성공");
		
		ApplicationVO appDetail = new ApplicationVO();
		appDetail = applicationService.applicationDetail(index);
		
		model.addAttribute("applicationDetail", appDetail);
		
		return "establish/applicationDetailForm";
	}

	/****************************************************************
	 * 컨텐츠 상세 내용 출력하기
	 ****************************************************************/
	@RequestMapping(value="/contentDetail.do", method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute IntroductionVO ivo, PlannerVO pvo, DonationVO dvo, Model model) {
		logger.info("contentDetail 호출 성공");
		
		
		/* 프로젝트 소개 정보 */
		IntroductionVO introDetail = new IntroductionVO();
		introDetail = introductionService.introductionDetail(ivo);
		
		if (introDetail != null && (!introDetail.equals(""))) {
			introDetail.setIntro_details(introDetail.getIntro_details().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_synopsis(introDetail.getIntro_synopsis().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_plan(introDetail.getIntro_plan().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_purpose(introDetail.getIntro_purpose().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("introDetail", introDetail);
		
		/* 기획자 정보 */
		PlannerVO plannerDetail = new PlannerVO();
		plannerDetail = introductionService.plannerDetail(pvo);
		
		model.addAttribute("plannerDetail", plannerDetail);
		
		
		/* 기부현황 정보 */
		DonationVO donationDetail = new DonationVO();
		donationDetail = introductionService.donationDetail(dvo);
		
		model.addAttribute("donationDetail", donationDetail);
		
		
		return "establish/contentDetail";
	}
	
	/****************************************************************
	 * 댓글 내용 출력하기
	 ****************************************************************/
	@RequestMapping(value="/contentReply.do")
	public String contentReply() {
		logger.info("contentReply 호출 성공");
		
		return "establish/contentReply";
	}

	/********************************************
	 * 프로젝트 밀어주기 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/reward.do")
	public String reward() {
		logger.info("reward 호출 성공");
		
		return "redirect:/intro/reward.do";
	}
	
	/****************************************************************
	 * 개설신청 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationInsert.do", method=RequestMethod.POST)
	public String applicationInsert(@ModelAttribute ApplicationVO appvo, ApprovalVO approvo) {
		logger.info("applicationInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = applicationService.applicationInsert(appvo, approvo);
		if (result == 1) {
			url = "/establish/success.do";
		}
		
		return "redirect:" + url;
	}

	/********************************************
	 * 개설신청 성공 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/success.do")
	public String success() {
		logger.info("success 호출 성공");
		
		return "establish/success";
	}

	/****************************************************************
	 * 프로젝트 상세 쓰기 구현하기
	 ****************************************************************/
	@RequestMapping(value="/introductionInsert.do", method=RequestMethod.POST)
	public String introductionInsert(@ModelAttribute IntroductionVO ivo, PlannerVO pvo) {
		logger.info("introductionInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = introductionService.introductionInsert(ivo, pvo);
		if (result == 1) {
			url = "/establish/success.do";
		}
		
		return "redirect:" + url;
	}

	/********************************************
	 * 프로젝트 문의하기 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/inquire.do")
	public String inquire() {
		logger.info("inquire 호출 성공");
		
		return "redirect:";
	}

	/****************************************************************
	 * 관리자 프로젝트 승인 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationAdminList.do", method=RequestMethod.GET)
	public String applicationAdminList(@ModelAttribute ApplicationVO appvo, ApprovalVO approvo, Model model) { 
		logger.info("applicationAdminList 호출 성공");
		
		// 정렬에 대한 기본값 설정
		if (appvo.getOrder_by() == null) appvo.setOrder_by("app_index");
		if (appvo.getOrder_sc() == null) appvo.setOrder_sc("DESC");
		
		// 정렬에 대한 데이터 확인
		logger.info("order_by = " + appvo.getOrder_by());
		logger.info("order_sc = " + appvo.getOrder_sc());
		
		// 검색에 대한 데이터 확인
		logger.info("search = " + appvo.getSearch());
		logger.info("keyword = " + appvo.getKeyword());
		
		// 페이지 세팅
		Paging.setPage(appvo);
		
		// 전체 레코드수 구현
		int total = applicationService.applicationListCnt(appvo);
		logger.info("total = " + total);
		
		// 글번호 재설정
		
		List<ApplicationVO> applicationList = applicationService.applicationAdminList(appvo);
		model.addAttribute("applicationList", applicationList);
		
		/*List<ApprovalVO> approvalList = applicationService.approvalAdminList(approvo);
		model.addAttribute("approvalList", approvalList);*/
		
		model.addAttribute("total", total);
		model.addAttribute("data", appvo);
		
		return "establish/applicationAdminList";
	}
	
	
	

	/****************************************************************
	 * 글 상세 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationAdminDetail.do", method=RequestMethod.GET)
	public String applicationAdminDetail(@ModelAttribute ApplicationVO appvo, Model model) {
		logger.info("applicationAdminDetail 호출 성공");
		logger.info("app_index = " + appvo.getApp_index());
		
		ApplicationVO applicationDetail = new ApplicationVO();
		applicationDetail = applicationService.applicationAdminDetail(appvo);
		
		if (applicationDetail != null && (!applicationDetail.equals(""))) {
			applicationDetail.setApp_topic(applicationDetail.getApp_topic().toString().replaceAll("\n", "<br>"));
			applicationDetail.setAppro_note(applicationDetail.getAppro_note().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("applicationAdminDetail", applicationDetail);
		
		return "establish/applicationAdminDetail";
	}

	/****************************************************************
	 * 글 수정 구현하기
	 ****************************************************************/
	/*@RequestMapping(value="/applicationUpdate.do", method=RequestMethod.POST)
	public String applicationUpdate(@ModelAttribute ApprovalVO approvo) {
		logger.info("applicationUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = applicationService.approvalUpdate(approvo);
		if (result == 1) {
			url = "/establish/applicationAdminDetail.do?app_index=" + approvo.getApp_index();
		}
		
		return "redirect:" + url;
	}*/
	
	
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/approvalUpdate.do", method=RequestMethod.POST)
	public String approvalUpdate(@ModelAttribute ApprovalVO approvo) {
		logger.info("approvalUpdate 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = applicationService.approvalUpdate(approvo);
		logger.info("result = " + result);
		
		return result + "";
	}
	
	

	/****************************************************************
	 * 글 삭제 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationDelete.do", method=RequestMethod.POST)
	public String applicationDelete(@ModelAttribute ApplicationVO appvo) {
		logger.info("applicationDelete 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 담습니다. (1 or 0)
		int result = 0;
		String url = "";
		
		result = applicationService.applicationDelete(appvo.getApp_index());
		if (result == 1) {
			url = "/establish/applicationAdminList.do";
		}
		
		return "redirect:" + url;
	}
	
	
	

	/****************************************************************
	 * 프로젝트 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/projectAdminList.do", method=RequestMethod.GET)
	public String projectAdminList(@ModelAttribute IntroductionVO ivo, Model model) { 
		logger.info("projectAdminList 호출 성공");
		
		// 정렬에 대한 기본값 설정
		if (ivo.getOrder_by() == null) ivo.setOrder_by("intro_index");
		if (ivo.getOrder_sc() == null) ivo.setOrder_sc("DESC");
		
		// 정렬에 대한 데이터 확인
		logger.info("order_by = " + ivo.getOrder_by());
		logger.info("order_sc = " + ivo.getOrder_sc());
		
		// 검색에 대한 데이터 확인
		logger.info("search = " + ivo.getSearch());
		logger.info("keyword = " + ivo.getKeyword());
		
		// 페이지 세팅
		/*Paging.setPage(ivo);*/
		
		// 전체 레코드수 구현
		//int total = applicationService.applicationListCnt(ivo);
		//logger.info("total = " + total);
		
		// 글번호 재설정
		
		List<IntroductionVO> projectList = introductionService.projectAdminList(ivo);
		model.addAttribute("projectList", projectList);
		//model.addAttribute("total", total);
		model.addAttribute("data", ivo);
		
		return "establish/projectAdminList";
	}
	
	
	

	/****************************************************************
	 * 프로젝트 수정/삭제 요청 확인 구현하기
	 ****************************************************************/
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/projectApprovalUpdate.do", method=RequestMethod.POST)
	public String projectApprovalUpdate(@ModelAttribute IntroApprovalVO intappvo) {
		logger.info("projectApprovalUpdate 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = introductionService.projectApprovalUpdate(intappvo);
		logger.info("result = " + result);
		
		return result + "";
	}
	
	


	/****************************************************************
	 * MyPage 승인 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationMyPage.do", method=RequestMethod.GET)
	public String applicationMyPage(@ModelAttribute ApplicationVO appvo, Model model) { 
		logger.info("applicationMyPage 호출 성공");
		
		
		List<ApplicationVO> applicationList = applicationService.applicationMyPageList(appvo);
		model.addAttribute("applicationList", applicationList);
		model.addAttribute("data", appvo);
		
		
		
		return "establish/applicationMyPage";
	}
	
	


	/****************************************************************
	 * MyPage 프로젝트 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/projectMyPage.do", method=RequestMethod.GET)
	public String projectMyPage(@RequestParam("us_index") int us_index, @ModelAttribute IntroductionVO ivo, Model model) { 
		logger.info("projectMyPage 호출 성공");
		
		
		
		List<IntroductionVO> projectList = introductionService.projectMyPageList(us_index);
		model.addAttribute("projectList", projectList);
		model.addAttribute("data", ivo);
		
		return "establish/projectMyPage";
	}
	
	
}
