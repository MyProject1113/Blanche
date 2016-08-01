package com.blanche.user.main.dao;

import com.blanche.user.main.vo.UserMainVO;

public interface UserMainMapper {
	public UserMainVO userAccess(UserMainVO param);
	public UserMainVO userData(UserMainVO param);
	public int userInsert(UserMainVO param);
	public int userCheck(UserMainVO param);
}