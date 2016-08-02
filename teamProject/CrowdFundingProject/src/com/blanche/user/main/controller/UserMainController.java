package com.blanche.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.common.constant.Constant;
import com.blanche.user.access.service.UserAccessService;
import com.blanche.user.access.vo.UserAccessVO;
import com.blanche.user.accredit.service.UserAccreditService;
import com.blanche.user.accredit.vo.UserAccreditVO;
import com.blanche.user.agree.service.UserAgreeService;
import com.blanche.user.agree.vo.UserAgreeVO;
import com.blanche.user.common.mail.EmailUtil;
import com.blanche.user.common.util.EncryptionUtil;
import com.blanche.user.common.util.IPConfigUtil;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

@RestController
@RequestMapping(value = "/user")
public class UserMainController implements Constant {
	private static Logger logger = Logger.getLogger(UserMainController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private UserAgreeService userAgreeService;
	
	@Autowired
	private UserAccessService userAccessService;
	
	@Autowired
	private UserAccreditService userAccreditService;
	
	/** 회원 접속창
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView userLogin() {
		logger.info("userLogin 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");
		
		return mav;
	}
	
	/** 회원 접속
	 * @param	UserMainVO $param
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $blancheUser
	 */
	@RequestMapping(value="/access.do", method=RequestMethod.POST)
	public ModelAndView userAccess(@ModelAttribute UserMainVO param, HttpServletRequest request) {
		logger.info("userAccess 호출 성공");
		
		param = userMainService.userAccess(param);
		ModelAndView mav = new ModelAndView();
		if (param != null) {
			if (param.getAccreditState() == 0) {
				UserAccessVO accessParam = new UserAccessVO();
				accessParam.setUs_index(param.getUs_index());
				accessParam.setUsacc_ip(IPConfigUtil.getIP());
				UserAccessVO accessLast = userAccessService.accessLast(accessParam);
				if (accessLast != null) {
					param.setAccessIP(accessLast.getUsacc_ip());
					param.setAccessDate(accessLast.getUsacc_date());
				}
				userAccessService.accessInsert(accessParam);
				request.getSession().setAttribute(SESSION_USER_DATA, param);
				mav.setViewName("user/loginForm");
			} else {
				mav.addObject("userData", param);
				mav.setViewName("user/retryForm");
			}
		} else {
			mav.addObject("result", "로그인에 실패하였습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 접속해제
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $blancheUser
	 */
	@RequestMapping(value="/exit.do")
	public ModelAndView userExit(HttpServletRequest request) {
		logger.info("userExit 호출 성공");
		
		request.getSession().setAttribute(SESSION_USER_DATA, null);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/loginForm");
		
		return mav;
	}
	
	/** 회원 약관동의창
	 */
	@RequestMapping(value="/policies.do")
	public ModelAndView userPolicies(HttpServletRequest request) {
		logger.info("userPolicies 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/policiesForm");
		
		return mav;
	}
	
	/** 회원 가입창
	 * @param	UserMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return UserMainVO $userData
	 */
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public ModelAndView userJoin(@ModelAttribute UserMainVO param, HttpServletRequest request) {
		logger.info("userJoin 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData == null) {
			mav.addObject("userData", param);
			mav.setViewName("user/joinForm");
		} else {
			mav.addObject("result", "로그인 상태에서는 회원가입이 불가능합니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 가입
	 * @param	 UserMainVO $param
	 * @param	 HttpServletRequest $request for UserMainVO
	 * @return UserMainVO $userData
	 */
	@RequestMapping(value="/info.do", method=RequestMethod.POST)
	public ModelAndView userInfo(@ModelAttribute UserMainVO param, HttpServletRequest request) {
		logger.info("userInfo 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData == null) {
			int result = userMainService.userInsert(param);
			if (result == 1) {
				UserAgreeVO agreeParam = new UserAgreeVO();
				agreeParam.setUs_index(param.getUs_index());
				agreeParam.setUsagr_date1(param.getAgreeDate1());
				agreeParam.setUsagr_date2(param.getAgreeDate2());
				userAgreeService.agreeInsert(agreeParam);
				UserAccreditVO accreditParam = new UserAccreditVO();
				accreditParam.setUs_index(param.getUs_index());
				accreditParam.setUsacd_code(EncryptionUtil.getAccredit());
				accreditParam.setUsacd_type(0);
				accreditParam.setUserName(param.getUs_name());
				accreditParam.setUserEmail(param.getUs_email());
				EmailUtil.sendAccredit(accreditParam, request);
				userAccreditService.accreditInsert(accreditParam);
				mav.addObject("userData", param);
				mav.setViewName("user/infoForm");
			} else {
				mav.addObject("result", "회원가입에 실패하였습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("result", "로그인 상태에서는 회원가입이 불가능합니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 중복 확인
	 * @param	UserMainVO $param
	 * @return String
	 */
	@RequestMapping(value="/check.do", method=RequestMethod.POST)
	public ResponseEntity<String> userCheck(@RequestBody UserMainVO param) {
		logger.info("userCheck 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			int result = 0;
			if (param.getUs_email() != null && !param.getUs_email().equals("")) {
				result = userMainService.userCheck(param);
			} else if (param.getUs_nickname() != null && !param.getUs_nickname().equals("")) {
				result = userMainService.userCheck(param);
			}
			if (result > 0) {
				entity = new ResponseEntity<String>("FIND", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 회원 인증
	 * @param	UserAccreditVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return UserMainVO $userData
	 */
	@RequestMapping(value="/accredit.do", method=RequestMethod.GET)
	public ModelAndView userAccredit(@ModelAttribute UserAccreditVO param, HttpServletRequest request) {
		logger.info("userAccredit 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData == null) {
			int result = userAccreditService.accreditRemove(param);
			if (result == 1) {
				mav.addObject("accreditData", param);
				mav.setViewName("user/accreditForm");
			} else {
				mav.addObject("result", "인증코드가 유효하지 않습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("result", "로그인 상태에서는 회원인증이 불가능합니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 가입 인증메일 재전송
	 * @param	UserMainVO $param
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $userData
	 */
	@RequestMapping(value="/retry.do", method=RequestMethod.POST)
	public ResponseEntity<String> userRetry(@RequestBody UserMainVO param, HttpServletRequest request) {
		logger.info("userRetry 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			param = userMainService.userData(param);
			UserAccreditVO accreditParam = new UserAccreditVO();
			accreditParam.setUs_index(param.getUs_index());
			accreditParam.setUsacd_type(0);
			int result = userAccreditService.accreditDelete(accreditParam);
			if (result == 1) {
				accreditParam.setUsacd_code(EncryptionUtil.getAccredit());
				accreditParam.setUserName(param.getUs_name());
				accreditParam.setUserEmail(param.getUs_email());
				EmailUtil.sendAccredit(accreditParam, request);
				result = userAccreditService.accreditInsert(accreditParam);
				if (result == 1) {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
			} else {
				entity = new ResponseEntity<String>("COMPLETE", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 회원 접속 기록
	 * @param	 HttpServletRequest $request for UserMainVO
	 * @return UserAccessVO $accessList
	 */
	@RequestMapping(value="/record.do", method=RequestMethod.GET)
	public ModelAndView userAccess(HttpServletRequest request) {
		logger.info("userAccess 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			UserAccessVO accessParam = new UserAccessVO();
			accessParam.setUs_index(userData.getUs_index());
			List<UserAccessVO> accessList = userAccessService.accessList(accessParam);
			mav.addObject("accessList", accessList);
			mav.setViewName("user/recordForm");
		} else {
			mav.addObject("result", "로그인 상태에서만 접속기록을 확인할 수 있습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 비밀번호 찾기창
	 */
	@RequestMapping(value="/find.do", method=RequestMethod.GET)
	public ModelAndView userFind() {
		logger.info("userFind 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/findForm");
		
		return mav;
	}
	
	/** 회원 비밀번호 찾기 인증메일 전송
	 * @param	UserMainVO $param
	 * @param	HttpServletRequest $request
	 * @return UserMainVO $userData
	 */
	@RequestMapping(value="/send.do", method=RequestMethod.POST)
	public ResponseEntity<String> userSend(@RequestBody UserMainVO param, HttpServletRequest request) {
		logger.info("userSend 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			param = userMainService.userFind(param);
			UserAccreditVO accreditParam = new UserAccreditVO();
			accreditParam.setUs_index(param.getUs_index());
			accreditParam.setUsacd_type(1);
			userAccreditService.accreditDelete(accreditParam);
			accreditParam.setUsacd_code(EncryptionUtil.getAccredit());
			accreditParam.setUserName(param.getUs_name());
			accreditParam.setUserEmail(param.getUs_email());
			EmailUtil.sendAccredit(accreditParam, request);
			int result = userAccreditService.accreditInsert(accreditParam);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 회원 비밀번호 변경
	 * @param	UserMainVO $param
	 */
	@RequestMapping(value="/changePassword.do", method=RequestMethod.POST)
	public ModelAndView userChangePassword(@ModelAttribute UserMainVO param) {
		logger.info("userChangePassword 호출 성공");
		
		int result = userMainService.userChangePassword(param);
		ModelAndView mav = new ModelAndView();
		if (result == 1) {
			String loginMessage = "비밀번호 변경에 성공했습니다.";
			mav.addObject("loginMessage", loginMessage);
			mav.setViewName("board/common/returnLogin");
		} else {
			mav.addObject("result", "비밀번호 변경에 실패했습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
}