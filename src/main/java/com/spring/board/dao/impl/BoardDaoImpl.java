package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 매핑된 mapper에서 게시글 목록 가져옴
	 */
	@Override
	public List<BoardVo> getBoardList(BoardVo boardVo) throws Exception {
		
		return sqlSession.selectList("boardMapper.getBoardList", boardVo);
	}

	/**
	 * Insert Dao
	 */
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		
		return sqlSession.insert("boardMapper.boardInsert", boardVo);
	}
	/**
	 * board Total Count Dao
	 */
	@Override
	public int boardTotalCnt() throws Exception {
		
		return sqlSession.selectOne("boardMapper.boardCnt");
	}

	@Override
	public BoardVo getBoardContent(int boardNo) throws Exception {
		
		return sqlSession.selectOne("boardMapper.boardContent", boardNo);
	}

	@Override
	public int boardDelete(int boardNo) throws Exception {
		
		return sqlSession.delete("boardMapper.boardDelete", boardNo);
	}

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.boardUpdate", boardVo);
	}

}
