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
	
	@Override
	public int pay_success(IntroVO param) {
		return (int)session.insert("pay_success");
	}
	
	@Override
	public int  invest_success(investVO invVO) {
		return (int)session.insert("invest");
	}
	
	@Override
	public int usact_success(usactVO usactVO) {
		return (int)session.insert("usact");
	}
	
	@Override
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
	
	@Override
	public List<Integer> introdutionList(String app_field){
		return session.selectList("introdutionList");
	}
	
	@Override
	public int sponserList(int intro_index){
		return session.update("sponserList");
	}
	
	@Override
	public IntroVO lookRoundContent(int intro_index){
		return (IntroVO)session.selectOne("lookRoundContent");
	}
	
	@Override
	public IntroVO noOneContent(int intro_index){
		return (IntroVO)session.selectOne("noOneContent");
	}
}
