package com.prj.enjoy.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.prj.enjoy.review.dao.ReviewDao;

@Controller
public class ReviewController {
	public JdbcTemplate template;
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/review_list")
	public String review_list(HttpServletRequest request, Model model) {

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

//		String rvtitle = request.getParameter("rvtitle");
//		String cunum = request.getParameter("cunum");
//		String sbcode = request.getParameter("sbcode");
//		String rvdate = request.getParameter("rvdate");
//		String rvcontent = request.getParameter("rvcontent");
//		String rvpic = request.getParameter("rvpic");
//		String rvstar = request.getParameter("rvstar");

//		model.addAttribute("review_list", dao.review_list(rvtitle, cunum, sbcode, rvdate, rvcontent, rvpic, rvstar));
		model.addAttribute("review_list", dao.review_list());

		return "review/review_list";
	}

	@RequestMapping(value = "/review_write_view")
	public String write_view() {

		return "review/review_write_view";

	}

	@RequestMapping("/review_write")
	public String write(HttpServletRequest request, Model model) throws Exception {
		String attachPath = "resources\\upload\\";
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String path = uploadPath + attachPath;
		System.out.println("path : " + path);

		MultipartRequest req = new MultipartRequest(request, path, 2044 * 1024 * 10, "UTF-8",
				new DefaultFileRenamePolicy());

		ReviewDao dao = sqlSession.getMapper(ReviewDao.class);

		String rvtitle = req.getParameter("rvtitle");
		String rvstar = req.getParameter("rvstar");
		String rvcontent = req.getParameter("rvcontent");
		String rvpic = req.getFilesystemName("rvpic");
		
		dao.review_write(rvtitle,rvstar,rvcontent,rvpic);

		return "redirect:review_list";
	}

	@RequestMapping(value = "/reply_view")
	public String reply_view() {

		return "review/reply_view";

	}
}
