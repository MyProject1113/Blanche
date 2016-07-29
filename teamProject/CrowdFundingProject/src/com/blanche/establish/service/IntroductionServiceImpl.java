package com.blanche.establish.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.establish.dao.IntroductionDao;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;

@Service
@Transactional
public class IntroductionServiceImpl implements IntroductionService {
	Logger logger = Logger.getLogger(IntroductionServiceImpl.class);
	
	@Autowired
	private IntroductionDao introductionDao;
	
	// 프로젝트 소개, 기획자 정보 입력 구현
	@Override
	public int introductionInsert(IntroductionVO ivo, PlannerVO pvo) {
		int result = 0, result1 = 0, result2 = 0;

		result1 = introductionDao.introductionInsert(ivo);
		result2 = introductionDao.plannerInsert(pvo);

		if ((result1 == 1) && (result2 == 1))
			result = 1;
		
		return result;
	}
	
	/*@Override
	public IntroductionVO introductionDetail(IntroductionVO ivo) {
		
	}
	
	@Override
	public PlannerVO plannerDetail(PlannerVO pvo) {
		
	}*/
}
