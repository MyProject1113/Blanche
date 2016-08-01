package com.blanche.faq.main.controller;

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
import com.blanche.faq.attach.service.FaqAttachService;
import com.blanche.faq.attach.vo.FaqAttachVO;
import com.blanche.faq.main.service.FaqMainService;
import com.blanche.faq.main.vo.FaqMainVO;
import com.blanche.user.main.service.UserMainService;
import com.blanche.user.main.vo.UserMainVO;

@Controller
@RequestMapping(value = "/faq")
public class FaqMainController implements Constant {
	private static Logger logger = Logger.getLogger(FaqMainController.class);
	
	@Autowired
	private UserMainService userMainService;
	
	@Autowired
	private FaqMainService faqMainService;
	
	@Autowired
	private FaqAttachService faqAttachService;
	
	/** 공지게시판 전체 조회
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	FaqMainVO $faqList <br />
	 * 			FaqMainVO $faqParam <br />
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView faqList(HttpServletRequest request) {
		logger.info("faqList 호출 성공");
		
		FaqMainVO faqParam = new FaqMainVO();
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				faqParam.setWritable(1);
			} else {
				faqParam.setWritable(0);
			}
		} else {
			faqParam.setWritable(0);
		}
		List<FaqMainVO> faqList = faqMainService.faqList(faqParam);
		int listCount = faqMainService.faqListCount(faqParam);
		faqParam.setListCount(listCount);
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqList", faqList);
		mav.addObject("faqParam", faqParam);
		mav.setViewName("faq/listForm");
		
		return mav;
	}
	
	/** 공지게시판 전체 조회
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	FaqMainVO $faqList <br />
	 * 			FaqMainVO $faqParam <br />
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ModelAndView faqList(@ModelAttribute FaqMainVO param, HttpServletRequest request) {
		logger.info("faqList 호출 성공");
		
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
		List<FaqMainVO> faqList = faqMainService.faqList(param);
		int listCount = faqMainService.faqListCount(param);
		param.setListCount(listCount);
		ModelAndView mav = new ModelAndView();
		mav.addObject("faqList", faqList);
		mav.addObject("faqParam", param);
		mav.setViewName("faq/listForm");
		
		return mav;
	}
	
	/** 공지게시판 본문 상세 보기
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	FaqMainVO $faqData <br />
	 * 			FaqMainVO $faqParam <br />
	 * 			FaqAttachVO $attachList
	 */
	@RequestMapping(value="/detail.do", method=RequestMethod.POST)
	public ModelAndView faqDetail(@ModelAttribute FaqMainVO param, HttpServletRequest request) {
		logger.info("faqDetail 호출 성공");
		
		FaqMainVO faqData = faqMainService.faqDetail(param);
		ModelAndView mav = new ModelAndView();
		if (faqData != null) {
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
			faqMainService.faqCheck(param);
			FaqAttachVO attachParam = new FaqAttachVO();
			attachParam.setFq_index(param.getFq_index());
			List<FaqAttachVO> attachList = faqAttachService.attachList(attachParam);
			mav.addObject("faqData", faqData);
			mav.addObject("faqParam", param);
			mav.addObject("attachList", attachList);
			mav.setViewName("faq/detailForm");
		} else {
			mav.addObject("result", "해당하는 게시물이 존재하지 않습니다.");
			mav.setViewName("board/common/returnError");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 작성창 호출
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	UserMainVO $userData <br />
	 * 			FaqMainVO $faqParam
	 */
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public ModelAndView faqWrite(@ModelAttribute FaqMainVO param, HttpServletRequest request) {
		logger.info("faqWrite 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				userData = userMainService.userData(userData);
				mav.addObject("userData", userData);
				mav.addObject("faqParam", param);
				mav.setViewName("faq/writeForm");
			} else {
				mav.addObject("result", "운영자만 글을 작성할 수 있씁니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 작성
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	FaqMainVO $faqParam
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView faqInsert(@ModelAttribute FaqMainVO param, HttpServletRequest request) throws Exception {
		logger.info("faqInsert 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setFq_index(0);
				param.setUs_index(userData.getUs_index());
				int result = faqMainService.faqInsert(param);
				if (result == 1) {
					if (param.getAttachUpload() != null) {
						for (MultipartFile fileData : param.getAttachUpload()) {
							String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
							if (bdatt_path != null && !bdatt_path.equals("")) {
								FaqAttachVO attachParam = new FaqAttachVO();
								attachParam.setFq_index(param.getFq_index());
								attachParam.setFqatt_path(bdatt_path);
								faqAttachService.attachInsert(attachParam);
							}
						}
					}
					param.setSearch("");
					param.setKeyword("");
					mav.addObject("faqParam", param);
					mav.setViewName("faq/returnList");
				} else {
					mav.addObject("result", "글 작성에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			} else {
				mav.addObject("result", "운영자만 글을 작성할 수 있씁니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 작성할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 수정창 호출
	 * @param	FaqMainMainVO $param 
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	FaqMainVO $faqData <br />
	 * 			FaqMainVO $faqParam <br />
	 * 			FaqAttachVO $attachList
	 */
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public ModelAndView faqEdit(@ModelAttribute FaqMainVO param, HttpServletRequest request) {
		logger.info("faqEdit 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				FaqMainVO faqData = faqMainService.faqDetail(param);
				FaqAttachVO attachParam = new FaqAttachVO();
				attachParam.setFq_index(param.getFq_index());
				List<FaqAttachVO> attachList = faqAttachService.attachList(attachParam);
				mav.addObject("faqData", faqData);
				mav.addObject("faqParam", param);
				mav.addObject("attachList", attachList);
				mav.setViewName("faq/editForm");
			} else {
				mav.addObject("result", "운영자만 글을 수정할 수 있씁니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 수정
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO and MultipartFile
	 * @return	FaqMainVO $faqParam
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView faqUpdate(@ModelAttribute FaqMainVO param, HttpServletRequest request) throws Exception {
		logger.info("faqUpdate 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				int result = faqMainService.faqUpdate(param);
				if (result == 1) {
					if (param.getAttachDelete() != null) {
						for (Integer fileIndex : param.getAttachDelete()) {
							if (fileIndex != null) {
								FaqAttachVO attachParam = new FaqAttachVO();
								attachParam.setFqatt_index(fileIndex);
								attachParam.setFq_index(param.getFq_index());
								faqAttachService.attachDelete(attachParam);
							}
						}
					}
					if (param.getAttachUpload() != null) {
						for (MultipartFile fileData : param.getAttachUpload()) {
							String bdatt_path = FileUploadUtil.fileUpload(fileData, request);
							if (bdatt_path != null && !bdatt_path.equals("")) {
								FaqAttachVO attachParam = new FaqAttachVO();
								attachParam.setFq_index(param.getFq_index());
								attachParam.setFqatt_path(bdatt_path);
								faqAttachService.attachInsert(attachParam);
							}
						}
					}
					mav.addObject("faqParam", param);
					mav.setViewName("faq/returnList");
				} else {
					mav.addObject("result", "글 수정에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			} else {
				mav.addObject("result", "운영자만 글을 수정할 수 있씁니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 수정할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
	
	/** 공지게시판 본문 삭제
	 * @param	FaqMainMainVO $param
	 * @param	HttpServletRequest $request for UserMainVO (
	 * @return	FaqMainVO $faqParam
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ModelAndView faqDelete(@ModelAttribute FaqMainVO param, HttpServletRequest request) {
		logger.info("faqDelete 호출 성공");
		
		UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
		ModelAndView mav = new ModelAndView();
		if (userData != null) {
			userData = userMainService.userData(userData);
		}
		if (userData != null) {
			if (userData.getUs_rank() == ADMIN_ID_RANK) {
				param.setUs_index(userData.getUs_index());
				int result = faqMainService.faqDelete(param);
				if (result == 1) {
					mav.addObject("faqParam", param);
					mav.setViewName("faq/returnList");
				} else {
					mav.addObject("result", "글 삭제에 실패하였습니다.");
					mav.setViewName("board/common/returnError");
				}
			} else {
				mav.addObject("result", "운영자만 글을 삭제할 수 있씁니다.");
				mav.setViewName("board/common/returnError");
			}
		} else {
			mav.addObject("loginMessage", "로그인 상태에서만 글을 삭제할 수 있습니다.");
			mav.setViewName("board/common/returnLogin");
		}
		
		return mav;
	}
}