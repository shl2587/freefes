package com.ohmija.service;

import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.mail.MailComponent;
import com.ohmija.repository.MemberDAO;
import com.omija.model.MemberDTO;

@Service
public class MemberService {
	
	@Autowired private MailComponent mailComponent;
	@Autowired private MemberDAO dao;
	@Value("classpath:resetPassword.html")
	private Resource html;
	private Random ran = new Random();

	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}
	
	@Transactional
	public int resetPassword(MemberDTO dto) throws IOException {
		
		// 1) 비밀번호 업데이트
		String userpw = (ran.nextInt(999999) + 100000) + "";
		dto.setUserpw(userpw);
		int row = dao.resetPassword(dto);
		
		// 2) 변경이 성공적으로 수행되었다면, 이메일 전송
		if(row != 0) {
			String content = "";
			Scanner sc = new Scanner(html.getFile());
			while(sc.hasNextLine()) {
				content += sc.nextLine();
			} 
			sc.close();
			content = String.format(content, userpw);
			mailComponent.sendMail(dto.getEmail(), content);
		}
		return row;
	}

	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.selectLogin(dto);
		return login;
	}

	public int dupCheck(String userid) {
		return dao.selectCount(userid);
	}

	public String getlogin(MemberDTO dto) {
		return dao.selectlogin(dto);
	}
}
