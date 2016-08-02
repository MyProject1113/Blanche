package com.blanche.board.main.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.board.attach.service.BoardAttachService;
import com.blanche.board.attach.vo.BoardAttachVO;
import com.blanche.board.common.file.FileUploadUtil;
import com.blanche.board.info.service.BoardInfoService;
import com.blanche.board.info.vo.BoardInfoVO;
import com.blanche.board.main.service.BoardMainService;
import com.blanche.board.main.vo.BoardMainVO;
import com.blanche.common.constant.Constant;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/board/{boardUri}")
public class BoardMainController implements Constant {
	private static Logger logger = Logger.getLogger(BoardMainController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private BoardInfoService boardInfoService;
	
	@Autowired
	private BoardMainService boardMainService;
	
	@Resource
	private BoardAttachService boardAttachService;
	
	/** 게시판 전체 조회
	 * @param	String $boardUri from PathVariable
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView boardList(@PathVariable("boardUri") String boardUri) {
		logger.info("boardList 호출 성공");
		
		BoardInfoVO infoData = new BoardInfoVO();
		infoData.setBdinf_uri(boardUri);
		infoData = boardInfoService.infoDetail(infoData);
		
		ModelAndView mav = new ModelAndView();
		if (infoData != null) {
			BoardMainVO boardParam = new BoardMainVO();
			boardParam.setBdinf_index(infoData.getBdinf_index());
			boardParam.setBoardUri(infoData.getBdinf_uri());
			boardParam.setBoardType(infoData.getBdinf_type());
			List<BoardMainVO> boardList = boardMainService.boardList(boardParam);
			int listCount = boardMainService.boardListCount(boardParam);
			boardParam.setListCount(listCount);
			mav.addObject("boardList", boardList);
			mav.addObject("boardParam", boardParam);
			mav.addObject("infoData", infoData);
			mav.setViewName("board/default/listForm");
		} else {
			mav.addObject("result", "해당하는 게시판이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 게시판 전체 조회
	 * @param	String $boardUri from PathVariable
	 * @param	NoticeMainMainVO $param
	 * @return	BoardMainVO $boardList <br />
	 * 			BoardMainVO $boardParam <br />
	 *			BoardInfoVO $infoData
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ModelAndView boardList(@PathVariable("boardUri") String boardUri, @ModelAttribute BoardMainVO param) {
		logger.info("boardList 호출 성공");
		
		BoardInfoVO infoData = new BoardInfoVO();
		infoData.setBdinf_uri(boardUri);
		infoData.setBdinf_index(param.getBdinf_index());
		infoData = boardInfoService.infoDetail(infoData);
		
		ModelAndView mav = new ModelAndView();
		if (infoData != null) {
			param.setBd_index(0);
			param.setBdinf_index(infoData.getBdinf_index());
			param.setUs_index(0);
			param.setBoardUri(infoData.getBdinf_uri());
			param.setBoardType(infoData.getBdinf_type());
			List<BoardMainVO> boardList = boardMainService.boardList(param);
			int listCount = boardMainService.boardListCount(param);
			param.setListCount(listCount);
			mav.addObject("boardList", boardList);
			mav.addObject("boardParam", param);
			mav.addObject("infoData", infoData);
			mav.setViewName("board/default/listForm");
		} else {
			mav.addObject("result", "해당하는 게시판이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 게시판 본문 상세 보기
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardData <br />
	 * 			BoardMainVO $boardParam <br />
	 * 			BoardAttachVO $attachList
	 */
	@RequestMapping(value="/detail.do", method=RequestMethod.POST)
	public ModelAndView boardDetail(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDetail 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			param.setUs_index(userData.getUs_index());
		} else {
			param.setUs_index(0);
		}
		BoardMainVO boardData = boardMainService.boardDetail(param);
		
		ModelAndView mav = new ModelAndView();
		if (boardData != null) {
			boardMainService.boardCheck(param);
			BoardAttachVO attachParam = new BoardAttachVO();
			attachParam.setBd_index(param.getBd_index());
			List<BoardAttachVO> attachList = boardAttachService.attachList(attachParam);
			BoardInfoVO infoData = new BoardInfoVO();
			infoData.setBdinf_index(param.getBdinf_index());
			infoData = boardInfoService.infoDetail(infoData);
			if (infoData != null) {
				boardData.setBoardType(infoData.getBdinf_type());
				if (infoData.getBdinf_type() == 1) {
					List<BoardMainVO> replyList = boardMainService.boardReplyList(param);
					mav.addObject("replyList", replyList);
				}
			}
			mav.addObject("boardData", boardData);
			mav.addObject("boardParam", param);
			mav.addObject("attachList", attachList);
			mav.addObject("infoData", infoData);
			mav.setViewName("board/default/detailForm");
		} else {
			mav.addObject("result", "해당하는 게시물이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 게시판 본문 작성창 호출
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	UserMainVO $userData <br />
	 * 			BoardMainVO $boardParam
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public ModelAndView boardWrite(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardWrite 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
			mav.addObject("userData", userData);
			mav.addObject("boardParam", param);
			mav.setViewName("board/default/writeForm");
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 본문 작성
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	BoardMainVO $boardParam
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView boardInsert(@ModelAttribute BoardMainVO param, HttpServletRequest request) throws Exception {
		logger.info("boardInsert 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			param.setBd_index(0);
			param.setUs_index(userData.getUs_index());
			if (param.getBd_step() == 0) {
				param.setPage(1);
			} else {
				boardMainService.boardReplyIndent(param);
			}
			int result = boardMainService.boardInsert(param);
			if (result == 1) {
				if (param.getAttachUpload() != null) {
					for (MultipartFile fileData : param.getAttachUpload()) {
						String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
						if (bdatt_path != null && !bdatt_path.equals("")) {
							BoardAttachVO attachParam = new BoardAttachVO();
							attachParam.setBd_index(param.getBd_index());
							attachParam.setBdatt_path(bdatt_path);
							boardAttachService.attachInsert(attachParam);
						}
					}
				}
				param.setSearch("");
				param.setKeyword("");
				mav.addObject("boardParam", param);
				mav.setViewName("board/common/returnList");
			} else {
				mav.addObject("result", "글 작성에 실패하였습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 본문 수정창 호출
	 * @param	NoticeMainMainVO $param 
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardMainVO $boardData <br />
	 * 			BoardMainVO $boardParam <br />
	 * 			BoardAttachVO $attachList
	 */
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public ModelAndView boardEdit(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardEdit 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			BoardMainVO boardData = boardMainService.boardDetail(param);
			BoardAttachVO attachParam = new BoardAttachVO();
			attachParam.setBd_index(param.getBd_index());
			List<BoardAttachVO> attachList = boardAttachService.attachList(attachParam);
			mav.addObject("boardData", boardData);
			mav.addObject("boardParam", param);
			mav.addObject("attachList", attachList);
			mav.setViewName("board/default/editForm");
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 본문 수정
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	BoardMainVO $boardParam
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView boardUpdate(@ModelAttribute BoardMainVO param, HttpServletRequest request) throws Exception {
		logger.info("boardUpdate 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			int result = boardMainService.boardUpdate(param);
			if (result == 1) {
				if (param.getAttachDelete() != null) {
					for (Integer fileIndex : param.getAttachDelete()) {
						if (fileIndex != null) {
							BoardAttachVO attachParam = new BoardAttachVO();
							attachParam.setBdatt_index(fileIndex);
							attachParam.setBd_index(param.getBd_index());
							boardAttachService.attachDelete(attachParam);
						}
					}
				}
				if (param.getAttachUpload() != null) {
					for (MultipartFile fileData : param.getAttachUpload()) {
						String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
						if (bdatt_path != null && !bdatt_path.equals("")) {
							BoardAttachVO attachParam = new BoardAttachVO();
							attachParam.setBd_index(param.getBd_index());
							attachParam.setBdatt_path(bdatt_path);
							boardAttachService.attachInsert(attachParam);
						}
					}
				}
				mav.addObject("boardParam", param);
				mav.setViewName("board/common/returnList");
			} else {
				mav.addObject("result", "글 수정에 실패하였습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 본문 삭제
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO (
	 * @return	BoardMainVO $boardParam
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView boardDelete(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardDelete 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			int replyCount = boardMainService.boardReplyCount(param);
			if (replyCount > 0) {
				mav.addObject("result", "답변이 있어 삭제를 할 수 없습니다.");
				mav.setViewName("board/common/returnError");
			} else {
				param.setUs_index(userData.getUs_index());
				int result = boardMainService.boardDelete(param);
				if (result == 1) {
					mav.addObject("boardParam", param);
					mav.setViewName("board/common/returnList");
				} else {
					mav.addObject("result", "글 삭제에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 삭제할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 게시판 답변 작성창 호출
	 * @param	NoticeMainMainVO $param 
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	String
	 */
	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public ModelAndView boardReply(@ModelAttribute BoardMainVO param, HttpServletRequest request) {
		logger.info("boardReply 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
			BoardMainVO boardOrigin = boardMainService.boardDetail(param);
			param.setBd_parent(param.getBd_index());
			param.setBd_step(param.getBd_step() + 1);
			param.setBd_indent(param.getBd_indent() + 1);
			mav.addObject("userData", userData);
			mav.addObject("boardOrigin", boardOrigin);
			mav.addObject("boardParam", param);
			mav.setViewName("board/default/writeForm");
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
}