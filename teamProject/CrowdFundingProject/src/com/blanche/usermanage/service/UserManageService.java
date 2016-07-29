package com.blanche.usermanage.service;

import com.blanche.user.main.vo.UserMainVO;

public interface UserManageService {

	public void pwChange(UserMainVO userMainVO);

	public void phChange(UserMainVO userMainVO);

}
