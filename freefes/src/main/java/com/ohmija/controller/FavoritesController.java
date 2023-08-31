package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@Controller
@RequestMapping("/member/mypage")
public class FavoritesController {
	
	@Autowired private Fes_boardService boardService;

	@GetMapping("/favorites/{idx}")
	public ModelAndView Favorites(@PathVariable("idx")int idx) {
		ModelAndView mav = new ModelAndView("/member/mypage/favorites");
		BoardDTO fav = boardService.selectfav(idx);
		mav.addObject("fav", fav);
		return mav;
	}
	
}
