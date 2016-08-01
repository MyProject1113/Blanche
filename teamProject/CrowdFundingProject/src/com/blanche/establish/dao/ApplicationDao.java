package com.blanche.establish.dao;

import java.util.List;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;

public interface ApplicationDao {
	public int applicationInsert(ApplicationVO appvo);
	public int approvalInsert(ApprovalVO approvo);
	public ApplicationVO applicationDetail(Integer app_index);
	public List<ApplicationVO> applicationAdminList(ApplicationVO appvo);
	public List<ApprovalVO> approvalAdminList(ApprovalVO approvo);
	public int applicationListCnt(ApplicationVO appvo);
	

	public ApplicationVO applicationAdminDetail(ApplicationVO appvo);
	public int approvalUpdate(ApprovalVO approvo);
	public int applicationDelete(int app_index);
	public List<ApplicationVO> applicationMyPageList(ApplicationVO appvo);
	public ApprovalVO userProgressAppro(int us_index);
}
