package com.blanche.board.comment.controller;

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

import com.blanche.board.comment.service.BoardCommentService;
import com.blanche.board.comment.vo.BoardCommentVO;
import com.blanche.board.main.controller.BoardMainController;
import com.blanche.common.constant.Constant;
import com.blanche.user.main.vo.UserMainVO;

@RestController
@RequestMapping(value="/board/comment")
public class BoardCommentController implements Constant {
	private static Logger logger = Logger.getLogger(BoardMainController.class);
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	/** 댓글 전체 조회
	 * @param	BoardCommentVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	BoardCommentVO
	 */
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	public ResponseEntity<List<BoardCommentVO>> commentList(@RequestBody BoardCommentVO param, HttpServletRequest request) {
		logger.info("commentList 호출 성공");
		
		ResponseEntity<List<BoardCommentVO>> entity = null;
		try {
			UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
			if (userData != null) {
				param.setUs_index(userData.getUs_index());
			} else {
				param.setUs_index(0);
			}
			List<BoardCommentVO> list = boardCommentService.commentList(param);
			entity = new ResponseEntity<List<BoardCommentVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<BoardCommentVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/** 댓글 작성
	 * @param	BoardCommentVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	String
	 */
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ResponseEntity<String> commentInsert(@RequestBody BoardCommentVO param, HttpServletRequest request) {
		logger.info("commentInsert 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
			if (userData != null) {
				param.setUs_index(userData.getUs_index());
				int result = boardCommentService.commentInsert(param);
				if (result == 1) {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
			} else {
				entity = new ResponseEntity<String>("LOGOUT", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 댓글 수정
	 * @param	BoardCommentVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	String
	 */
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ResponseEntity<String> commentUpdate(@RequestBody BoardCommentVO param, HttpServletRequest request) {
		logger.info("commentUpdate 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
			if (userData != null) {
				param.setUs_index(userData.getUs_index());
				int result = boardCommentService.commentUpdate(param);
				if (result == 1) {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
			} else {
				entity = new ResponseEntity<String>("LOGOUT", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 댓글 삭제
	 * @param	BoardCommentVO $param
	 * @param	HttpServletRequest $request for UserMainVO
	 * @return	String
	 */
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public ResponseEntity<String> commentDelete(@RequestBody BoardCommentVO param, HttpServletRequest request) {
		logger.info("commentDelete 호출 성공");
		
		ResponseEntity<String> entity = null;
		try {
			UserMainVO userData = (UserMainVO) request.getSession().getAttribute(SESSION_USER_DATA);
			if (userData != null) {
				param.setUs_index(userData.getUs_index());
				int result = boardCommentService.commentDelete(param);
				if (result == 1) {
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
			} else {
				entity = new ResponseEntity<String>("LOGOUT", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	/** 댓글 페이지
	 * @param	BoardCommentVO $param
	 * @return	BoardCommentVO
	 */
	@RequestMapping(value="/page.do", method=RequestMethod.POST)
	public ResponseEntity<BoardCommentVO> commentPageCount(@RequestBody BoardCommentVO param) {
		logger.info("commentPageCount 호출 성공");
		
		ResponseEntity<BoardCommentVO> entity = null;
		try {
			int listCount = boardCommentService.commentListCount(param);
			param.setListCount(listCount);
			entity = new ResponseEntity<BoardCommentVO>(param, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (entity == null) {
				entity = new ResponseEntity<BoardCommentVO>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
}