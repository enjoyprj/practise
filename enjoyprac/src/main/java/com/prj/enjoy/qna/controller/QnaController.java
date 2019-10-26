package com.prj.enjoy.qna.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.prj.enjoy.qna.dao.QnaDao;
import com.prj.enjoy.qna.dto.QnaDto;

@Controller
public class QnaController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/qna_list")
	public String qnaList(HttpServletRequest request, Model model) {

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		String strId = request.getParameter("id");
		String sbcode = request.getParameter("sbcode");
	
		model.addAttribute("id", strId);
		model.addAttribute("sbcode", sbcode);
		model.addAttribute("qnalist", dao.qnalist());

		return "qna/qna_list";

	}

	@RequestMapping(value = "/qna_write_view")
	public String qna_write_view(HttpServletRequest request, Model model) {

		String strId = request.getParameter("id");
		model.addAttribute("id", strId);

		return "qna/qna_write_view";
	}

	@RequestMapping(value = "/qna_write")
	public String write(HttpServletRequest request, Model model) {

		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		
		String strContent = request.getParameter("qcontent");
		String strTitle = request.getParameter("qtitle");
		String strId = request.getParameter("qid");
		System.out.println("qid >>>>>>"+strId);

		System.out.println("strContent = " + strContent);
		System.out.println("strTitle = " + strTitle);
		System.out.println("strId = " + strId);

		dao.qnawrite(strTitle, strContent, strId);
		model.addAttribute("id", strId);

		return "redirect:qna_list";
	}

	@RequestMapping("/qnacontent_view")
	public String qnacontentview(HttpServletRequest request, Model model) {
		String strNum = request.getParameter("num");
		model.addAttribute("numnum", strNum);
		QnaDao dao = sqlSession.getMapper(QnaDao.class);
		QnaDto dto = dao.qacontview(strNum);

		model.addAttribute("ty", dto);

		return "/qna/qna_content_view";

	}

	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
		String strNum = request.getParameter("num");
		QnaDao dao = sqlSession.getMapper(QnaDao.class);

		dao.qnadelete(strNum);

		return "redirect:qna_list";
	}
}