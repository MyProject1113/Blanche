package com.blanche.establish.dao;

import java.util.List;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.DonationVO;
import com.blanche.establish.vo.IntroductionVO;
import com.blanche.establish.vo.PlannerVO;
import com.blanche.establish.vo.ProjectListVO;
import com.blanche.establish.vo.IntroApprovalVO;

public interface IntroductionDao {
	public int introductionInsert(IntroductionVO ivo);
	public int plannerInsert(PlannerVO pvo);
	/*public IntroductionVO introductionDetail(IntroductionVO ivo);
	public PlannerVO plannerDetail(PlannerVO pvo);
	public DonationVO donationDetail(DonationVO dvo);*/
	
	public IntroductionVO introductionDetail(int intro_index);
	public PlannerVO plannerDetail(int intro_index);
	public DonationVO donationDetail(int intro_index);

	public String usermainEmail(int index);
	public List<IntroductionVO> projectAdminList(IntroductionVO ivo);
	public int projectApprovalUpdate(IntroApprovalVO intappvo);
	public List<IntroductionVO> projectMyPageList(int us_index);
	public IntroApprovalVO userProgressIntAppro(int us_index);
	public int introApprovalInsert(IntroApprovalVO intappvo);
	public int getIntroIndex(int app_index);
	public int projectListCnt(IntroductionVO ivo);
	public int projectApprovalRequest(IntroApprovalVO intappvo);
	public List<ProjectListVO> projectContentList(String app_field);
	public int sponserCount(int intro_index);
	public List<ProjectListVO> projectAllContentList(String app_field);
	public ApplicationVO getFundNField(int intro_index);
	public List<Integer> introdutionCount(String app_field);
	public ProjectListVO lookRoundContentList(int intro_index);
	public ProjectListVO noOneContentList(int intro_index);
	public int introductionModifyUpdate(IntroductionVO introDetail);
	public int plannerModifyUpdate(PlannerVO plannerDetail);
	public DonationVO donationNoOnDetail(int intro_index);
}
