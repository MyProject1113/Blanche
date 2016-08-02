package com.blanche.notice.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.board.common.file.FileUploadUtil;
import com.blanche.common.constant.Constant;
import com.blanche.notice.attach.service.NoticeAttachService;
import com.blanche.notice.attach.vo.NoticeAttachVO;
import com.blanche.notice.main.service.NoticeMainService;
import com.blanche.notice.main.vo.NoticeMainVO;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeMainController implements Constant {
	private static Logger logger = Logger.getLogger(NoticeMainController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private NoticeMainService noticeMainService;
	
	@Autowired
	private NoticeAttachService noticeAttachService;
	
	/** 공지게시판 전체 조회
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	NoticeMainVO $noticeList <br />
	 * 			NoticeMainVO $noticeParam <br />
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request) {
		logger.info("noticeList 호출 성공");
		
		NoticeMainVO noticeParam = new NoticeMainVO();
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				noticeParam.setWritable(1);
			} else {
				noticeParam.setWritable(0);
			}
		} else {
			noticeParam.setWritable(0);
		}
		List<NoticeMainVO> noticeList = noticeMainService.noticeList(noticeParam);
		int listCount = noticeMainService.noticeListCount(noticeParam);
		noticeParam.setListCount(listCount);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", noticeList);
		mav.addObject("noticeParam", noticeParam);
		mav.setViewName("notice/listForm");
		
		return mav;
	}
	
	/** 공지게시판 전체 조회
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	NoticeMainVO $noticeList <br />
	 * 			NoticeMainVO $noticeParam <br />
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ModelAndView noticeList(@ModelAttribute NoticeMainVO param, HttpServletRequest request) {
		logger.info("noticeList 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setWritable(1);
			} else {
				param.setWritable(0);
			}
		} else {
			param.setWritable(0);
		}
		List<NoticeMainVO> noticeList = noticeMainService.noticeList(param);
		int listCount = noticeMainService.noticeListCount(param);
		param.setListCount(listCount);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", noticeList);
		mav.addObject("noticeParam", param);
		mav.setViewName("notice/listForm");
		
		return mav;
	}
	
	/** 공지게시판 본문 상세 보기
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	NoticeMainVO $noticeData <br />
	 * 			NoticeMainVO $noticeParam <br />
	 * 			NoticeAttachVO $attachList
	 */
	@RequestMapping(value="/detail.do", method=RequestMethod.POST)
	public ModelAndView noticeDetail(@ModelAttribute NoticeMainVO param, HttpServletRequest request) {
		logger.info("noticeDetail 호출 성공");
		
		NoticeMainVO noticeData = noticeMainService.noticeDetail(param);
		ModelAndView mav = new ModelAndView();
		if (noticeData != null) {
			UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
			if (userData != null) {
				userData = userMainService.userData(userData);
			}
			if (userData != null) {
				if (userData.getUs_rank() == ADMIN_ID_RANK) {
					param.setEditable(1);
				} else {
					param.setEditable(0);
				}
			} else {
				param.setEditable(0);
			}
			noticeMainService.noticeCheck(param);
			NoticeAttachVO attachParam = new NoticeAttachVO();
			attachParam.setNt_index(param.getNt_index());
			List<NoticeAttachVO> attachList = noticeAttachService.attachList(attachParam);
			mav.addObject("noticeData", noticeData);
			mav.addObject("noticeParam", param);
			mav.addObject("attachList", attachList);
			mav.setViewName("notice/detailForm");
		} else {
			mav.addObject("result", "해당하는 게시물이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 작성창 호출
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	UserMainVO $userData <br />
	 * 			NoticeMainVO $noticeParam
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute NoticeMainVO param, HttpServletRequest request) {
		logger.info("noticeWrite 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				userData = userMainService.userData(userData);
				mav.addObject("userData", userData);
				mav.addObject("noticeParam", param);
				mav.setViewName("notice/writeForm");
			} else {
				mav.addObject("result", "운영자만 글을 작성할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 작성
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	NoticeMainVO $noticeParam
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView noticeInsert(@ModelAttribute NoticeMainVO param, HttpServletRequest request) throws Exception {
		logger.info("noticeInsert 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setNt_index(0);
				param.setUs_index(userData.getUs_index());
				int result = noticeMainService.noticeInsert(param);
				if (result == 1) {
					if (param.getAttachUpload() != null) {
						for (MultipartFile fileData : param.getAttachUpload()) {
							String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
							if (bdatt_path != null && !bdatt_path.equals("")) {
								NoticeAttachVO attachParam = new NoticeAttachVO();
								attachParam.setNt_index(param.getNt_index());
								attachParam.setNtatt_path(bdatt_path);
								noticeAttachService.attachInsert(attachParam);
							}
						}
					}
					param.setSearch("");
					param.setKeyword("");
					mav.addObject("noticeParam", param);
					mav.setViewName("notice/returnList");
				} else {
					mav.addObject("result", "글 작성에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			} else {
				mav.addObject("result", "운영자만 글을 작성할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 수정창 호출
	 * @param	NoticeMainMainVO $param 
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	NoticeMainVO $noticeData <br />
	 * 			NoticeMainVO $noticeParam <br />
	 * 			NoticeAttachVO $attachList
	 */
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public ModelAndView noticeEdit(@ModelAttribute NoticeMainVO param, HttpServletRequest request) {
		logger.info("noticeEdit 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				NoticeMainVO noticeData = noticeMainService.noticeDetail(param);
				NoticeAttachVO attachParam = new NoticeAttachVO();
				attachParam.setNt_index(param.getNt_index());
				List<NoticeAttachVO> attachList = noticeAttachService.attachList(attachParam);
				mav.addObject("noticeData", noticeData);
				mav.addObject("noticeParam", param);
				mav.addObject("attachList", attachList);
				mav.setViewName("notice/editForm");
			} else {
				mav.addObject("result", "운영자만 글을 수정할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 수정
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	NoticeMainVO $noticeParam
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView noticeUpdate(@ModelAttribute NoticeMainVO param, HttpServletRequest request) throws Exception {
		logger.info("noticeUpdate 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				int result = noticeMainService.noticeUpdate(param);
				if (result == 1) {
					if (param.getAttachDelete() != null) {
						for (Integer fileIndex : param.getAttachDelete()) {
							if (fileIndex != null) {
								NoticeAttachVO attachParam = new NoticeAttachVO();
								attachParam.setNtatt_index(fileIndex);
								attachParam.setNt_index(param.getNt_index());
								noticeAttachService.attachDelete(attachParam);
							}
						}
					}
					if (param.getAttachUpload() != null) {
						for (MultipartFile fileData : param.getAttachUpload()) {
							String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
							if (bdatt_path != null && !bdatt_path.equals("")) {
								NoticeAttachVO attachParam = new NoticeAttachVO();
								attachParam.setNt_index(param.getNt_index());
								attachParam.setNtatt_path(bdatt_path);
								noticeAttachService.attachInsert(attachParam);
							}
						}
					}
					mav.addObject("noticeParam", param);
					mav.setViewName("notice/returnList");
				} else {
					mav.addObject("result", "글 수정에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			} else {
				mav.addObject("result", "운영자만 글을 수정할 수 있습니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 삭제
	 * @param	NoticeMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO (
	 * @return	NoticeMainVO $noticeParam
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView noticeDelete(@ModelAttribute NoticeMainVO param, HttpServletRequest request) {
		logger.info("noticeDelete 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setUs_index(userData.getUs_index());
				int result = noticeMainService.noticeDelete(param);
				if (result == 1) {
					mav.addObject("noticeParam", param);
					mav.setViewName("notice/returnList");
				} else {
					mav.addObject("result", "글 삭제에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
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