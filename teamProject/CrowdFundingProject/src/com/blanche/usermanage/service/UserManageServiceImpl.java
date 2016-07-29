package com.blanche.usermanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.user.main.vo.UserMainVO;
import com.blanche.usermanage.dao.UserManageDao;
@Service
@Transactional
public class UserManageServiceImpl implements UserManageService{

	@Autowired
	private UserManageDao userManageDao;
	
	@Override
	public void pwChange(UserMainVO userMainVO) {
		userManageDao.pwChange(userMainVO);
	}

	@Override
	public void phChange(UserMainVO userMainVO) {
		userManageDao.phChange(userMainVO);
		
	}
}