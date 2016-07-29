package com.blanche.usermanage.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blanche.common.constant.Constant;
import com.blanche.user.main.vo.UserMainVO;
import com.blanche.usermanage.email.email;
import com.blanche.usermanage.service.UserManageService;



@Controller
@RequestMapping(value="/usermanage")
public class UserManageController {
	Logger logger = Logger.getLogger(UserManageController.class);
	
	@Autowired
	private UserManageService userManageService;
	
	@RequestMapping(value="/join.do")
	public String join(Model model) {
		
		return "usermanage/join";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/agree.do")
	public String agree(Model model) {
		
		return "usermanage/agree";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/login.do")
	public String login(Model model) {
		
		return "usermanage/login";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/findpw.do")
	public String findpw(Model model) {
		
		return "usermanage/findpw";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/accredit.do")
	public String accredit(Model model) {
		
		return "usermanage/accredit";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/joincomp.do")
	public String joincomp(Model model) {
		int result;
		email.sendEmail();		
		
		result = email.result; 
		
		return "usermanage/joincomp";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/pwchange.do")
	public String myPage1( Model model) {

		return "usermanage/pwchange";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/pwchangeBtn.do")
	public String pwChange(@RequestParam("con") String con, Model model,  HttpServletRequest request) {
		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
		userMainVO.setUs_password(con);
		userManageService.pwChange(userMainVO);

		return "usermanage/pwchange";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/phchange.do")
	public String myPage2( Model model) {

		return "usermanage/phchange";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/phchangeBtn.do")
	public String phChange(@RequestParam("us_phone") String us_phone ,Model model , HttpServletRequest request) {
		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
		userMainVO.setUs_phone(us_phone);
		userManageService.phChange(userMainVO);
		
		return "usermanage/phchange";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/design.do")
	public String myPage3(Model model) {
		
		return "usermanage/design";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/invest.do")
	public String myPage4(Model model) {
		
		return "usermanage/invest";	// View Name => 파일명 아님!!!
	}
	
	
}
