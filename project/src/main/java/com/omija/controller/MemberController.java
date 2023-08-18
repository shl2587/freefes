package com.omija.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omija.model.MemberDTO;
import com.omija.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login =  memberService.login(dto);
		session.setAttribute("login", login);
		return "redirect:/";
	}
	
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
	public String join(MemberDTO dto, String userpw) {
		int row1 = memberService.insertpasswd(userpw);
		System.out.println(row1 != 0 ? "성공" : "실패1");
		if(row1 != 0) {
			int row2 = memberService.insert(dto);
			System.out.println(row2 != 0 ? "성공" : "실패2");
		}
		return "redirect:/";
	}

	@GetMapping("/findId")
	public void findId() {}
	
	@PostMapping("/findId")
	public String findId(MemberDTO dto) {
		int row = memberService.findId(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/member" + (row != 0 ? "/findIdPage" : "/findId");
	}
	
	@GetMapping("/findIdPage")
	public void findIdPage() {}
	
	@GetMapping("/noFind")
	public void noFind() {}
}
