package com.blanche.establish.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.establish.dao.IntroductionDao;
import com.blanche.establish.vo.IntroductionVO;

@Service
@Transactional
public class IntroductionServiceImpl implements IntroductionService {
	Logger logger = Logger.getLogger(IntroductionServiceImpl.class);
	
	@Autowired
	private IntroductionDao introductionDao;
	
	// 프로젝트 소개 입력 구현
	@Override
	public int introductionInsert(IntroductionVO ivo) {
		int result = 0;
		result = introductionDao.introductionInsert(ivo);
		return result;
	}
}
