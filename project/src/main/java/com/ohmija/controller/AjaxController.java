package com.ohmija.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.service.MemberService;
import com.omija.model.MemberDTO;

@RestController
public class AjaxController {

	@Autowired	private MemberService memberService;

	@GetMapping("/dupCheck/{userid}")
	public int dupCheck(@PathVariable("userid") String userid) {
		int row = memberService.dupCheck(userid);
		System.out.println("여기row = " + row);
		return row;
	}

	@PostMapping("/getlogin")
	public HashMap<String, Object> getlogin(@RequestBody MemberDTO dto) {
		System.out.println(dto.getUserid() + "확인");
		System.out.println(dto.getUserpw());
		String email = memberService.getlogin(dto);

		HashMap<String, Object> result = new HashMap<>();
		result.put("email", email);
		result.put("status", email != null);
		return result;
	}

}


















