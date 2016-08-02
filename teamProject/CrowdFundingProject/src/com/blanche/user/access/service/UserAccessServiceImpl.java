package com.blanche.user.access.service;

import java.util.List;

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
	public List<UserAccessVO> accessList(UserAccessVO param) {
		return userAccessMapper.accessList(param);
	}
	
	@Override
	public UserAccessVO accessLast(UserAccessVO param) {
		return userAccessMapper.accessLast(param);
	}
	
	@Override
	public int accessInsert(UserAccessVO param) {
		return userAccessMapper.accessInsert(param);
	}
}