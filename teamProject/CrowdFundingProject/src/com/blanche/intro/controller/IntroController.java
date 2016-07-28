package com.blanche.intro.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blanche.intro.service.IntroService;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/intro")
public class IntroController {
	Logger logger = Logger.getLogger(IntroController.class);
	
	private IntroService introService; // 인터페이스 구현체 생성

	/********************************************
	 * 프로젝트 소개페이지 구현
	 * *******************************************/
	@RequestMapping(value="/intro.do")
	public String introList(Model model) {
		logger.info("introList 호출 성공");
		
		/*List<BoardVO> boardList = boardService.introList();
		model.addAttribute("intro", boardList);*/
		
		return "intro/intro";	// View Name => 파일명 아님!!!
	}

	/********************************************
	 * 프로젝트 상세 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/introDetail.do")
	public String introDetail() {
		logger.info("introList 호출 성공");
		
		return "redirect:/establish/contentDetail.do";
	}

	/********************************************
	 * 프로젝트 밀어주기 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/reward.do")
	public String reward() {
		logger.info("reward 호출 성공");
		
		return "intro/reward";
	}
	
	/********************************************
	 * 후원자 정보입력 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/receiveInfo.do")
	public String receiveInfo() {
		logger.info("receiveInfo 호출 성공");
		
		return "intro/receiveInfo";
	}
	
	/********************************************
	 * 결제 정보입력 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/payment.do")
	public String payment() {
		logger.info("payment 호출 성공");
		
		return "intro/payment";
	}
	
	/********************************************
	 * 결제 정보확인 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/pay_success.do")
	public String pay_success() {
		logger.info("pay_success 호출 성공");
		
		return "intro/pay_success";
	}
}
