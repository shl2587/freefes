package com.ohmija.controller;


import java.io.IOException;
import java.lang.reflect.Parameter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.MemberDTO;
import com.ohmija.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/login")
	public void login() {}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/terms")
	public void terms() {
	}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto,String userpw, String nickname){
		int row = memberService.insert(dto);
		return "redirect:/";
	}

	@GetMapping("/findId")
	public void findId() {}
	
	@GetMapping("repw_email")
	public void repw_email() {}

	@GetMapping("repw")
	public void repw() {}
	
	@GetMapping("verify")
	public void verify() {}
	
	@PostMapping("/verify")
	public ModelAndView verify1(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("/member/verify");
		mav.addObject("userid", dto.getUserid());
		dto = memberService.selectVerify(dto);
		mav.addObject("verify1", dto.getVerify1());
		mav.addObject("verify2", dto.getVerify2());
		return mav;
	}
	@PostMapping("/answer")
	public String answer(MemberDTO dto) {
		System.out.println("answer 1 = " + dto.getAnswer1());
		System.out.println("answer 2 = " + dto.getAnswer2());
		System.out.println("userid = " + dto.getUserid());
		int row = memberService.selectAnswer(dto);
		System.out.println(row);
		return "redirect:/member/login";
	}
	
}
