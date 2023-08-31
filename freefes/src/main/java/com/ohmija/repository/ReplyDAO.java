package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.ReplyDTO;

@Repository
public interface ReplyDAO {

	ReplyDTO selectfav(int idx);

}
