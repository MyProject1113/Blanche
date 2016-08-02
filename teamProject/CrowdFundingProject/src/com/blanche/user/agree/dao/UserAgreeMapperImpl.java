package com.blanche.user.agree.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.agree.vo.UserAgreeVO;

@Repository
public class UserAgreeMapperImpl implements UserAgreeMapper {
	@Autowired
	public SqlSession session;
	
	@Override
	public int agreeInsert(UserAgreeVO param) {
		return session.insert("agreeInsert");
	}
}