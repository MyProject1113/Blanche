package com.blanche.intro.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.intro.vo.IntroVO;
import com.blanche.intro.vo.investVO;
import com.blanche.intro.vo.usactVO;

@Repository
public class IntroDaoImpl implements IntroDao{
	
	@Autowired
	private SqlSession session;
	
	public int pay_success(IntroVO param) {
		return (int)session.insert("pay_success");
	}
	
	public int  pay_success(investVO invVO) {
		return (int)session.insert("invest");
	}
	
	public int pay_success(usactVO usactVO) {
		return (int)session.insert("usact");
	}
	
	public List<IntroVO> introList(IntroVO param){
		return session.selectList("introList");
	}
	
	@Override
	public List<IntroVO> introMyPageList(IntroVO invo) {
		
		return session.selectList("introMyPageList");
	}

	@Override
	public String projectname(int invo) {
		
		return session.selectOne("projectname");
	}

	@Override
	public List<IntroVO> accountMyPageList(IntroVO invo) {
		
		return session.selectList("accountMyPageList");
	}

	@Override
	public String projectIndex(int us_index) {
		
		return session.selectOne("projectIndex");
	}

	@Override
	public int updateAdd(IntroVO ivo) {
		return session.update("updateAdd", ivo);
	}

}
