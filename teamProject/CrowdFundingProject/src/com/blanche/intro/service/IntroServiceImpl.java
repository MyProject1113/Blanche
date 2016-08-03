package com.blanche.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.intro.dao.IntroDao;
import com.blanche.intro.vo.IntroVO;
import com.blanche.intro.vo.investVO;
import com.blanche.intro.vo.usactVO;

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
	public int pay_success(investVO invVO){
		return introDao.pay_success(invVO);
	}
	
	@Override
	public int pay_success(usactVO usactVO){
		return introDao.pay_success(usactVO);
	}
	
	@Override
	public List<IntroVO> introList(IntroVO param){
		List<IntroVO> myList = null;
		myList = introDao.introList(param);
		return myList;
	}

	@Override
	public List<IntroVO> introMyPageList(IntroVO invo) {
		
		return introDao.introMyPageList(invo);
	}

	@Override
	public String projectname(int invo) {
		return introDao.projectname(invo);
	}

	@Override
	public List<IntroVO> accountMyPageList(IntroVO invo) {
		
		return introDao.accountMyPageList(invo);
	}

	@Override
	public String projectIndex(int us_index) {
		
		return introDao.projectIndex(us_index);
	}

	@Override
	public int updateAdd(IntroVO ivo) {
		return introDao.updateAdd(ivo);
	}

}
