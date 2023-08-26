package com.ohmija.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ohmija.model.Admin_boardDTO;
import com.ohmija.model.MemberDTO;
import com.ohmija.model.QnADTO;
import com.ohmija.service.Admin_boardService;

@Controller
@RequestMapping("/admin_board")
public class Admin_boardController {

	@Autowired
	private Admin_boardService admin_boardService;
	
	@RequestMapping("/admin_board")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView("/admin_board/admin_board");
		List<Admin_boardDTO> list = admin_boardService.selectAll();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/admin_view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/admin_board/admin_view");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
//	 공지사항 작성
	@GetMapping("/admin_write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
	    int role = dto.getRole(); // 로그인 할 때 세션에 저장된 role번호 몇인지 판별
	    System.out.println(role);
	    if(role != 0) {
	        return "redirect:/";
	    }
	    return "/admin_board/admin_write";
	}

	
	@PostMapping("/admin_write")
	public String write(Admin_boardDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberDTO memberIdx = (MemberDTO)session.getAttribute("login");
	    int idx = memberIdx.getIdx();
	    dto.setMember(idx);
	    System.out.println(idx);
	    int row = admin_boardService.write(dto);
	    if(row > 0) {
	    	System.out.println(row + "행 추가");
	    	return "redirect:/admin_board/admin_baord";
	    } else {
	    	System.out.println("추가 실패");
	    	return "redirect:/admin_board/admin_write";
	    }
	}
	
	// 공지사항 수정
	@GetMapping("/admin_modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("admin_board/admin_modify");
		Admin_boardDTO dto = admin_boardService.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/admin_modify/{idx}")
	public String modify(Admin_boardDTO dto) {
		int row = admin_boardService.modify(dto);
		System.out.println(row + "행이 수정");
		return "redirect:/admin_board/admin_view/" + dto.getIdx();
	}
	
	
	@GetMapping("/{choice}")
	public ModelAndView choice_menu(@PathVariable("choice") String choice) {
		ModelAndView mav = new ModelAndView();
		
		switch(choice) {
		case "admin_board":
			mav.setViewName("admin_board/admin_board");
			break;
		case "admin_board_ask":
			mav.setViewName("admin_board/admin_board_ask");
			break;
		case "surround":
			mav.setViewName("admin_board/surround");
			break;
		case "qna_board":
			mav.setViewName("admin_board/qna_board");
			break;
		default:
			mav.setViewName("redirect:/admin_board");
			break;
		}
		return mav;
		
	}
	
}
