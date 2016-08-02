package com.blanche.user.agree.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.agree.dao.UserAgreeMapper;
import com.blanche.user.agree.vo.UserAgreeVO;

@Service
@Transactional
public class UserAgreeServiceImpl implements UserAgreeService {
	@Autowired
	private UserAgreeMapper userAgreeMapper;
	
	public int agreeInsert(UserAgreeVO param) {
		return userAgreeMapper.agreeInsert(param);
	}
}