package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.ReplyDTO;
import com.ohmija.repository.ReplyDAO;

@Service
public class ReplyService {
	
	@Autowired private ReplyDAO dao;

	public ReplyDTO selectfav(int idx) {
		return dao.selectfav(idx);
	}

}
