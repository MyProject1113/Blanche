package com.blanche.establish.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.blanche.establish.vo.ProjectListVO;
import com.blanche.establish.vo.ReplyVO;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;
import com.blanche.board.info.service.BoardInfoService;
import com.blanche.board.info.vo.BoardInfoVO;
import com.blanche.common.file.FileUploadUtil;
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

	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private BoardInfoService boardInfoService;
	
	/****************************************************************
	 * 회원 진행 상태 확인
	 ****************************************************************/
	/*@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/userProgressCheck.do", method=RequestMethod.GET)*/
	@RequestMapping(value="/userProgressCheck.do")
	public String userProgressCheck(HttpServletRequest request) {
		logger.info("userProgressCheck 호출 성공");

		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		//int result = 0;
		int appro_check = 0, intapp_check = 0;
		
		// 회원 등급 가져오기
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			userData = userMainService.userData(userData);
			logger.info("회원번호 : " + userData.getUs_index() + ", 등급 : " + userData.getUs_rank());
			
			//if (userData.getUs_rank() == 0) {
				ApprovalVO appro = applicationService.userProgressAppro(userData.getUs_index());	// 개설 승인 테이블에서 승인여부(appro_check) 가져오기
				
				if (appro != null) {
					appro_check = appro.getAppro_check();
					logger.info("appro_check : " + appro_check);
					
					// 0:심사 중, 1:기각, 2:승인, 3:완료
					if (appro_check == 0) {
						logger.info("개설 신청 중 => 진행중인 프로젝트가 있습니다.");
						
						return "redirect:/establish/warning.do?msg=1";
						
					} else if (appro_check == 2) {
						logger.info("개설 신청 완료");
						
						IntroApprovalVO intAppro = introductionService.userProgressIntAppro(userData.getUs_index());	// 프로젝트 승인 테이블에서 승인여부(intapp_check) 가져오기
						if (intAppro != null) {
							intapp_check = intAppro.getIntapp_check();
							logger.info("intapp_check : " + intapp_check);
							
							// 0:진행중, 1:수정요청, 2:수정승인, 3:삭제요청, 4:기간만료
							if (intapp_check < 4) {
								logger.info("프로젝트 진행중");
								return "redirect:/establish/warning.do?msg=2";
								
							} else {
								logger.info("프로젝트 기간만료 됨");
							}
							
						} else {
							logger.info("해당되는 프로젝트 없음!!!");

							logger.info("app_index : " + appro.getApp_index());
							
							return "redirect:/establish/applicationDetailForm.do?app_index=" + appro.getApp_index();
						}
					}
				} else {
					logger.info("해당되는 회원 없음!!!");
				}
			//}
			
		} else {
			logger.info("로그인이 안된 상태");
		}
		
		//logger.info("result = " + result);
		
		return "establish/notice";
	}

	/****************************************************************
	 * 경고 페이지 이동하기
	 ****************************************************************/
	@RequestMapping(value="/warning.do", method=RequestMethod.GET)
	public String warning(@RequestParam("msg") int msg, Model model) {
		logger.info("warning 호출 성공");
		
		logger.info("warning msg : " + msg);
		
		model.addAttribute("warningMsg", msg);
		
		return "establish/warning";
	}

	
	
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
	public String applicationForm(HttpServletRequest request, Model model) {
		logger.info("applicationForm 호출 성공");
		
		// 회원번호 가져오기
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			logger.info("회원번호 : " + userData.getUs_index());
		}

		model.addAttribute("us_index", userData.getUs_index());
		
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
	/*public String contentDetail(@ModelAttribute IntroductionVO ivo, PlannerVO pvo, DonationVO dvo, Model model) {*/
	public String contentDetail(@RequestParam("intro_index") int intro_index, Model model) {
		logger.info("contentDetail 호출 성공");
		
		
		/* 프로젝트 소개 정보 */
		IntroductionVO introDetail = new IntroductionVO();
		//introDetail = introductionService.introductionDetail(ivo);
		introDetail = introductionService.introductionDetail(intro_index);
		
		/*if (introDetail != null && (!introDetail.equals(""))) {
			introDetail.setIntro_details(introDetail.getIntro_details().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_synopsis(introDetail.getIntro_synopsis().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_plan(introDetail.getIntro_plan().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_purpose(introDetail.getIntro_purpose().toString().replaceAll("\n", "<br>"));
		}*/
		
		model.addAttribute("introDetail", introDetail);
		
		/* 기획자 정보 */
		PlannerVO plannerDetail = new PlannerVO();
		//plannerDetail = introductionService.plannerDetail(pvo);
		plannerDetail = introductionService.plannerDetail(intro_index);
		
		model.addAttribute("plannerDetail", plannerDetail);
		
		
		/* 기부현황 정보 */
		DonationVO donationDetail = new DonationVO();
		//donationDetail = introductionService.donationDetail(dvo);
		donationDetail = introductionService.donationDetail(intro_index);
		
		if (donationDetail == null) {
			donationDetail = introductionService.donationNoOnDetail(intro_index);
		}
		
		model.addAttribute("donationDetail", donationDetail);

		// 프로젝트 날짜 체크
		//introDetail = introductionService.projectDateCheck(intro_index);
		
		return "establish/contentDetail";
	}
	
	/****************************************************************
	 * 댓글 내용 출력하기
	 ****************************************************************/
	@RequestMapping(value="/contentReply.do", method=RequestMethod.GET)
	public String contentReply(@RequestParam("intro_index") int intro_index, Model model, HttpServletRequest request) {
		logger.info("contentReply 호출 성공");
		
		int count = 0;
		String us_name = "";
		
		/* 프로젝트 소개 정보 */
		IntroductionVO introDetail = new IntroductionVO();
		introDetail = introductionService.introductionDetail(intro_index);
		
		model.addAttribute("introDetail", introDetail);
		
		/* 기획자 정보 */
		PlannerVO plannerDetail = new PlannerVO();
		plannerDetail = introductionService.plannerDetail(intro_index);
		
		model.addAttribute("plannerDetail", plannerDetail);
		
		
		/* 기부현황 정보 */
		DonationVO donationDetail = new DonationVO();
		donationDetail = introductionService.donationDetail(intro_index);
		
		if (donationDetail == null) {
			donationDetail = introductionService.donationNoOnDetail(intro_index);
		}
		
		model.addAttribute("donationDetail", donationDetail);

		/* 댓글 목록 */
		List<ReplyVO> replyDetail = introductionService.replyDetail(intro_index);
		
		model.addAttribute("replyDetail", replyDetail);
		
		

		// 회원번호 가져오기
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			userData = userMainService.userData(userData);
			logger.info("회원번호 : " + userData.getUs_index() + ", 회원이름 : " + userData.getUs_name());
			
			ReplyVO rvo = new ReplyVO();
			rvo.setIntro_index(intro_index);
			rvo.setUs_index(userData.getUs_index());
			count = introductionService.replySponser(rvo);
			
			us_name = userData.getUs_name();
		}
		
		model.addAttribute("sponserCheck", count);
		model.addAttribute("us_name", us_name);
		
		return "establish/contentReply";
	}

	/****************************************************************
	 * 댓글 쓰기
	 ****************************************************************/
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/replyInsert.do", method=RequestMethod.POST)
	public String replyInsert(@ModelAttribute ReplyVO rvo) {
		logger.info("replyInsert 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = introductionService.replyInsert(rvo);
		logger.info("result = " + result);
		
		return result + "";
	}
	
	/********************************************
	 * 프로젝트 밀어주기 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/reward.do", method=RequestMethod.GET)
	public String reward(@RequestParam("intro_index") int intro_index) {
		logger.info("reward 호출 성공");
		
		logger.info("intro_index : " + intro_index);
		
		return "redirect:/intro/reward.do?intro_index=" + intro_index;
	}
	
	/****************************************************************
	 * 개설신청 구현하기
	 ****************************************************************/
	@RequestMapping(value="/applicationInsert.do", method=RequestMethod.POST)
	public String applicationInsert(@ModelAttribute ApplicationVO appvo, ApprovalVO approvo, HttpServletRequest request) {
		logger.info("applicationInsert 호출 성공");
		
		int result = 0;

		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			userData = userMainService.userData(userData);
			logger.info("회원번호 : " + userData.getUs_index() + ", 등급 : " + userData.getUs_rank());
		
			result = applicationService.applicationInsert(appvo, approvo);
		}
		return "redirect:/establish/success.do?result=" + result;
	}

	/********************************************
	 * 개설신청 성공 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/success.do", method=RequestMethod.GET)
	public String success(@RequestParam("result") int result, Model model) {
		logger.info("success 호출 성공");
		
		model.addAttribute("result", result);
		
		return "establish/success";
	}

	/****************************************************************
	 * 프로젝트 상세 쓰기 구현하기
	 ****************************************************************/
	@RequestMapping(value="/introductionInsert.do", method=RequestMethod.POST)
	public String introductionInsert(@RequestParam("app_index") int app_index, @ModelAttribute IntroductionVO ivo, PlannerVO pvo, IntroApprovalVO intappvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("introductionInsert 호출 성공");
		
		

		if (ivo.getIntro_file().getOriginalFilename() != null && !ivo.getIntro_file().getOriginalFilename().equals("")) {
			logger.info("fileName(Main Image) : " + ivo.getIntro_file().getOriginalFilename());
			
			String intro_file = FileUploadUtil.fileUpload(ivo.getIntro_file(), request);
			ivo.setIntro_image(intro_file);
		} else {
			logger.info("intro_file null");
			ivo.setIntro_image("");
		}
		
		if (pvo.getPlan_file().getOriginalFilename() != null && !pvo.getPlan_file().getOriginalFilename().equals("")) {
			logger.info("fileName(Planner Image) : " + pvo.getPlan_file().getOriginalFilename());
			
			String plan_file = FileUploadUtil.fileUpload(pvo.getPlan_file(), request);
			pvo.setPlan_image(plan_file);
		} else {
			logger.info("plan_file null");
			pvo.setPlan_image("");
		}
		
		
		
		int result = 0;
		String url = "";
		
		result = introductionService.introductionInsert(ivo, pvo, intappvo);
		if (result == 1) {
			
			
			BoardInfoVO infovo = new BoardInfoVO();
			infovo.setBdinf_title("문의게시판 - " + ivo.getIntro_subtitle());
			infovo.setBdinf_type(1);
			infovo.setBdinf_uri(ivo.getIntro_project());
			infovo.setBdinf_master(intappvo.getUs_index());
			boardInfoService.infoInsert(infovo);
			
			
			//url = "/establish/success.do";
			
			int intro_index = introductionService.getIntroIndex(app_index);
			url = "/establish/contentDetail.do?intro_index=" + intro_index;
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
		logger.info("searchCombo = " + appvo.getSearch());
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
		int result1 = 0, result2 = 0;
		
		result1 = applicationService.approvalDelete(appvo.getApp_index());
		result2 = applicationService.applicationDelete(appvo.getApp_index());
		if (result1 == 1 && result2 == 1) {
			return "redirect:/establish/applicationAdminList.do";
		} else {
			return "redirect:/establish/success.do?result=2";
		}
	}
	
	
	

	/****************************************************************
	 * 프로젝트 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/projectAdminList.do", method=RequestMethod.GET)
	public String projectAdminList(@ModelAttribute IntroductionVO ivo, Model model) { 
		logger.info("projectAdminList 호출 성공");
		
		// 정렬에 대한 기본값 설정
		if (ivo.getOrder_by() == null) ivo.setOrder_by("intapp_index");
		if (ivo.getOrder_sc() == null) ivo.setOrder_sc("DESC");
		
		// 정렬에 대한 데이터 확인
		logger.info("order_by = " + ivo.getOrder_by());
		logger.info("order_sc = " + ivo.getOrder_sc());
		
		// 검색에 대한 데이터 확인
		logger.info("searchCombo = " + ivo.getSearchCombo());
		logger.info("keyword = " + ivo.getKeyword());
		
		// 페이지 세팅
		Paging.setPage(ivo);
		
		// 전체 레코드수 구현
		int total = introductionService.projectListCnt(ivo);
		logger.info("total = " + total);
		
		// 글번호 재설정
		
		List<IntroductionVO> projectList = introductionService.projectAdminList(ivo);
		model.addAttribute("projectList", projectList);
		model.addAttribute("total", total);
		model.addAttribute("data", ivo);
		
		return "establish/projectAdminList";
	}
	
	
	

	/****************************************************************
	 * 프로젝트 수정/삭제 요청 확인 구현하기
	 ****************************************************************/
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	/*@RequestMapping(value="/projectApprovalUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})*/
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
	/*@RequestMapping(value="/projectMyPage.do", method=RequestMethod.GET)
	public String projectMyPage(@RequestParam("us_index") int us_index, @ModelAttribute IntroductionVO ivo, Model model) { */
	@RequestMapping(value="/projectMyPage.do")
	public String projectMyPage(@ModelAttribute IntroductionVO ivo, Model model, HttpServletRequest request) { 
		logger.info("projectMyPage 호출 성공");
		
		
		// 회원 등급 가져오기
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			userData = userMainService.userData(userData);
			logger.info("회원번호 : " + userData.getUs_index() + ", 등급 : " + userData.getUs_rank());
		
		
			List<IntroductionVO> projectList = introductionService.projectMyPageList(userData.getUs_index());
			model.addAttribute("projectList", projectList);
			model.addAttribute("data", ivo);
			
			return "establish/projectMyPage";
		}
		
		return "redirect:/establish/success.do?result=3";
	}
	
	
	

	/****************************************************************
	 * MyPage 프로젝트 수정/삭제 요청 구현하기
	 ****************************************************************/
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	/*@RequestMapping(value="/projectApprovalUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})*/
	@RequestMapping(value="/projectApprovalRequest.do", method=RequestMethod.POST)
	public String projectApprovalRequest(@ModelAttribute IntroApprovalVO intappvo) {
		logger.info("projectApprovalRequest 호출 성공");
		
		logger.info("intappvo 값 확인 : " + intappvo.getIntapp_index() + ", " + intappvo.getIntapp_check());
		
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = introductionService.projectApprovalRequest(intappvo);
		logger.info("result = " + result);
		
		return result + "";
	}
	
	
	
	

	

	/****************************************************************
	 * 프로젝트 둘러보기 목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/projectContentList.do", method=RequestMethod.GET)
	public String projectContentList(@RequestParam("app_field") String app_field, Model model) { 
		logger.info("projectContentList 호출 성공");
		
		List<Integer> indexList = new ArrayList<Integer>();
		
		if (app_field.equals("all")) {
			indexList = introductionService.introdutionAllCount(app_field);
		} else {
			indexList = introductionService.introdutionCount(app_field);
		}
		
		List<ProjectListVO> projectContentList = new ArrayList<ProjectListVO>();
		ProjectListVO plvo = null;
		
		for (int intro_index : indexList) {
			logger.info("intro_index : " + intro_index);
			
			int count = introductionService.sponserCount(intro_index);
			if (count != 0)
				plvo = introductionService.lookRoundContentList(intro_index);
			else
				plvo = introductionService.noOneContentList(intro_index);
			
			projectContentList.add(plvo);
		}
		
		/*List<ProjectListVO> projectContentList = null;
		int count = introductionService.sponserCount(app_field);
		if (count > 0) {
			projectContentList = introductionService.projectAllContentList(app_field);
		} else {
			projectContentList = introductionService.projectContentList(app_field);
		}*/
		
		
		
		model.addAttribute("projectContentList", projectContentList);
		model.addAttribute("app_field", app_field);
		
		return "establish/projectContentList";
	}
	
	
	

	/****************************************************************
	 * 컨텐츠 수정하기 내용 출력하기
	 ****************************************************************/
	@RequestMapping(value="/applicationDetailUpdate.do", method=RequestMethod.GET)
	public String applicationDetailUpdate(@RequestParam("intro_index") int intro_index, Model model) {
		logger.info("applicationDetailUpdate 호출 성공");
		
		
		/* 프로젝트 소개 정보 */
		IntroductionVO introDetail = new IntroductionVO();
		introDetail = introductionService.introductionDetail(intro_index);
		
		/*if (introDetail != null && (!introDetail.equals(""))) {
			introDetail.setIntro_details(introDetail.getIntro_details().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_synopsis(introDetail.getIntro_synopsis().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_plan(introDetail.getIntro_plan().toString().replaceAll("\n", "<br>"));
			introDetail.setIntro_purpose(introDetail.getIntro_purpose().toString().replaceAll("\n", "<br>"));
		}*/
		
		model.addAttribute("introDetail", introDetail);
		
		/* 기획자 정보 */
		PlannerVO plannerDetail = new PlannerVO();
		plannerDetail = introductionService.plannerDetail(intro_index);
		
		model.addAttribute("plannerDetail", plannerDetail);
		
		
		
		/* 개설신청 */
		ApplicationVO appDetail = new ApplicationVO();
		appDetail = introductionService.getFundNField(intro_index);
		
		logger.info("fund : " + appDetail.getApp_fund());
		
		model.addAttribute("appDetail", appDetail);
		
		//introDetail.getApp_index()
		
		return "establish/applicationDetailUpdate";
	}
	
	


	/****************************************************************
	 * 컨텐츠 수정하기 내용 출력하기
	 ****************************************************************/
	/*@ResponseBody	// 현재 요청값을 브라우저에 바로 출력*/
	@RequestMapping(value="/introductionUpdate.do", method=RequestMethod.POST)
	public String introductionUpdate(@ModelAttribute IntroductionVO ivo, PlannerVO pvo, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("introductionUpdate 호출 성공");
		
		int intro_index = ivo.getIntro_index();
		logger.info("intro_index : " + intro_index);
		
		//introDetail.setIntro_index(intro_index);
		pvo.setIntro_index(intro_index);
		
		
		
		if (ivo.getIntro_file().getOriginalFilename() != null) {
			logger.info("fileName(Main Image) : " + ivo.getIntro_file().getOriginalFilename());
			
			String intro_file = FileUploadUtil.fileUpload(ivo.getIntro_file(), request);
			ivo.setIntro_image(intro_file);
		}
		
		if (pvo.getPlan_file().getOriginalFilename() != null) {
			logger.info("fileName(Planner Image) : " + pvo.getPlan_file().getOriginalFilename());
			
			String plan_file = FileUploadUtil.fileUpload(pvo.getPlan_file(), request);
			pvo.setPlan_image(plan_file);
		}
		
		
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0, result1 = 0, result2 = 0;
		
		/* 프로젝트 소개 정보 */
		result1 = introductionService.introductionModifyUpdate(ivo);
		
		/* 기획자 정보 */
		result2 = introductionService.plannerModifyUpdate(pvo);
		
		if (result1 != 0 && result2 != 0)
			result = 1;
		
		logger.info("result = " + result);
		
		if (result == 1)
			return "redirect:/establish/contentDetail.do?intro_index=" + intro_index;
		else
			return "redirect:/establish/success.do?result=3";
		
		//return result + "";
	}
	
	
}
