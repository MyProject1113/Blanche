package com.blanche.cc.dao;

/*import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.blanche.cc.vo.CcVO;*/


public class CcDaoImpl {
/*@Repository
public class CcDaoImpl implements CcDao {
	@Autowired
	private SqlSession session;
	
	// 글목록 구현
	@Override
	public List<CcVO> ccList() {
		return session.selectList("ccList");
	}
	
	// 글입력 구현
	@Override
	public int ccInsert(CcVO cvo) {
		return session.insert("ccInsert", cvo);
	}
	
	// 글상세 구현
	@Override
	public CcVO ccDetail(CcVO cvo) {
		return (CcVO)session.selectOne("ccDetail");
	}
	
	// 비밀번호 확인 구현
	@Override
	public int pwdConfirm(CcVO cvo) {
		return (Integer)session.selectOne("pwdConfirm");
	}
	
	// 글수정 구현
	@Override
	public int ccUpdate(CcVO cvo) {
		return session.update("ccUpdate");
	}
	
	// 글삭제 구현
	@Override
	public int ccDelete(int b_num) {
		return session.delete("ccDelete");
	}*/
}
