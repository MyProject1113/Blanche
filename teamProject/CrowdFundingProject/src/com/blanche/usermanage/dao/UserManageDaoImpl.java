package com.blanche.usermanage.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.user.main.vo.UserMainVO;
@Repository
public class UserManageDaoImpl implements UserManageDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void pwChange(UserMainVO userMainVO) {
		session.update("pwChange", userMainVO);
	}
	
	@Override
	public void phChange(UserMainVO userMainVO) {
		session.update("phChange", userMainVO);
	}

	@Override
	public void approvalUpdate(IntroApprovalVO ivo) {
		session.update("approvalUpdate");
		
	}

	@Override
	public String getDonationDday(int intro_index) {
		return (String)session.selectOne("getDonationDday");
	}

	

}
