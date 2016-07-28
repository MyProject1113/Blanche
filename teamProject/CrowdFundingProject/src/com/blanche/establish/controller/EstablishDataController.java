package com.blanche.establish.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.blanche.establish.service.ApplicationService;
import com.blanche.establish.vo.ApplicationVO;


/**************************************************************
 * REST(Representational State Transfer)의 약어로
 * 하나의 URI는 하나의 고유한 리소스를 대표하도록 설계된다는 개념이다.
 * REST방식은 특정 URL는 반드시 그에 상응하는 데이터 자체라는 것을 의미하는 방식이다.
 **************************************************************/

/**************************************************************
 * 참고 : @RestController (@Controller + @ResponesBody)
 * 기존의 특정한 JSP와 같은 뷰를 만들어 내는 것이 목적이 아닌 REST 방식의 데이터 처리를
 * 위해서 사용하는(데이터 자체를 반환) 어노테이션이다.
 **************************************************************/

@RestController
@RequestMapping(value="/establish")
public class EstablishDataController {
	Logger logger = Logger.getLogger(EstablishDataController.class);
	
	@Autowired
	private ApplicationService applicationService;
	
	/****************************************************************
	 * 댓글 글목록 구현하기
	 ****************************************************************/
	@RequestMapping(value="/all/{app_index}.do", method=RequestMethod.GET)
	public ResponseEntity<ApplicationVO> list(@PathVariable("app_index") Integer app_index) {
		ResponseEntity<ApplicationVO> entity = null;
		try {
			entity = new ResponseEntity<>(applicationService.applicationDetail(app_index), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
