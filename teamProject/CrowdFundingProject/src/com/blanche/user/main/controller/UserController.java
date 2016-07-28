package com.blanche.user.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.common.constant.Constant;
import com.blanche.user.main.service.UserService;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/user")
public class UserController implements Constant {
	private static Logger logger = Logger.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	/** 접속창 호출
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView userLogin() {
		logger.info("userLogin 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");
		
		return mav;
	}
	
	/** 접속
	 * @param	UserMainVO $param
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $blancheUser
	 */
	@RequestMapping(value="/access.do", method=RequestMethod.POST)
	public ModelAndView userAccess(@ModelAttribute UserMainVO param, HttpServletRequest request) {
		logger.info("userAccess 호출 성공");
		
		param = userService.userAccess(param);
		request.getSession().setAttribute(SESSION_USER_DATA, param);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");
		
		return mav;
	}
	
	/** 접속해제
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $blancheUser
	 */
	@RequestMapping(value="/exit.do", method=RequestMethod.POST)
	public ModelAndView userExit(HttpServletRequest request) {
		logger.info("userExit 호출 성공");
		
		request.getSession().setAttribute(SESSION_USER_DATA, null);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");
		
		return mav;
	}
}