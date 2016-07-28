package com.blanche.user.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.main.vo.UserMainVO;

@Repository
public class UserMapperImpl implements UserMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public UserMainVO userAccess(UserMainVO param) {
		return (UserMainVO) session.selectOne("userAccess");
	}
	
	@Override
	public UserMainVO userData(UserMainVO param) {
		return (UserMainVO) session.selectOne("userData");
	}
}
