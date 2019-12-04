package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao boardDao;
	
	/**
	 * 게시글 목록 조회
	 */
	@Override
	public List<BoardVo> getBoardList(BoardVo boardVo) throws Exception {
		
		return boardDao.getBoardList(boardVo);
	}
	
	/**
	 * 글 등록
	 */
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		
		return boardDao.boardInsert(boardVo);
	}
	
	/**
	 * 총 게시글 조회
	 */
	@Override
	public int boardTotalCnt() throws Exception {
		
		return boardDao.boardTotalCnt();
	}
	
	/**
	 * 게시글 상세보기
	 */
	@Override
	public BoardVo getBoardContent(int boardNo) throws Exception {
		
		return boardDao.getBoardContent(boardNo);
	}
	/**
	 * 게시글 삭제
	 */
	@Override
	public int boardDelete(int boardNo) throws Exception {
		
		return boardDao.boardDelete(boardNo);
	}
	
	/**
	 * 게시글 수정
	 */
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		
		return boardDao.boardUpdate(boardVo);
	}
	
}
