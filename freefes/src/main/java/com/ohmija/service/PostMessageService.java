package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Post_messageDTO;
import com.ohmija.repository.PostMessageDAO;

@Service
public class PostMessageService {

	@Autowired
	private PostMessageDAO dao;

	public int sendMessage(Post_messageDTO message) {
		return dao.insertMessage(message);
	}
	
}
