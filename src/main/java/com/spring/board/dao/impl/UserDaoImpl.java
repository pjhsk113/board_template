package com.spring.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao{
	@Autowired
	SqlSession sqlSession;
	
//	@Override
//	public List<BoardVo> getBoardList() throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("boardMapper.getBoardList");
//	}

}
