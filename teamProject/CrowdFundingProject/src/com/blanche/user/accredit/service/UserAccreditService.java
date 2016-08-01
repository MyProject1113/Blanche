package com.blanche.user.accredit.service;

import com.blanche.user.accredit.vo.UserAccreditVO;

public interface UserAccreditService  {
	public int accreditInsert(UserAccreditVO param);
	public int accreditRemove(UserAccreditVO param);
	public int accreditDelete(UserAccreditVO param);
}