package com.blanche.usermanage.dao;

import com.blanche.user.main.vo.UserMainVO;

public interface UserManageDao {

	public void pwChange(UserMainVO userMainVO);

	public void phChange(UserMainVO userMainVO);

}