package com.blanche.user.accredit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.accredit.dao.UserAccreditMapper;
import com.blanche.user.accredit.vo.UserAccreditVO;

@Service
@Transactional
public class UserAccreditServiceImpl implements UserAccreditService {
	@Autowired
	private UserAccreditMapper userAccreditMapper;
	
	@Override
	public int accreditInsert(UserAccreditVO param) {
		return userAccreditMapper.accreditInsert(param);
	}
	
	@Override
	public int accreditRemove(UserAccreditVO param) {
		// TODO Auto-generated method stub
		return userAccreditMapper.accreditRemove(param);
	}
	
	@Override
	public int accreditDelete(UserAccreditVO param) {
		return userAccreditMapper.accreditDelete(param);
	}
}