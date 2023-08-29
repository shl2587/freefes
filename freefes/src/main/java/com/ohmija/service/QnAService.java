package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Post_messageDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.repository.QnADAO;

@Service
public class QnAService {

	@Autowired
	private QnADAO dao;
	
//	@Autowired
//	private Post_messageService postMessageService;
	

	public List<QnADTO> selectAll() {
		return dao.selectAll();
	}
	
	public QnADTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(QnADTO dto) {
		return dao.write(dto);
	}

	public QnADTO answer(int idx, String answer) {
		return dao.answer(idx, answer);
	}

//	public void sendMessage(QnADTO qna) {
//		Post_messageDTO message = new Post_messageDTO();
//		message.setWriter(0); // 관리자 role 0
//		message.setReceiver(qna.getMember()); // 질문 작성 회원
//		message.setTitle("1:1 문의 답변");
//		message.setContent("1:1 문의에 답변이 등록되었습니다.");
//		message.setCategory("알림");
//		postMessageService.sendMessage(message); // 메시지 전송
//	}
}
