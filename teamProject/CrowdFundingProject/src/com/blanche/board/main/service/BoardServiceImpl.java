package com.blanche.board.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.blanche.board.main.dao.BoardMapper;
import com.blanche.board.main.vo.BoardMainVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardMainVO> boardList(BoardMainVO param) {
		return boardMapper.boardList(param);
	}
	
	@Override
	public BoardMainVO boardDetail(BoardMainVO param) {
		return boardMapper.boardDetail(param);
	}
	
	@Override
	public int boardCheck(BoardMainVO param) {
		return boardMapper.boardCheck(param);
	}
	
	@Override
	public int boardInsert(BoardMainVO param) {
		return boardMapper.boardInsert(param);
	}
	
	@Override
	public int boardUpdate(BoardMainVO param) {
		return boardMapper.boardUpdate(param);
	}
	
	@Override
	public int boardDelete(BoardMainVO param) {
		return boardMapper.boardDelete(param);
	}
	
	@Override
	public int boardListCount(BoardMainVO param) {
		return boardMapper.boardListCount(param);
	}
	
	@Override
	public int boardReplyCount(BoardMainVO param) {
		return boardMapper.boardReplyCount(param);
	}
	
	@Override
	public int boardReplyIndent(BoardMainVO param) {
		return boardMapper.boardReplyIndent(param);
	}
}