package com.blanche.establish.dao;

import java.util.List;

import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;
import com.blanche.establish.vo.IntroApprovalVO;

public interface IntroductionDao {
	public int introductionInsert(IntroductionVO ivo);
	public int plannerInsert(PlannerVO pvo);
	public IntroductionVO introductionDetail(IntroductionVO ivo);
	public PlannerVO plannerDetail(PlannerVO pvo);
	public DonationVO donationDetail(DonationVO dvo);
	
	

	public String usermainEmail(int index);
	public List<IntroductionVO> projectAdminList(IntroductionVO ivo);
	public int projectApprovalUpdate(IntroApprovalVO intappvo);
	public List<IntroductionVO> projectMyPageList(int us_index);
	public IntroApprovalVO userProgressIntAppro(int us_index);
	public int introApprovalInsert(IntroApprovalVO intappvo);
	public int getIntroIndex(int app_index);
}
