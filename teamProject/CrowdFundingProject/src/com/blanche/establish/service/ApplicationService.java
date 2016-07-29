package com.blanche.establish.service;

import com.blanche.establish.vo.ApplicationVO;
import com.blanche.establish.vo.ApprovalVO;

public interface ApplicationService {
	public int applicationInsert(ApplicationVO appvo, ApprovalVO approvo);
	public ApplicationVO applicationDetail(Integer app_index);
}
