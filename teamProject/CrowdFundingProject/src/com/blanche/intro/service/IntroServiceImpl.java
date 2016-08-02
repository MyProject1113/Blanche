package com.blanche.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.intro.dao.IntroDao;
import com.blanche.intro.vo.IntroVO;

@Service
@Transactional
public class IntroServiceImpl implements IntroService {
	
	@Autowired
	private IntroDao introDao;
	
	@Override
	public int pay_success(IntroVO param){
		return introDao.pay_success(param);
	}
	
	@Override
	public List<IntroVO> introList(IntroVO param){
		List<IntroVO> myList = null;
		myList = introDao.introList(param);
		return myList;
	}

}
