package com.blanche.user.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.main.vo.UserMainVO;

@Repository
public class UserMainMapperImpl implements UserMainMapper {
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
	
	@Override
	public UserMainVO userFind(UserMainVO param) {
		return (UserMainVO) session.selectOne("userFind");
	}
	
	@Override
	public int userInsert(UserMainVO param) {
		return session.insert("userInsert");
	}
	
	@Override
	public int userCheck(UserMainVO param) {
		return (int) session.selectOne("userCheck");
	}
	
	@Override
	public int userChangePassword(UserMainVO param) {
		return session.update("userChangePassword");
	}
}
