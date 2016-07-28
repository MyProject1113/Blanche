package com.blanche.establish.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.blanche.establish.service.ApplicationService;
import com.blanche.establish.service.IntroductionService;
import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;
import com.blanche.establish.vo.IntroductionVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/establish")
public class EstablishController {
	Logger logger = Logger.getLogger(EstablishController.class);

	@Autowired
	private ApplicationService applicationService;	// 인터페이스 구현체 생성
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
	@RequestMapping(value="/contentDetail.do")
	public String contentDetail() {
		logger.info("contentDetail 호출 성공");
		
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
	public String introductionInsert(@ModelAttribute IntroductionVO ivo) {
		logger.info("introductionInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = introductionService.introductionInsert(ivo);
		if (result == 1) {
			url = "/establish/success.do";
		}
		
		return "redirect:" + url;
	}
}
