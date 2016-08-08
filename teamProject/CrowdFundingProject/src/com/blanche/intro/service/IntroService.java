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

	public List<Integer> introdutionList(String app_field);

	public int sponserList(int intro_index);

	public IntroVO lookRoundContent(int intro_index);

	public IntroVO noOneContent(int intro_index);

	public List<Integer> introAllCount(String app_field);

	public List<Integer> introCount(String app_field);
	
}
