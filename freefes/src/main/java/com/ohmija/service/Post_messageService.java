package com.ohmija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.Post_messageDTO;

import com.ohmija.model.MemberDTO;
import com.ohmija.repository.MemberDAO;
import com.ohmija.repository.PostMessageDAO;

@Service
public class Post_messageService {


	@Autowired private PostMessageDAO dao;
	@Autowired private MemberDAO daoM;
	
	@Transactional
	public int sendMessage (Post_messageDTO dtoP, int idx, String receiver_nickname) {
		System.out.println("idx : "+idx+"receiver_nickname : "+receiver_nickname);
		MemberDTO row1 = daoM.findreceiver(receiver_nickname);
		System.out.println("row1 :"+row1);
		int receiverIdx = row1.getIdx();
		System.out.println("receiverIdx : " + receiverIdx);
		dtoP.setReceiver(receiverIdx);
		dtoP.setWriter(idx);
		System.out.println("row1의 idx : "+ receiverIdx);
		int row2 = 0;
			if(row1.getIdx() != 0) {
				row2 = dao.sendMessage(dtoP);
				System.out.println("row2 : " + row2);
				return row2;
			}
		return row2;
	}

	public List<Post_messageDTO> selectMessage(int idx) {
		return dao.selectMessage(idx);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public List<Post_messageDTO> select_SendMessage(int idx) {
		return dao.select_SendMessage(idx);
	}

	public List<Post_messageDTO> recievedMessage_List(int idx) {
		return dao.select_recievedMessage(idx);
	}

	public int receiver_nicknameCheck(String receiver_nickname) {
		return daoM.receiver_nicknameCheck(receiver_nickname);
	}

//	public int titleCheck(String titleInput) {
//	    if (titleInput != null && titleInput.trim().length() <= 20) {
//	        return 1;
//	    } else {
//	        return 0;
//	    }
//	}
//
//	public int contentCheck(String content) {
//		   if (content != null && content.trim().length() <= 300) {
//		        return 1;
//		    } else {
//		        return 0;
//		    }
//	}


	

}
