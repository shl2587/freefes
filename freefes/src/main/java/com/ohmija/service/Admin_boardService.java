package com.ohmija.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.repository.Admin_boardDAO;
import com.ohmija.repository.MemberDAO;

@Service
public class Admin_boardService {

	@Autowired
	private Admin_boardDAO dao;
	
	// 유저 밴
	@Autowired
	private MemberDAO mdao;

	public List<Admin_boardDTO> selectAll() {
		return dao.selectAll();
	}

	public Admin_boardDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int write(Admin_boardDTO dto) {
		return dao.admin_write(dto);
	}

	public int modify(Admin_boardDTO dto) {
		return dao.modify(dto);
	}
	
	public void member_ban(int memberId, Date excludedUntil) {
        HashMap<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("excludedUntil", excludedUntil);
        int row = mdao.updateMemberBan(params);
        if (row > 0) {
            System.out.println("회원 밴 상태 업데이트 성공");
        } else {
            System.out.println("회원 밴 상태 업데이트 실패");
        }
    }
}

