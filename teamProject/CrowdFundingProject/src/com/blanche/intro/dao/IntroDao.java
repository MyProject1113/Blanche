package com.blanche.intro.dao;

import java.util.List;

import com.blanche.intro.vo.IntroVO;

public interface IntroDao {

	public int pay_success(IntroVO param);

	public List<IntroVO> introList(IntroVO param);

}
