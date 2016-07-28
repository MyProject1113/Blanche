package com.blanche.establish.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.establish.dao.ApplicationDao;
import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;

@Service
@Transactional
public class ApplicationServiceImpl implements ApplicationService {
	Logger logger = Logger.getLogger(ApplicationServiceImpl.class);
	
	@Autowired
	private ApplicationDao applicationDao;
	
	// 개설신청 입력 구현
	@Override
	public int applicationInsert(ApplicationVO appvo, ApprovalVO approvo) {
		int result = 0, result1 = 0, result2 = 0;
		
		result1 = applicationDao.applicationInsert(appvo);
		result2 = applicationDao.approvalInsert(approvo);
		
		if ((result1 == 1) && (result2 == 1))
			result = 1;
		
		return result;
	}

	// 개설신청 상세 구현
	@Override
	public ApplicationVO applicationDetail(Integer app_index) {
		ApplicationVO detail = null;
		detail = applicationDao.applicationDetail(app_index);
		return detail;
	}

}
