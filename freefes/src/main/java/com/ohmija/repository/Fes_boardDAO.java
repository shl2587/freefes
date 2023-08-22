package com.ohmija.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;

@Repository
public interface Fes_boardDAO {

	int mainWrite(BoardDTO dto);

	ArrayList<BoardDTO> select_coming();

	ArrayList<BoardDTO> select_top10();
	
}
