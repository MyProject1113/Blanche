package com.blanche.board.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blanche.board.service.BoardService;
import com.blanche.board.vo.BoardVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/board")	// url 값에 무조건 /board 가 포함되어 있으면...
public class BoardController {
	Logger logger = Logger.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;	// 인터페이스 구현체 생성
	
	/****************************************************************
	 * 글목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
	public String boardList(Model model) {
		logger.info("boardList 호출 성공");
		
		List<BoardVO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		
		return "board/boardList";	// View Name => 파일명 아님!!!
	}

	/****************************************************************
	 * 글쓰기 폼 출력하기
	 ****************************************************************/
	@RequestMapping(value="/writeForm.do")
	public String writeForm() {
		logger.info("writeForm 호출 성공");
		
		return "board/writeForm";	// View Name => 파일명 아님!!!
	}

	/****************************************************************
	 * 글쓰기 구현하기
	 ****************************************************************/
	@RequestMapping(value="/boardInsert.do", method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute BoardVO bvo) {
		logger.info("boardInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardInsert(bvo);
		if (result == 1) {
			url = "/board/boardList.do";
		}
		
		return "redirect:" + url;
	}

	/****************************************************************
	 * 글 상세 구현하기
	 ****************************************************************/
	@RequestMapping(value="/boardDetail.do", method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO bvo, Model model) {
		logger.info("boardDetail 호출 성공");
		logger.info("b_num = " + bvo.getB_num());
		
		BoardVO detail = new BoardVO();
		detail = boardService.boardDetail(bvo);
		
		if (detail != null && (!detail.equals(""))) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "board/boardDetail";
	}
	
	/****************************************************************
	 * 비밀번호 확인
	 * @param		b_num
	 * @param		b_pwd
	 * @return 	int
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라
	 * 			HTTP Response Body에 직접 출력하는 방식.
	 ****************************************************************/
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST)
	public String pwdConfirm(@ModelAttribute BoardVO bvo) {
		logger.info("pwdConfirm 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = boardService.pwdConfirm(bvo);
		logger.info("result = " + result);
		
		return result + "";
	}

	/****************************************************************
	 * 글수정 폼 출력하기
	 ****************************************************************/
	@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
	public String updateForm(@ModelAttribute BoardVO bvo, Model model) {
		logger.info("updateForm 호출 성공");
		logger.info("b_num = " + bvo.getB_num());

		BoardVO updateData = new BoardVO();
		updateData = boardService.boardDetail(bvo);
		
		model.addAttribute("updateData", updateData);
		return "board/updateForm";
	}
	
	/****************************************************************
	 * 글 수정 구현하기
	 ****************************************************************/
	@RequestMapping(value="/boardUpdate.do", method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo) {
		logger.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = boardService.boardUpdate(bvo);
		if (result == 1) {
			url = "/board/boardDetail.do?b_num=" + bvo.getB_num();	// 수정 후 상세 페이지로 이동
		}
		
		return "redirect:" + url;
	}

	/****************************************************************
	 * 글 삭제 구현하기
	 ****************************************************************/
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.POST)
	public String boardDelete(@ModelAttribute BoardVO bvo) {
		logger.info("boardDelete 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 담습니다. (1 or 0)
		int result = 0;
		String url = "";
		
		result = boardService.boardDelete(bvo.getB_num());
		if (result == 1) {
			url = "/board/boardList.do";
		}
		
		return "redirect:" + url;
	}
	
	
	@RequestMapping(value="/payment.do")
	public String introList(Model model) {
		logger.info("introList 호출 성공");
		
		/*List<BoardVO> boardList = boardService.introList();
		model.addAttribute("intro", boardList);*/
		
		return "board/payment";	// View Name => 파일명 아님!!!
	}

}
