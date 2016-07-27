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

}
