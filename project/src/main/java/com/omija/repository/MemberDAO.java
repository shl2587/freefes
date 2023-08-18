package com.omija.repository;

import com.omija.model.MemberDTO;

public interface MemberDAO {

	int insert(MemberDTO dto);

	int selectCount(String userid);

	int insertpasswd(String userpw);

	int findId(MemberDTO dto);

	int findId2(String name, String email);

	MemberDTO selectLogin(MemberDTO dto);

	
	

}
