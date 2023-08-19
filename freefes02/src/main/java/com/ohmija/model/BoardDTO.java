package com.ohmija.model;

import java.sql.Date;

//		idx                 number                  generated always as identity primary key,
//		member              number                  not null,
//		write_date          date                    default sysdate,
//		start_date          date                    not null,
//		end_date            date                    not null,
//		title               varchar2(50)            not null,
//		content             varchar2(2000)          not null,
//		count               number                  default 0 check (count >= 0),
//		favorites           number                  default 0 check (favorites >= 0),
//		grade               number                  default 0 check (grade between 0 and 5),
//		region              varchar2(2000)          default '서울특별시',
//		file_name           varchar2(50),
//		file_path           varchar2(255),
//		festival_category   varchar2(20)            default '문화/예술',

public class BoardDTO {
	private int idx;
	private int member;
	private Date write_date;
	private Date start_date;
	private Date end_date;
	private String title;
	private String content;
	private int count;
	private int favorites;
	private int grade;
	private String region;
	private String file_name;
	private String file_path;
	private String festival_category;
	
	private boolean is_hold;
	private String remain;
	private int rank;
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getFavorites() {
		return favorites;
	}
	public void setFavorites(int favorites) {
		this.favorites = favorites;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getFestival_category() {
		return festival_category;
	}
	public void setFestival_category(String festival_category) {
		this.festival_category = festival_category;
	}
	public boolean isIs_hold() {
		return is_hold;
	}
	public void setIs_hold(boolean is_hold) {
		this.is_hold = is_hold;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
	}
	
	
	
	

}
