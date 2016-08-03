package com.blanche.user.access.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.access.vo.UserAccessVO;

@Repository
public class UserAccessMappervImpl implements UserAccessMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UserAccessVO> accessList(UserAccessVO param) {
		return session.selectList("accessList");
	}
	
	@Override
	public UserAccessVO accessLast(UserAccessVO param) {
		return session.selectOne("accessLast");
	}
	
	@Override
	public int accessInsert(UserAccessVO param) {
		return session.insert("accessInsert");
	}
	
	@Override
	public int accessListCount(UserAccessVO param) {
		return session.selectOne("accessListCount");
	}
}