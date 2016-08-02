package com.blanche.user.access.service;

import java.util.List;

import com.blanche.user.access.vo.UserAccessVO;

public interface UserAccessService {
	public List<UserAccessVO> accessList(UserAccessVO param);
	public UserAccessVO accessLast(UserAccessVO param);
	public int accessInsert(UserAccessVO param);
}