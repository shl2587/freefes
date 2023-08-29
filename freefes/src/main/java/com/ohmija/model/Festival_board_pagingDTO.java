package com.ohmija.model;

public class Festival_board_pagingDTO {

	private String column;
	private String search;

	private int request_page;		// 사용자가 요청한 페이지 번호
	private int offset;				// idx 역순으로 정렬했을 때 시작지점에서 건너뛰는 개수
	private final int per_page = 10;
	private int board_page_count;	// 총 게시글의 개수 (select count(*) from board2)
	private int total_count;
	
	private final int per_section = 10;
	private int page_begin;
	private int page_end;
	private int page_section;
	private boolean prev;
	private boolean next;

	public Festival_board_pagingDTO(int request_page, int board_page_count) {
		this.request_page = request_page;
		this.board_page_count = board_page_count;
		
		total_count = board_page_count / per_page;

		if(board_page_count % per_page != 0) {
			total_count += 1;			
		}
		
		page_begin = request_page / per_section + 1;
		page_end = page_begin + per_section - 1;
		
		offset = (request_page - 1) * per_section;
		
		prev = false;
		next = false;
		
		if (request_page != 1) {
			prev = true;
		}
		if (request_page != page_end) {
			next = true;
		}
		
	}
	
	
	
	
	
//	public Festival_board_pagingDTO(int request_page, int board_page_count) {
//		this.request_page = request_page;
//		this.board_page_number = board_page_count;
//		
//		if (board_page_number % per_page != 0) {
//			total_page_count = board_page_count / per_page + 1;
//		}
//		else {
//			total_page_count = board_page_count / per_page;
//		}
//		if(request_page > total_page_count) {		// 요청페이지가 최대수를 초과하면
//			request_page = total_page_count;		// 페이지 개수(마지막 페이지)를 대입
//			this.request_page = total_page_count;	// 파라미터를 멤버 필드에 대입
//		}
//		offset = (request_page - 1) * per_page;
//		
//		end = ((request_page - 1) / perSection + 1) * perSection;
//		begin = end - per_page + 1;
//		section = (end - 1) / 10;
//		prev = section != 0;
//		
//		end = end > total_page_count ? total_page_count : end;
//		next = end != total_page_count;
//	}

//	public Festival_boardDTO(int page, int boardCount, String column, String search) {
//		this.page = page;
//		this.boardCount = boardCount;
//		this.column = column;
//		this.search = search;
//		
//		if (boardCount % perPage != 0) {
//			pageCount = boardCount / perPage + 1;
//		}
//		else {
//			pageCount = boardCount / perPage;
//		}
//		if(page > pageCount) {		// 요청페이지가 최대수를 초과하면
//			page = pageCount;		// 페이지 개수(마지막 페이지)를 대입
//			this.page = pageCount;	// 파라미터를 멤버 필드에 대입
//		}
//		offset = (page - 1) * perPage;
//		
//		end = ((page - 1) / perSection + 1) * perSection;
//		begin = end - perPage + 1;
//		section = (end - 1) / 10;
//		prev = section != 0;
//		
//		end = end > pageCount ? pageCount : end;
//		next = end != pageCount;
//	}
	
	public int getRequest_page() {
		return request_page;
	}

	public void setRequest_page(int request_page) {
		this.request_page = request_page;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getBoard_page_number() {
		return board_page_count;
	}

	public void setBoard_page_number(int board_page_count) {
		this.board_page_count = board_page_count;
	}

	public int getTotal_page_count() {
		return total_count;
	}

	public void setTotal_page_count(int total_count) {
		this.total_count = total_count;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPage_begin() {
		return page_begin;
	}

	public void setPage_begin(int page_begin) {
		this.page_begin = page_begin;
	}

	public int getPage_end() {
		return page_end;
	}

	public void setPage_end(int page_end) {
		this.page_end = page_end;
	}

	public int getSection() {
		return page_section;
	}

	public void setSection(int page_section) {
		this.page_section = page_section;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPer_page() {
		return per_page;
	}

	public int getPer_section() {
		return per_section;
	}
	
	
 
}
