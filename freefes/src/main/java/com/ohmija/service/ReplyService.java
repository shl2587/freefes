package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.ReplyDTO;
import com.ohmija.model.Reply_pagingDTO;
import com.ohmija.repository.ReplyDAO;

@Service
public class ReplyService {
	
	@Autowired private ReplyDAO dao;

	public int select_total_page(int idx) {
		return dao.select_total_page(idx);
	}

	public List<ReplyDTO> select_reply(Reply_pagingDTO reply_pagingdto) {
		return dao.select_reply(reply_pagingdto);
	}


}
