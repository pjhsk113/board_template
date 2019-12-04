package com.spring.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageData;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 게시판 목록 조회
	 * @param model 
	 * @param page	현재 페이지 번호
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/List.do", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam(value="pageNo", defaultValue ="1") int page) throws Exception{
		List<BoardVo> boardList = new ArrayList<BoardVo> ();
		
		// 현재 페이지
		int nowPage = page;
		// 전체 게시글 수
		int totalCount = 0;
		// 한 페이지당 표시할 목록수
		int listCount = 10;
		// 한 그룹당 표시할 페이지 번호 수
		int pageCount = 5;
		
		PageData pageData = null;
		
		// 전체 게시글 수
		totalCount =boardService.boardTotalCnt();
		
		// 페이지 번호 계산 
		pageData = new PageData(nowPage, totalCount, listCount, pageCount);
		
		// SQL의 LIMIT절에서 사용될 값을 static 변수에 저장
		BoardVo boardVo = new BoardVo();
		boardVo.setOffset(pageData.getOffset());
		boardVo.setListCount(pageData.getListCount());
		
		// 게시글 목록 조회
		boardList = boardService.getBoardList(boardVo);
		
		// 글 번호를 계산하기 위한 변수
		int boardOrder = totalCount - (pageData.getListCount() * (pageData.getNowPage() - 1));
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageData", pageData);
		model.addAttribute("boardOrder", boardOrder);
		
		return "board/boardList";
	}
	/**
	 * 게시글 작성 페이지 호출
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/Write.do", method = RequestMethod.GET)
	public String boardWrite() throws Exception{
		
		// View 호출을 위한 컨트롤러
		
		return "board/boardWrite";
	}
	/**
	 * 게시글 작성 Ajax와 비동기 통신
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/WriteOK.do", method = RequestMethod.POST)
	@ResponseBody
	public int boardWriteOK(BoardVo boardVo) throws Exception{
		
		// 전송받은 데이터를 Insert
		int result = boardService.boardInsert(boardVo);
		
		return result;
	}
	
	/**
	 * 게시글 상세보기
	 * @param model
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/View.do", method = RequestMethod.GET)
	public String boardView(Model model,@RequestParam(value="boardNo") int boardNo) throws Exception{
		BoardVo result = new BoardVo();
		
		// boardNo를 매개변수로 넘겨받는다
		result = boardService.getBoardContent(boardNo);
		
		// result를 View로 전달
		model.addAttribute("Content", result);
		
		return "board/boardView";
	}
	
	/**
	 * 게시글 삭제 Ajax 비동기
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value ="/board/DeleteOk.do", method = RequestMethod.GET)
	@ResponseBody
	public int boardDeleteOK(@RequestParam(value="boardNo")int boardNo) throws Exception{
		
		// PK인 boardNo를 넘겨받아 게시글 삭제
		int result = boardService.boardDelete(boardNo);
	
		return result;
	}
	
	/**
	 * 게시글 수정 페이지 호출
	 * @param model
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/Update.do", method = RequestMethod.GET)
	public String boardUpdate(Model model
			,@RequestParam(value="boardNo")int boardNo) throws Exception{

		// 이전에 작성되었던 글 제목, 글 내용을 가져오기위해 model로 값 보내줌
		BoardVo result = new BoardVo();
		
		result = boardService.getBoardContent(boardNo);
		
		model.addAttribute("Content", result);
		
		return "board/boardUpdate";
	}
	/**
	 * 게시글 수정 Ajax 비동기
	 * @param boardVo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/board/UpdateOK.do", method = RequestMethod.POST)
	@ResponseBody
	public int boardUpdateOK(BoardVo boardVo) throws Exception{
		
		int result = boardService.boardUpdate(boardVo);
		
		return result;
	}
}
