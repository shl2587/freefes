package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.omija.model.MemberDTO;

@Repository
public interface MemberDAO {

	int insert(MemberDTO dto);

	int resetPassword(MemberDTO dto);

	MemberDTO selectLogin(MemberDTO dto);

	int selectCount(String userid);

	String selectlogin(MemberDTO dto);

}
