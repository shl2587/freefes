package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.QnADTO;
import com.ohmija.repository.QnADAO;

@Service
public class QnAService {

	@Autowired
	private QnADAO dao;

	

	public QnADTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(QnADTO dto) {
		return dao.write(dto);
	}

//	public int reply(int idx, String answer) {
//		return dao.reply(idx, answer);
//	}

	public QnADTO answer(int idx, String answer) {
		return dao.answer(idx,  answer);
	}

	public List<QnADTO> selectAll() {
		return dao.selectAll();
	}
	
	
}
