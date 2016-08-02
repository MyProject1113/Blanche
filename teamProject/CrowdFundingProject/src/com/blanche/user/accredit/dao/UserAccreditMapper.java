package com.blanche.user.accredit.dao;

import com.blanche.user.access.vo.UserAccessVO;
import com.blanche.user.accredit.vo.UserAccreditVO;

public interface UserAccreditMapper {
	public int accreditInsert(UserAccreditVO param);
	public int accreditRemove(UserAccreditVO param);
	public int accreditDelete(UserAccreditVO param);
}