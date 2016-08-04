package com.blanche.establish.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.blanche.establish.service.ReplyService;
import com.blanche.establish.vo.ReplyVO;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	private static Logger logger = Logger.getLogger(ReplyController.class);

	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value="/list.do")
	public ResponseEntity<List<ReplyVO>> replyList(@RequestBody ReplyVO param, HttpServletRequest request) {
		logger.info("replyList 호출 성공");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			List<ReplyVO> list = replyService.replyList(param);
			entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO param) {
		logger.info("replyInsert 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			int result = replyService.replyInsert(param);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/check.do", method=RequestMethod.POST)
	public ResponseEntity<String> replyCheck(@RequestBody ReplyVO param) {
		logger.info("replyCheck 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			int result = replyService.replyCheck(param);
			if (result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}