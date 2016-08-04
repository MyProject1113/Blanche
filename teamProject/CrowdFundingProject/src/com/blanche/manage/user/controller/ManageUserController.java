package com.blanche.manage.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.board.attach.service.BoardAttachService;
import com.blanche.board.attach.vo.BoardAttachVO;
import com.blanche.board.main.service.BoardMainService;
import com.blanche.board.main.vo.BoardMainVO;
import com.blanche.common.constant.Constant;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/manage/user")
public class ManageUserController implements Constant{
	private static Logger logger = Logger.getLogger(ManageUserController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	/** 회원 전체 조회
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView userList(HttpServletRequest request) {
		logger.info("boardList 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				UserMainVO userParam = new UserMainVO();
				List<UserMainVO> userList = userMainService.userList(userParam);
				int listCount = userMainService.userListCount(userParam);
				userParam.setListCount(listCount);
				mav.addObject("userList", userList);
				mav.addObject("userParam", userParam);
				mav.setViewName("manage/user/listForm");
			} else {
				mav.addObject("result", "운영자만 글을 조회할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("result", "로그인 상태에서만 글을 조회할 수 있습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 회원 전체 조회
	 * @param	BoardMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ModelAndView boardList(@ModelAttribute UserMainVO param, HttpServletRequest request) {
		logger.info("boardList 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				List<UserMainVO> userList = userMainService.userList(param);
				int listCount = userMainService.userListCount(param);
				param.setListCount(listCount);
				mav.addObject("userList", userList);
				mav.addObject("userParam", param);
				mav.setViewName("manage/user/listForm");
			} else {
				mav.addObject("result", "운영자만 글을 조회할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("result", "로그인 상태에서만 글을 조회할 수 있습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
}