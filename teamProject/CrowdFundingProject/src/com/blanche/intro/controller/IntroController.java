package com.blanche.intro.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.intro.service.IntroService;
import com.blanche.intro.vo.IntroVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/intro")
public class IntroController {
	Logger logger = Logger.getLogger(IntroController.class);
	
	@Autowired
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
	public ModelAndView receiveInfo(@ModelAttribute IntroVO param) {
		logger.info("receiveInfo 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("introData", param);
		mav.setViewName("intro/receiveInfo");
		
		return mav;
	}
	
	/********************************************
	 * 결제 정보입력 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/payment.do")
	public ModelAndView payment(@ModelAttribute IntroVO param) {
		logger.info("payment 호출 성공");
		
		int result=1;
		
		ModelAndView mav = new ModelAndView();
		logger.info("receiveInfo result = " + result);
		if (result >0 ) {
			mav.addObject("introData", param);
			mav.setViewName("intro/payment");
		} else {
			mav.addObject("result", "등록에 문제가 있어, 완료하지 못하였습니다.");
			mav.setViewName("intro/returnError");
		}
		return mav;
		
	}
	
	/********************************************
	 * 결제 정보확인 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/pay_success.do")
	public ModelAndView pay_success(@ModelAttribute IntroVO param) {
		logger.info("pay_success 호출 성공");
		
		introService.pay_success(param);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("introData", param);
		mav.setViewName("intro/pay_success");
		
		return mav;		
	}
	
	/********************************************
	 *  후원자 정보 DB 입력
	 * *******************************************/
/*
	@RequestMapping(value="/payment_su.do")
	public ModelAndView payment_su(@ModelAttribute IntroVO param) {
		logger.info("payment_su 호출 성공");
		
		String resultStr = "";
		int result = introService.payment_su(param);
		
		if(result > 0) resultStr = "등록 완료이 완료되었습니다.";
		else resultStr = "등록에 문제가 있어 완료하지 못하였습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("introData", param);
		mav.addObject("result", resultStr);
		mav.setViewName("result");
		
		return mav;
		
	}
*/	
}

