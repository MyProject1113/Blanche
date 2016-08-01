package com.blanche.user.access.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.access.dao.UserAccessMapper;
import com.blanche.user.access.vo.UserAccessVO;

@Service
@Transactional
public class UserAccessServiceImpl implements UserAccessService {
	@Autowired
	private UserAccessMapper userAccessMapper;
	
	@Override
	public int accessInsert(UserAccessVO param) {
		return userAccessMapper.accessInsert(param);
	}
}