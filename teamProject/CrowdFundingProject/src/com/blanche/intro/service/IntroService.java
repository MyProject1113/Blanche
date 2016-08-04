package com.blanche.intro.service;

import java.util.List;

import com.blanche.intro.vo.IntroVO;
import com.blanche.intro.vo.investVO;
import com.blanche.intro.vo.usactVO;

public interface IntroService {
	
	public int pay_success(IntroVO param);

	public int invest_success(investVO invVO);

	public List<IntroVO> introList(IntroVO param);

	public int usact_success(usactVO usactVO);

	public List<IntroVO> introMyPageList(IntroVO invo);

	public String projectname(int i);

	public List<IntroVO> accountMyPageList(IntroVO invo);

	public String projectIndex(int us_index);

	public int updateAdd(IntroVO ivo);
	
}
