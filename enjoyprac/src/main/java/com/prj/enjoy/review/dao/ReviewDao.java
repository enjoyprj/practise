package com.prj.enjoy.review.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.prj.enjoy.review.dto.ReviewDto;

public interface ReviewDao {
	public ArrayList<ReviewDto> review_list(String rvtitle, String cunum, String sbcode, String rvdate,
			String rvcontent, String rvpic, String rvstar);

	public void write(String rvtitle, String rvcontent, String rvpic, String sbcode, Timestamp rvdate,String cunum, String cuid);

	public ArrayList<ReviewDto> review_list();

	public void review_write(String rvtitle, String rvstar, String rvcontent, String rvpic);
}
