package com.blanche.manage.board.controller;

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
@RequestMapping(value = "/manage/board")
public class ManageBoardController implements Constant{
	private static Logger logger = Logger.getLogger(ManageBoardController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private BoardMainService boardMainService;
	
	@Autowired
	private BoardAttachService boardAttachService;
	
	/** 작성글 전체 조회
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest request) {
		logger.info("boardList 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				BoardMainVO boardParam = new BoardMainVO();
				boardParam.setBd_delete(1);
				List<BoardMainVO> boardList = boardMainService.boardList(boardParam);
				int listCount = boardMainService.boardListCount(boardParam);
				boardParam.setListCount(listCount);
				mav.addObject("boardList", boardList);
				mav.addObject("boardParam", boardParam);
				mav.setViewName("manage/board/listForm");
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
	
	/** 작성글 전체 조회
	 * @param	BoardMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ModelAndView boardList(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardList 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setBd_index(0);
				param.setBdinf_index(0);
				param.setBd_delete(1);
				List<BoardMainVO> boardList = boardMainService.boardList(param);
				int listCount = boardMainService.boardListCount(param);
				param.setListCount(listCount);
				mav.addObject("boardList", boardList);
				mav.addObject("boardParam", param);
				mav.setViewName("manage/board/listForm");
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
	
	/** 작성글 본문 상세 보기
	 * @param	BoardMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardData <br />
	 * 			BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 * 			BoardAttachVO $attachList
	 */
	@RequestMapping(value="/article.do", method=RequestMethod.POST)
	public ModelAndView boardDetail(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDetail 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			param.setUs_index(userData.getUs_index());
		} else {
			param.setUs_index(0);
		}
		param.setBd_delete(1);
		BoardMainVO boardData = boardMainService.boardDetail(param);
		ModelAndView mav = new ModelAndView();
		if (boardData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				BoardAttachVO attachParam = new BoardAttachVO();
				attachParam.setBd_index(param.getBd_index());
				List<BoardAttachVO> attachList = boardAttachService.attachList(attachParam);
				mav.addObject("boardData", boardData);
				mav.addObject("boardParam", param);
				mav.addObject("attachList", attachList);
				mav.setViewName("manage/board/detailForm");
			} else {
				mav.addObject("result", "운영자만 글을 조회할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("result", "해당하는 게시물이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 게시판 본문 삭제
	 * @param	BoardMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO (
	 * @return	BoardMainVO $boardParam
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView boardDelete(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDelete 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				int replyCount = boardMainService.boardReplyCount(param);
				if (replyCount > 0) {
					mav.addObject("result", "답변이 있어 삭제를 할 수 없습니다.");
					mav.setViewName("board/common/returnError");
				} else {
					int result = boardMainService.boardDelete(param);
					if (result == 1) {
						mav.addObject("boardParam", param);
						mav.setViewName("manage/board/returnList");
					} else {
						mav.addObject("result", "글 삭제에 실패하였습니다.");
						mav.setViewName("board/common/returnError");
					}
				}
			} else {
				mav.addObject("result", "운영자만 글을 삭제할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 삭제할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 본문 복원
	 * @param	BoardMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO (
	 * @return	BoardMainVO $boardParam
	 */
	@RequestMapping(value="/restore.do", method=RequestMethod.POST)
	public ModelAndView boardRestore(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDelete 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				BoardMainVO parentParam = new BoardMainVO();
				if (param.getBd_parent() > 0) {
					parentParam.setBd_index(param.getBd_parent());
					System.out.println(parentParam.getBd_index());
					parentParam = boardMainService.boardDetail(parentParam);
				}
				if (parentParam == null) {
					mav.addObject("result", "부모글이 삭제되어 복원을 할 수 없습니다.");
					mav.setViewName("board/common/returnError");
				} else {
					int result = boardMainService.boardRestore(param);
					if (result == 1) {
						mav.addObject("boardParam", param);
						mav.setViewName("manage/board/returnList");
					} else {
						mav.addObject("result", "글 삭제에 실패하였습니다.");
						mav.setViewName("board/common/returnError");
					}
				}
			} else {
				mav.addObject("result", "운영자만 글을 삭제할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 삭제할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
}