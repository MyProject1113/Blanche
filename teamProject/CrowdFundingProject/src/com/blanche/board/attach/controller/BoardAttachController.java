package com.blanche.board.attach.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blanche.board.attach.service.BoardAttachService;
import com.blanche.board.attach.vo.BoardAttachVO;
import com.blanche.board.common.file.FileUploadUtil;
import com.blanche.common.constant.Constant;

@RestController
@RequestMapping(value="/board/attach")
public class BoardAttachController implements Constant {
	private static Logger logger = Logger.getLogger(BoardAttachController.class);

	@Resource
	private BoardAttachService boardAttachService;

	/** 첨부파일 전체 조회
	 * @param	BoardAttachVO $param
	 * @return	BoardAttachVO 
	 */

	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ResponseEntity<List<BoardAttachVO>> attachList(@RequestBody BoardAttachVO param) {
		logger.info("attachList 호출 성공");
		
		ResponseEntity<List<BoardAttachVO>> entity = null;
		try {
			List<BoardAttachVO> list = boardAttachService.attachList(param);
			entity = new ResponseEntity<List<BoardAttachVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BoardAttachVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/** 첨부파일 전송
	 * @param	BoardAttachVO $param
	 * @return	BoardAttachVO $attachParam
	 */
	@RequestMapping(value="/upload.do", method=RequestMethod.POST)
	public ModelAndView attachUpload(@ModelAttribute BoardAttachVO param, HttpServletRequest request) throws Exception {
		logger.info("attachUpload 호출 성공");
		
		String filePath = FileUploadUtil.fileUpload(param.getUpload(), request);
		param.setBdatt_path(filePath);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("attachParam", param);
		mav.setViewName("board/common/imageUpload");
		
		return mav;
	}
}