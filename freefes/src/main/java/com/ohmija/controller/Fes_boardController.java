package com.ohmija.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.Fes_searchDTO;
import com.ohmija.model.Festival_board_pagingDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.ReplyDTO;
import com.ohmija.service.Fes_boardService;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/fes_board")
public class Fes_boardController {
	
	@Autowired Fes_boardService fes_boardService;
	@Autowired ReplyService replyService;
	
	// 동영 코드
	// 임시 저장 선택
	@GetMapping("/mainboardWrite")
	public ModelAndView select_temp_board(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		int member = memberDTO.getIdx();
		ModelAndView mav = new ModelAndView("fes_board/mainboardWrite");
		// 임시저장글 목록 불러오기
		ArrayList<BoardDTO> list = fes_boardService.select_temp_board(member);
		mav.addObject("list", list);
		return mav;
	}
	
	// 게시글 작성
	@PostMapping("/mainboardWrite")
	public String mainWrite(BoardDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("login");
		int member = memberDTO.getIdx();
		dto.setMember(member);
		int row = 0;
		row = fes_boardService.mainWrite(dto);
		if (row != 0) {
			System.out.println("게시글 추가 성공");
		}
		return "redirect:/";
	}
	
	
	// 승록
	@GetMapping("/mainboard/{idx}")
	public ModelAndView main_board(BoardDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/fes_board/mainboard");
		BoardDTO board_dto = fes_boardService.get_main_board(dto);
		mav.addObject("board_dto", board_dto);
		
		// 댓글 불러오기
		List<ReplyDTO> reply_list = replyService.selectOnBoard(dto.getIdx());
		mav.addObject("reply_list", reply_list);
		
		// 자신의 댓글만 불러오기
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO)session.getAttribute("login");
		if(member != null) {
			ReplyDTO replyDTO = new ReplyDTO();
			
			replyDTO.setBoard(dto.getIdx());
			replyDTO.setMember(member.getIdx());
			replyDTO = replyService.selectMyReply(replyDTO);
			
			mav.addObject("my_reply", replyDTO);
		}
		
		return mav;
	}
	
	@GetMapping("/fes_board_list")
	public ModelAndView main_board_list(@RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView();
		
		
		// 페이징 코드
		int board_page_count = fes_boardService.select_total_page();
		Festival_board_pagingDTO fes_paging_dto = new Festival_board_pagingDTO(request_page, board_page_count);
	
		// board에 저장된 모든 게시글을 불러오는 코드
		List<BoardDTO> fes_boardList = fes_boardService.fes_board_selectAll(fes_paging_dto);
		
		mav.addObject("fes_paging_dto", fes_paging_dto);
		mav.addObject("fes_boardList", fes_boardList);
		
		return mav;
	}

	

	
	
}
