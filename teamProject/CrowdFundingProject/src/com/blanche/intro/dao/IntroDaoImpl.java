package com.blanche.intro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.intro.vo.IntroVO;

@Repository
public class IntroDaoImpl implements IntroDao{
	
	@Autowired
	private SqlSession session;
	
	public int pay_success(IntroVO param) {
		return (int)session.insert("pay_success");
	}
	
	public List<IntroVO> introList(IntroVO param){
		return session.selectList("introList");
	}

}
