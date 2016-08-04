package com.blanche.intro.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.intro.service.IntroService;
import com.blanche.intro.vo.IntroVO;
import com.blanche.intro.vo.investVO;
import com.blanche.intro.vo.usactVO;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/intro")
public class IntroController {
	Logger logger = Logger.getLogger(IntroController.class);
	
	@Autowired
	private IntroService introService; // 인터페이스 구현체 생성

	@Autowired
	private UserMainService userMainService;
	
	/********************************************
	 * 프로젝트 소개페이지 구현
	 * *******************************************/
	
	/*
	@RequestMapping(value="/intro.do")
	public String introList(Model model) {
		logger.info("introList 호출 성공");
	*/	
	
		/*List<BoardVO> boardList = boardService.introList();
		model.addAttribute("intro", boardList);*/
	/*
		return "intro/intro";	// View Name => 파일명 아님!!!
	}
	*/

	/********************************************
	 * 프로젝트 상세 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/introDetail.do", method=RequestMethod.GET)
	public String introDetail(@RequestParam("intro_index") int intro_index) {
		logger.info("introList 호출 성공");
		
		return "redirect:/establish/contentDetail.do?intro_index=" + intro_index;
	}


	/********************************************
	 * 프로젝트 상세 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/projectContentList.do", method=RequestMethod.GET)
	public String projectContentList(@RequestParam("app_field") int app_field) {
		logger.info("projectContentList 호출 성공");
		
		return "redirect:/establish/projectContentList.do?app_field=" + app_field;
	}

	
	/********************************************
	 * 프로젝트 밀어주기 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/reward.do", method=RequestMethod.GET)
	public String reward(@RequestParam("intro_index") int intro_index, Model model, HttpServletRequest request) {
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute("blancheUser");
		if (userData != null) {
			userData = userMainService.userData(userData);
			logger.info("회원번호 : " + userData.getUs_index() + ", 등급 : " + userData.getUs_rank());
			logger.info("reward 호출 성공");
		
			logger.info("intro_index : " + intro_index);
			model.addAttribute("intro_index", intro_index);
			
			return "intro/reward";
		}
		else {
			model.addAttribute("loginMessage", "로그인 상태에서만 후원을 진행할 수 있습니다.");
			return "board/common/returnLogin";
		}
		
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
			mav.addObject("result", "등록에 문제가 있어, 완료하지 못하였습니다.1	");
			mav.setViewName("intro/returnError");
		}
		return mav;
		
	}
	
	/********************************************
	 * 결제 정보확인 페이지 이동
	 * *******************************************/
	@RequestMapping(value="/pay_success.do")
	public ModelAndView pay_success(@ModelAttribute IntroVO param, investVO invVO,  usactVO  usactVO, HttpSession session) {
		logger.info("pay_success 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		
		UserMainVO userData = (UserMainVO) session.getAttribute("blancheUser");
		param.setUs_index(userData.getUs_index());
		
		if (userData != null) {
			userData = userMainService.userData(userData);
			mav.addObject("us_index", userData.getUs_index());
			
			logger.info("param : " + param.getSponser_index() + ", " + param.getSponser_add() + ", " + param.getSponser_addnum() + ", " +
					param.getSponser_p_method() + ", " + param.getSponser_name() + ", " + param.getSponser_email() + ", " + param.getSponser_phone()
					 + ", " + param.getSponser_memo() + ", " + param.getSponser_invest() + ", " + param.getUs_index() + ", ");
			logger.info("investVO : " + invVO.getIntro_index());
			
			introService.usact_success(usactVO);
			introService.pay_success(param);
			introService.invest_success(invVO);
		
			mav.addObject("introData", param);
			mav.addObject("invVO", invVO);
			mav.addObject("usactVO", usactVO);
			mav.setViewName("intro/pay_success");
		}
		return mav;
	}
	
	/********************************************
	 *  프로젝트 둘러보기 화면 구현
	 * *******************************************/
	@RequestMapping(value="/intro.do", method=RequestMethod.GET)
	public String introList(@RequestParam("app_field") String app_field, Model model) {
		logger.info("introList 호출 성공");

		List<Integer> indexList = introService.introdutionList(app_field);
		List<IntroVO> introList = new ArrayList<IntroVO>();
		IntroVO ivo = null;
		
		for (int intro_index : indexList) {
			logger.info("intro_index : " + intro_index);
			
			int count = introService.sponserList(intro_index);
			if (count != 0)
				ivo = introService.lookRoundContent(intro_index);
			else
				ivo = introService.noOneContent(intro_index);
			
			introList.add(ivo);
		}
		
		model.addAttribute("projectContentList", introList);
		
		return "intro/intro";
	}

}

