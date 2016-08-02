package com.blanche.intro.service;

import java.util.List;

import com.blanche.intro.vo.IntroVO;

public interface IntroService {
	
	public int pay_success(IntroVO param);

	public List<IntroVO> introList(IntroVO param);

}
