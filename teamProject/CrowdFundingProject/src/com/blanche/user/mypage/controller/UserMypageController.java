package com.blanche.user.mypage.controller;

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
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/mypage")
public class UserMypageController implements Constant{
	private static Logger logger = Logger.getLogger(UserMypageController.class);
	
	@Autowired
	private BoardMainService boardService;
	
	@Autowired
	private BoardAttachService attachService;
	
	/** 작성글 전체 조회
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/mylist.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request) {
		logger.info("mylist 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			BoardMainVO boardParam = new BoardMainVO();
			boardParam.setUs_index(userData.getUs_index());
			List<BoardMainVO> boardList = boardService.boardList(boardParam);
			int listCount = boardService.boardListCount(boardParam);
			boardParam.setListCount(listCount);
			mav.addObject("boardList", boardList);
			mav.addObject("boardParam", boardParam);
			mav.setViewName("board/mypage/mylistForm");
		} else {
			mav.addObject("result", "로그인 상태에서만 글을 조회할 수 있습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 작성글 전체 조회
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/mylist.do", method=RequestMethod.POST)
	public ModelAndView boardList(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("mylist 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			param.setBd_index(0);
			param.setBdinf_index(0);
			param.setUs_index(userData.getUs_index());
			List<BoardMainVO> boardList = boardService.boardList(param);
			int listCount = boardService.boardListCount(param);
			param.setListCount(listCount);
			mav.addObject("boardList", boardList);
			mav.addObject("boardParam", param);
			mav.setViewName("board/mypage/mylistForm");
		} else {
			mav.addObject("result", "로그인 상태에서만 글을 조회할 수 있습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 작성글 본문 상세 보기
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardData <br />
	 * 			BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 * 			BoardAttachVO $attachList
	 */
	@RequestMapping(value="/myarticle.do", method=RequestMethod.POST)
	public ModelAndView boardDetail(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("myarticle 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			param.setUs_index(userData.getUs_index());
		} else {
			param.setUs_index(0);
		}
		BoardMainVO boardData = boardService.boardDetail(param);
		
		ModelAndView mav = new ModelAndView();
		if (boardData != null) {
			BoardAttachVO attachParam = new BoardAttachVO();
			attachParam.setBd_index(param.getBd_index());
			List<BoardAttachVO> attachList = attachService.attachList(attachParam);
			mav.addObject("boardData", boardData);
			mav.addObject("boardParam", param);
			mav.addObject("attachList", attachList);
			mav.setViewName("board/mypage/myarticleForm");
		} else {
			mav.addObject("result", "해당하는 게시물이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
}