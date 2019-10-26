package com.prj.enjoy.qna.dao;

import java.util.ArrayList;

import com.prj.enjoy.qna.dto.QnaDto;



public interface QnaDao {

	ArrayList<QnaDto> qnalist();

	void qnawrite(String strTitle, String strContent, String strId);

	QnaDto qacontview(String strNum);

	void qnadelete(String strNum);
}
