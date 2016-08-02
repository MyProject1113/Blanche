package com.blanche.user.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.main.dao.UserMainMapper;
import com.blanche.user.main.vo.UserMainVO;

@Service
@Transactional
public class UserMainServiceImp implements UserMainService {
	@Autowired
	private UserMainMapper userMainMapper;
	
	@Override
	public UserMainVO userAccess(UserMainVO param) {
		return userMainMapper.userAccess(param);
	}
	
	@Override
	public UserMainVO userData(UserMainVO param) {
		return userMainMapper.userData(param);
	}
	
	@Override
	public UserMainVO userFind(UserMainVO param) {
		return userMainMapper.userFind(param);
	}
	
	@Override
	public int userInsert(UserMainVO param) {
		return userMainMapper.userInsert(param);
	}
	
	@Override
	public int userCheck(UserMainVO param) {
		return userMainMapper.userCheck(param);
	}
	
	@Override
	public int userChangePassword(UserMainVO param) {
		return userMainMapper.userChangePassword(param);
	}
}