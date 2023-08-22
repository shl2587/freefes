package com.ohmija.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.MemberDTO;
import com.ohmija.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired private MypageService mypageService;
	
	@GetMapping("/mypage")
	public void mypage() {}
	
	
	@GetMapping("/modify")
	public void modify() {}
	
	@PostMapping("/modify")
	public ModelAndView modify(MemberDTO dto) {
		System.out.println("실행1");
		ModelAndView mav = null;
		int row = mypageService.update(dto);
		System.out.println(row);
		return mav;
	}

	


}
