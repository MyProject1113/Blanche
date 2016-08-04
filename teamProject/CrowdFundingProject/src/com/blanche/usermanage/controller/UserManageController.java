package com.blanche.usermanage.controller;

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

import com.blanche.common.constant.Constant;
import com.blanche.establish.service.ApplicationService;
import com.blanche.establish.service.IntroductionService;
import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.intro.service.IntroService;
import com.blanche.intro.vo.IntroVO;
import com.blanche.user.main.vo.UserMainVO;
import com.blanche.usermanage.email.email;
import com.blanche.usermanage.service.UserManageService;



@Controller
@RequestMapping(value="/usermanage")
public class UserManageController {
	Logger logger = Logger.getLogger(UserManageController.class);
	
	@Autowired
	private UserManageService userManageService;

	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private IntroductionService introductionService;
	
	@Autowired
	private IntroService introService;
	
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
	
	@RequestMapping(value="/design.do",method=RequestMethod.GET)
	public String myPage3(Model model, HttpServletRequest request) {
		logger.info("projectMyPage 호출 성공");
		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
		
		if (userMainVO != null) {
		ApplicationVO appvo = new ApplicationVO();
		appvo.setUs_index(userMainVO.getUs_index());
		List<ApplicationVO> applicationList = applicationService.applicationMyPageList(appvo);
		model.addAttribute("applicationList", applicationList);
		model.addAttribute("data", appvo);
		
		
		logger.info("javauser@oracle.com" + userMainVO.getUs_index());
		
		List<IntroductionVO> projectList = introductionService.projectMyPageList(userMainVO.getUs_index());
		
		logger.info("ssssssssssssssssssssssssssss"+projectList.size());
		model.addAttribute("projectList", projectList);
		}
		
		return "usermanage/design";	// View Name => 파일명 아님!!!
	}
	
	@RequestMapping(value="/invest.do",method=RequestMethod.GET)
	public String myPage4(Model model,HttpServletRequest request) {
		logger.info("investMypage 호출성공");
		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
		if (userMainVO != null) {
			IntroVO invo = new IntroVO();
			invo.setUs_index(userMainVO.getUs_index());
			List<IntroVO> introList = introService.introMyPageList(invo);
			model.addAttribute("introList", introList);
			model.addAttribute("data", invo);
			String intro_index = introService.projectIndex(userMainVO.getUs_index());
			String intro_title = introService.projectname(userMainVO.getUs_index());
			DonationVO donationVO = new DonationVO();
			
			donationVO.setIntro_index(Integer.parseInt(intro_index));
			donationVO = introductionService.donationDetail(donationVO.getIntro_index());
			
			logger.info("title : " + intro_title);
			
			model.addAttribute("intro_title", intro_title);
			model.addAttribute("donationVO", donationVO);
			
			List<IntroVO> accountList = introService.accountMyPageList(invo);
			model.addAttribute("accountList", accountList);
			
			model.addAttribute("intro_index",intro_index);
					
			return "usermanage/invest";
		}else{
		
		return "redirect:/index.jsp";	// View Name => 파일명 아님!!!
	}
	}
	
	@RequestMapping(value="/investForm.do",method=RequestMethod.GET)
	public String myPage5(@RequestParam("change") String change  ,Model model,HttpServletRequest request) {
		logger.info("investMypage 호출성공");
		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
		if (userMainVO != null) {
		IntroVO invo = new IntroVO();
		invo.setUs_index(userMainVO.getUs_index());
		List<IntroVO> introList = introService.introMyPageList(invo);
		model.addAttribute("introList", introList);
		model.addAttribute("data", invo);
		
		String intro_title = introService.projectname(userMainVO.getUs_index());
		
		logger.info("title : " + intro_title);
		
		model.addAttribute("intro_title", intro_title);
		model.addAttribute("change", change);
		
		List<IntroVO> accountList = introService.accountMyPageList(invo);
		model.addAttribute("accountList", accountList);
		
		String intro_index = introService.projectIndex(userMainVO.getUs_index());
		model.addAttribute("intro_index",intro_index);
		
		return "usermanage/invest";	// View Name => 파일명 아님!!!
		}else{
			
			return "redirect:/index.jsp";	// View Name => 파일명 아님!!!
		}
	}
	
	

	
	
	
	
	@RequestMapping(value="/send.do",method=RequestMethod.POST)
	public void send(@ModelAttribute IntroApprovalVO ivo){
		logger.info("send 페이지 호출성공");
		
		
		userManageService.approvalUpdate(ivo);
		}
	
	@RequestMapping(value="/hard.do",method=RequestMethod.POST)
	public String updateAdd(@ModelAttribute IntroVO ivo, Model model, HttpServletRequest request){
		logger.info("업데이트 호출성공");
		
		int result = introService.updateAdd(ivo);
		System.out.println("ddddddddddddddddddddddddd" + result);
		
//		UserMainVO userMainVO =  (UserMainVO)request.getSession().getAttribute(Constant.SESSION_USER_DATA);
//		IntroVO invo = new IntroVO();
//		invo.setUs_index(userMainVO.getUs_index());
//		List<IntroVO> introList = introService.introMyPageList(invo);
//		model.addAttribute("introList", introList);
//		model.addAttribute("data", invo);
//		
//		String intro_title = introService.projectname(userMainVO.getUs_index());
//		
//		logger.info("title : " + intro_title);
//		
//		model.addAttribute("intro_title", intro_title);
//		
//		List<IntroVO> accountList = introService.accountMyPageList(invo);
//		model.addAttribute("accountList", accountList);
//		
//		String intro_index = introService.projectIndex(userMainVO.getUs_index());
//		model.addAttribute("intro_index",intro_index);
		
		return "redirect:/usermanage/invest.do";
		
	}
	
}
