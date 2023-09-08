package com.ohmija.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.service.Post_messageService;

@RestController
public class MessageAjaxController {
	
	@Autowired private Post_messageService post_messageService; 
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx")int idx) {
		int row = post_messageService.delete(idx);
	    return String.format("%d", row);
	}
	
	@GetMapping("/receiver_nickname/{receiver}")
	public int receiver_nicknameCheck(@PathVariable("receiver")String receiver) {
		int row = post_messageService.receiver_nicknameCheck(receiver);
	    return row;
	}
	
	@GetMapping("/isValidTitle/{title}")
	public String isValidTitle(@PathVariable("title")String title) {
		if (title != null && title.trim().length() <= 30) {
			return String.format("%d", 1);
	    } else {
	    	return String.format("%d", 0);
	    }
	}
	
	@GetMapping("/isValidContent/{content}")
	public String contentCheck(@PathVariable("content") String content) {
	    if (content != null && content.trim().length() <= 300) {
	        return String.format("%d", 1);
	    } else {
	        return String.format("%d", 0);
	    }
	}
}
