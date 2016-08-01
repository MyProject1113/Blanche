package com.blanche.establish.service;

import java.util.List;

import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroApprovalVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;

public interface IntroductionService {
	public int introductionInsert(IntroductionVO ivo, PlannerVO pvo);
	public IntroductionVO introductionDetail(IntroductionVO ivo);
	public PlannerVO plannerDetail(PlannerVO pvo);
	public DonationVO donationDetail(DonationVO dvo);
	
	
	

	public String usermainEmail(int index);

	public List<IntroductionVO> projectAdminList(IntroductionVO ivo);

	public int projectApprovalUpdate(IntroApprovalVO intappvo);

	public List<IntroductionVO> projectMyPageList(int us_index);
	public IntroApprovalVO userProgressIntAppro(int us_index);
}
