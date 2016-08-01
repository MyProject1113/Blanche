package com.blanche.user.access.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.access.vo.UserAccessVO;

@Repository
public class UserAccessMappervImpl implements UserAccessMapper {
	@Autowired
	private SqlSession session;
	
	@Override
	public int accessInsert(UserAccessVO param) {
		return session.insert("accessInsert");
	}
}