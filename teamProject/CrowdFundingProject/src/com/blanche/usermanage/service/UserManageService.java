package com.blanche.usermanage.service;

import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.user.main.vo.UserMainVO;

public interface UserManageService {

	public void pwChange(UserMainVO userMainVO);

	public void phChange(UserMainVO userMainVO);

	public void approvalUpdate(IntroApprovalVO ivo);

	

}
