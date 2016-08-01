package com.blanche.notice.attach.controller;

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

import com.blanche.board.common.file.FileUploadUtil;
import com.blanche.common.constant.Constant;
import com.blanche.notice.attach.service.NoticeAttachService;
import com.blanche.notice.attach.vo.NoticeAttachVO;

@RestController
@RequestMapping(value="/notice/attach")
public class NoticeAttachController implements Constant {
	private static Logger logger = Logger.getLogger(NoticeAttachController.class);
	
	@Autowired
	private NoticeAttachService noticeAttachService;
	
	/** 첨부파일 전체 조회
	 * @param	FaqAttachVO $param
	 * @return	NoticeAttachVO 
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ResponseEntity<List<NoticeAttachVO>> attachList(@RequestBody NoticeAttachVO param) {
		logger.info("attachList 호출 성공");
		
		ResponseEntity<List<NoticeAttachVO>> entity = null;
		try {
			List<NoticeAttachVO> list = noticeAttachService.attachList(param);
			entity = new ResponseEntity<List<NoticeAttachVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<NoticeAttachVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/** 첨부파일 전송
	 * @param	FaqAttachVO $param
	 * @return	NoticeAttachVO $attachParam
	 */
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public ModelAndView attachUpload(@ModelAttribute NoticeAttachVO param, HttpServletRequest request) throws Exception {
		logger.info("attachUpload 호출 성공");
		
		String filePath = FileUploadUtil.fileUpload(param.getUpload(), request);
		param.setNtatt_path(filePath);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("attachParam", param);
		mav.setViewName("board/common/imageUpload");
		
		return mav;
	}
}