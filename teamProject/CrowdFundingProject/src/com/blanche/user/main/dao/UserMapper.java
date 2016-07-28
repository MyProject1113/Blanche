package com.blanche.user.main.dao;

import com.blanche.user.main.vo.UserMainVO;

public interface UserMapper {
	UserMainVO userAccess(UserMainVO param);
	UserMainVO userData(UserMainVO param);
}