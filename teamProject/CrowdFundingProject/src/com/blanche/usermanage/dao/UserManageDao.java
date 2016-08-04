package com.blanche.usermanage.dao;

import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.user.main.vo.UserMainVO;

public interface UserManageDao {

	public void pwChange(UserMainVO userMainVO);

	public void phChange(UserMainVO userMainVO);

	public void approvalUpdate(IntroApprovalVO ivo);

	public String getDonationDday(int intro_index);

	

}
