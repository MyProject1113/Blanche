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

import com.blanche.board.attach.service.AttachService;
import com.blanche.board.attach.vo.BoardAttachVO;
import com.blanche.board.common.constant.BoardConstant;
import com.blanche.board.main.service.BoardService;
import com.blanche.board.main.vo.BoardMainVO;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController implements BoardConstant{
	private static Logger logger = Logger.getLogger(MypageController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AttachService attachService;
	
	/** 작성글 전체 조회
	 * @param	BoardMainVO $param
	 * @return	BoardMainDTO $boardList <br />
	 * 			BoardMainDTO $boardParam <br />
	 *			BoardInfoDTO $infoData
	 */
	@RequestMapping(value="/mylist.do", method=RequestMethod.POST)
	public ModelAndView boardList(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("myarticle 호출 성공");
		
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
			mav.setViewName(VIEW_MYPAGE_LIST);
		} else {
			mav.addObject("result", ERROR_LOGON_FAIL);
			mav.setViewName(VIEW_RETURN_ERROR);
		}
		
		return mav;
	}
	
	/** 작성글 본문 상세 보기
	 * @param	BoardMainVO $param
	 * @param	HttpServletRequest $request for UserMainDTO
	 * @return	BoardMainDTO $boardData <br />
	 * 			BoardMainDTO $boardList <br />
	 * 			BoardMainDTO $boardParam <br />
	 * 			BoardAttachDTO $attachList
	 */
	@RequestMapping(value="/myarticle.do", method=RequestMethod.POST)
	public ModelAndView boardDetail(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDetail 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		BoardMainVO boardData = boardService.boardDetail(param);
		if (userData != null) {
			if (boardData.getUs_index() == userData.getUs_index()) {
				boardData.setEditable(true);
			}
		}
		ModelAndView mav = new ModelAndView();
		if (boardData != null) {
			BoardAttachVO attachParam = new BoardAttachVO();
			attachParam.setBd_index(param.getBd_index());
			List<BoardAttachVO> attachList = attachService.attachList(attachParam);
			mav.addObject("boardData", boardData);
			mav.addObject("boardParam", param);
			mav.addObject("attachList", attachList);
			mav.setViewName(VIEW_MYPAGE_DETAIL);
		} else {
			mav.addObject("result", ERROR_DETAIL_FAIL);
			mav.setViewName(VIEW_RETURN_ERROR);
		}
		
		return mav;
	}
}