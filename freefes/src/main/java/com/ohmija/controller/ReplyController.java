package com.ohmija.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.ReplyDTO;
import com.ohmija.model.Reply_pagingDTO;
import com.ohmija.service.ReplyService;

@Controller
@RequestMapping("/member/mypage")
public class ReplyController {
	
	@Autowired private ReplyService replyService;
	
	@GetMapping("/reply_list/{idx}")
	public ModelAndView Reply_list(@PathVariable("idx")int idx, @RequestParam(value="request_page", defaultValue="1") int request_page) {
		ModelAndView mav = new ModelAndView("/member/mypage/reply_list");
		System.out.println("앞");
		
		int board_page_count = replyService.select_total_page(idx);
		Reply_pagingDTO reply_pagingdto = new Reply_pagingDTO(request_page, board_page_count);
		reply_pagingdto.setIdx(idx);
		System.out.println("reply : "+ reply_pagingdto.getIdx());
		
		// board에 저장된 모든 게시글을 불러오는 코드
		List<ReplyDTO> Rep = replyService.select_reply(reply_pagingdto);
		System.out.println("뒤");
		mav.addObject("reply_pagingdto", reply_pagingdto);
		mav.addObject("Rep", Rep);
		return mav;
	}

}
