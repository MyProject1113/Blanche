package com.blanche.cc.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blanche.cc.service.CcService;
import com.blanche.cc.vo.CcVO;

/* 컨트롤러 */
@Controller
@RequestMapping(value="/cc")	// url 값에 무조건 /board 가 포함되어 있으면...
public class CcController {
	Logger logger = Logger.getLogger(CcController.class);
	
/*	@Autowired
	private CcService ccService;	// 인터페이스 구현체 생성
*/	
	/****************************************************************
	 * FAQ 구현하기
	 ****************************************************************/
	@RequestMapping(value="/faq.do")
	public String faq(Model model) {
		logger.info("faq 호출 성공");
		/*
		List<CcVO> ccList = ccService.ccList();
		model.addAttribute("ccList", ccList);
		*/
		return "cc/faq";	
	 }
	/*	
	*//****************************************************************
	 * FAQ 폼 출력하기
	 ****************************************************************//*
	@RequestMapping(value="/faq.do")
	public String writeForm() {
		logger.info("faq 호출 성공");
		
		return "faq";	// View Name => 파일명 아님!!!
	}*/

/*	
	*//****************************************************************
	 * 글쓰기 구현하기
	 ****************************************************************//*
	@RequestMapping(value="/ccInsert.do", method=RequestMethod.POST)
	public String ccInsert(@ModelAttribute CcVO cvo) {
		logger.info("ccInsert 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = ccService.ccInsert(cvo);
		if (result == 1) {
			url = "/cc/ccList.do";
		}
		
		return "redirect:" + url;
	}

	*//****************************************************************
	 * 글 상세 구현하기
	 ****************************************************************//*
	@RequestMapping(value="/ccDetail.do", method=RequestMethod.GET)
	public String ccDetail(@ModelAttribute CcVO cvo, Model model) {
		logger.info("ccDetail 호출 성공");
		logger.info("b_num = " + cvo.getB_num());
		
		CcVO detail = new CcVO();
		detail = ccService.ccDetail(cvo);
		
		if (detail != null && (!detail.equals(""))) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "cc/ccDetail";
	}
	
	*//****************************************************************
	 * 비밀번호 확인
	 * @param		b_num
	 * @param		b_pwd
	 * @return 	int
	 * 참고 : @ResponseBody는 전달된 뷰를 통해서 출력하는 것이 아니라
	 * 			HTTP Response Body에 직접 출력하는 방식.
	 ****************************************************************//*
	@ResponseBody	// 현재 요청값을 브라우저에 바로 출력
	@RequestMapping(value="/pwdConfirm.do", method=RequestMethod.POST)
	public String pwdConfirm(@ModelAttribute CcVO cvo) {
		logger.info("pwdConfirm 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		int result = 0;
		result = ccService.pwdConfirm(cvo);
		logger.info("result = " + result);
		
		return result + "";
	}

	*//****************************************************************
	 * 글수정 폼 출력하기
	 ****************************************************************//*
	@RequestMapping(value="/updateForm.do", method=RequestMethod.POST)
	public String updateForm(@ModelAttribute CcVO cvo, Model model) {
		logger.info("updateForm 호출 성공");
		logger.info("b_num = " + cvo.getB_num());

		CcVO updateData = new CcVO();
		updateData = ccService.ccDetail(cvo);
		
		model.addAttribute("updateData", updateData);
		return "cc/updateForm";
	}
	
	*//****************************************************************
	 * 글 수정 구현하기
	 ****************************************************************//*
	@RequestMapping(value="/ccUpdate.do", method=RequestMethod.POST)
	public String ccUpdate(@ModelAttribute CcVO cvo) {
		logger.info("ccUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = ccService.ccUpdate(cvo);
		if (result == 1) {
			url = "/cc/ccDetail.do?b_num=" + cvo.getB_num();	// 수정 후 상세 페이지로 이동
		}
		
		return "redirect:" + url;
	}

	*//****************************************************************
	 * 글 삭제 구현하기
	 ****************************************************************//*
	@RequestMapping(value="/ccDelete.do", method=RequestMethod.POST)
	public String ccDelete(@ModelAttribute CcVO cvo) {
		logger.info("ccDelete 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태값 담습니다. (1 or 0)
		int result = 0;
		String url = "";
		
		result = ccService.ccDelete(cvo.getB_num());
		if (result == 1) {
			url = "/cc/ccList.do";
		}
		
		return "redirect:" + url;
	}

*/
}
