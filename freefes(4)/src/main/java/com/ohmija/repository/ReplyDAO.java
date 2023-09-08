package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.ReplyDTO;
import com.ohmija.model.Reply_pagingDTO;

@Repository
public interface ReplyDAO {

	int select_total_page(int idx);

	List<ReplyDTO> select_reply(Reply_pagingDTO reply_pagingdto);


}
