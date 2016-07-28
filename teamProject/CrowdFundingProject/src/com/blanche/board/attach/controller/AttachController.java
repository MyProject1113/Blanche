package com.blanche.board.attach.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.board.attach.vo.BoardAttachVO;
import com.blanche.board.common.file.FileUploadUtil;
import com.blanche.common.constant.Constant;

@RestController
@RequestMapping(value="/board/attach")
public class AttachController implements Constant {
	private static Logger logger = Logger.getLogger(AttachController.class);
	
	/** 첨부파일 전송
	 * @param	BoardAttachVO $param
	 * @return	BoardAttachDTO $attachParam
	 */
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public ModelAndView attachUpload(@ModelAttribute BoardAttachVO param, HttpServletRequest request) throws Exception {
		logger.info("attachUpload 호출 성공");
		
		String filePath = FileUploadUtil.fileUpload(param.getUpload(), request);
		param.setBdatt_path(filePath);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("attachParam", param);
		mav.setViewName(VIEW_IMAGE_UPLOAD);
		
		return mav;
	}
}