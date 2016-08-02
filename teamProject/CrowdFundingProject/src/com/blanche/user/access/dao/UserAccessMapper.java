package com.blanche.user.access.dao;

import java.util.List;

import com.blanche.user.access.vo.UserAccessVO;

public interface UserAccessMapper {
	public List<UserAccessVO> accessList(UserAccessVO param);
	public UserAccessVO accessLast(UserAccessVO param);
	public int accessInsert(UserAccessVO param);
}