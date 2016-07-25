package com.blanche.establish.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blanche.establish.service.EstablishService;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/establish")
public class EstablishController {
	Logger logger = Logger.getLogger(EstablishController.class);

	//@Autowired
	//private EstablishService establishService;	// 인터페이스 구현체 생성
	
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
	@RequestMapping(value="/applicationDetailForm.do")
	public String applicationDetailForm() {
		logger.info("applicationDetailForm 호출 성공");
		
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
}
