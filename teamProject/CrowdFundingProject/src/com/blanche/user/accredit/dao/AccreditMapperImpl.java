package com.blanche.user.accredit.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.accredit.vo.UserAccreditVO;

@Repository
public class AccreditMapperImpl implements AccreditMapper {
	@Autowired
	public SqlSession session;
	
	@Override
	public int accreditInsert(UserAccreditVO param) {
		return session.insert("accreditInsert");
	}
}