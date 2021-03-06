package com.blanche.user.accredit.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.user.accredit.vo.UserAccreditVO;

@Repository
public class UserAccreditMapperImpl implements UserAccreditMapper {
	@Autowired
	public SqlSession session;
	
	@Override
	public int accreditInsert(UserAccreditVO param) {
		return session.insert("accreditInsert");
	}
	
	@Override
	public int accreditRemove(UserAccreditVO param) {
		// TODO Auto-generated method stub
		return session.delete("accreditRemove");
	}
	
	@Override
	public int accreditDelete(UserAccreditVO param) {
		return session.delete("accreditDelete");
	}
}