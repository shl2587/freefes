package com.ohmija.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@RequestMapping("/home")
	public void home() {}
	
	@RequestMapping("/main")
	public void main() {}
}
