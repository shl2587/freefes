package com.omija.service;

import java.util.Random;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.omija.mail.MailComponent;
import com.omija.model.MemberDTO;
import com.omija.repository.MemberDAO;
@Service
public class MemberService {
	@Autowired private MailComponent mailComponent;
	@Autowired private MemberDAO dao;
	@Value("classpath:find.html")
	private Resource html;
	private Random ran = new Random();
	
	public int insert(MemberDTO dto) {
		return dao.insert(dto);
	}

	public int dupCheck(String userid) {
		return dao.selectCount(userid);
	}

	public int insertpasswd(String userpw) {		
		  int row = 0;
		    // 1) 걸러줄 변수 지정
		    String abc = "abcdefghijklmnopqrstuvwxyz";
		    String ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		    String special = "!@#$%^&*()_+[]{}|;:,.<>?";

		    boolean containsLower = false;
		    boolean containsUpper = false;
		    boolean containsSpecial = false;

		    // 소문자, 대문자, 특수 문자 포함 여부 검사
		    for (char c : userpw.toCharArray()) {
		        if (abc.contains(String.valueOf(c))) {
		            containsLower = true;
		        } else if (ABC.contains(String.valueOf(c))) {
		            containsUpper = true;
		        } else if (special.contains(String.valueOf(c))) {
		            containsSpecial = true;
		        }
		    }

		    if (userpw.length() > 7 && userpw.length() < 21) {
		        if (containsLower && containsUpper && containsSpecial) {
		            row = dao.insertpasswd(userpw);
		            System.out.println("비밀번호 사용 가능합니다.");
		            return row; // 올바른 경우에만 DAO에 비밀번호 삽입 요청
		        } else {
		            System.out.println("비밀번호는 영문과 특수문자 숫자를 포함하여야 합니다.");
		        }
		    } else {
		        System.out.println("8자리 이상 20자리 이하의 비밀번호여야 합니다.");
		    }
		    return row;

}
	public int passCheck(String userpw) {
		return dao.insertpasswd(userpw);
	}

//	public int findId(MemberDTO dto) {
//		
//		
//		if(row != 0) {
//			String content = "";
//			Scanner sc = new Scanner(html.getFile());
//			while(sc.hasNextLine()) {
//				content += sc.nextLine();
//			}
//			sc.close();
//			content = String.format(content, userpw);
//			mailComponent.sendMail(dto.getEmail(), content);
//		}
//	}

	public int findId2(String name, String email) {
		return dao.findId2(name, email);
	}

	public MemberDTO login(MemberDTO dto) {
		return dao.selectLogin(dto);
	}
}