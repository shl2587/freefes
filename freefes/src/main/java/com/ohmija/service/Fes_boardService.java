package com.ohmija.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ohmija.model.BoardDTO;
import com.ohmija.repository.Fes_boardDAO;

@Service
public class Fes_boardService {

	@Autowired private Fes_boardDAO dao;
	
	public int mainWrite(BoardDTO dto) {
		int member = 1;
		dto.setMember(member);
		
		int row = 0;
		List<MultipartFile> list = dto.getFile_list();
		ArrayList<String> path = new ArrayList<>();
		
		String origin_path="";
		if (!list.contains("@")) {			
			for (MultipartFile f : list) {
				String origin_file_name = f.getOriginalFilename();
				path.add(origin_file_name);
				
				
				String f_name = origin_file_name.substring(0, origin_file_name.indexOf("."));
				String real_name = (f_name + ".");
				origin_path += real_name;
				dto.setFile_path(origin_path);
			}
		}
		else {
			dto.setFile_path(null);
		}
		
		row = dao.mainWrite(dto);
		return row;
	}

	
	
}
