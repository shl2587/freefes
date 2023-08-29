package com.ohmija.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ohmija.model.BoardDTO;
import com.ohmija.service.Fes_boardService;

@RestController
@RequestMapping("/fes_board")
public class Fes_boardAjaxController {
	
	@Autowired private Fes_boardService fes_boardService;
	
	
	@PostMapping("/temp_board_save")
	public int temp_board_save(@RequestBody BoardDTO dto) {
		int row = fes_boardService.temp_board_save(dto);
		return row;
	}
	
	@GetMapping("/load_temp_board/{idx}")
	public BoardDTO load_temp_board(@PathVariable int idx) {
		BoardDTO dto = fes_boardService.load_temp_board(idx);
		return dto;
	}
	
	@GetMapping("/temp_delete/{idx}")
	public int temp_delete(@PathVariable int idx) {
		int row = fes_boardService.temp_delete(idx);
		return row;
	}

}
