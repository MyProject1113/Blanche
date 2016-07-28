package com.blanche.establish.dao;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;

public interface ApplicationDao {
	public int applicationInsert(ApplicationVO appvo);
	public int approvalInsert(ApprovalVO approvo);
	/*public List<ApplicationVO> applicationList(ApplicationVO appvo);*/
	public ApplicationVO applicationDetail(Integer app_index);
}
