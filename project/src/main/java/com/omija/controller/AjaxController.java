package com.omija.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.omija.service.MemberService;

@RestController
public class AjaxController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/dupCheck/{userid}")
	public String dupCheck(@PathVariable("userid") String userid) {
		int row = memberService.dupCheck(userid);
		return String.format("%d",row);
	}
	
	@GetMapping("/passCheck/{userpw}")
	public String passCheck(@PathVariable("userpw") String userpw){
		int row = memberService.insertpasswd(userpw);
		return String.format("%d", row);
	}
	
	@GetMapping("/checkId/{name}/{email}/")
	@ResponseBody
	public HashMap<String, String> checkId(@PathVariable("name") String name, @PathVariable("email")String email){
		HashMap<String, String> result = new HashMap<>();
		int row = memberService.findId2(name, email);
		if(row != 0) {
			result.put("message", "입력하신 정보가 일치하므로 인증번호 발송페이지로 넘어갑니다.");
		}
		return result;
	}
}
