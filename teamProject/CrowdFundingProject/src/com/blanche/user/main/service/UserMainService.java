package com.blanche.user.main.service;

import java.util.List;

import com.blanche.user.main.vo.UserMainVO;

public interface UserMainService {
	public List<UserMainVO> userList(UserMainVO param);
	public UserMainVO userAccess(UserMainVO param);
	public UserMainVO userData(UserMainVO param);
	public UserMainVO userFind(UserMainVO param);
	public int userInsert(UserMainVO param);
	public int userCheck(UserMainVO param);
	public int userChangePassword(UserMainVO param);
}