package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;

public interface BoardService {
	public List<BoardVo> getBoardList(BoardVo boardVo) throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int boardTotalCnt() throws Exception;

	public BoardVo getBoardContent(int boardNo) throws Exception;

	public int boardDelete(int boardNo) throws Exception;

	public int boardUpdate(BoardVo boardVo) throws Exception;

}
