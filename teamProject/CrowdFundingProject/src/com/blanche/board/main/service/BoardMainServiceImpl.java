package com.blanche.board.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.main.dao.BoardMainMapper;
import com.blanche.board.main.vo.BoardMainVO;

@Service
@Transactional
public class BoardMainServiceImpl implements BoardMainService {
	@Autowired
	private BoardMainMapper boardMainMapper;
	
	@Override
	public List<BoardMainVO> boardList(BoardMainVO param) {
		return boardMainMapper.boardList(param);
	}
	
	@Override
	public BoardMainVO boardDetail(BoardMainVO param) {
		return boardMainMapper.boardDetail(param);
	}
	
	@Override
	public int boardCheck(BoardMainVO param) {
		return boardMainMapper.boardCheck(param);
	}
	
	@Override
	public int boardInsert(BoardMainVO param) {
		return boardMainMapper.boardInsert(param);
	}
	
	@Override
	public int boardUpdate(BoardMainVO param) {
		return boardMainMapper.boardUpdate(param);
	}
	
	@Override
	public int boardDelete(BoardMainVO param) {
		return boardMainMapper.boardDelete(param);
	}
	
	@Override
	public int boardRestore(BoardMainVO param) {
		return boardMainMapper.boardRestore(param);
	}
	
	@Override
	public int boardListCount(BoardMainVO param) {
		return boardMainMapper.boardListCount(param);
	}
	
	@Override
	public List<BoardMainVO> boardReplyList(BoardMainVO param) {
		return boardMainMapper.boardReplyList(param);
	}
	
	@Override
	public int boardReplyCount(BoardMainVO param) {
		return boardMainMapper.boardReplyCount(param);
	}
	
	@Override
	public int boardReplyIndent(BoardMainVO param) {
		return boardMainMapper.boardReplyIndent(param);
	}
}