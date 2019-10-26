package com.prj.enjoy.login.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.prj.enjoy.login.dao.LoginDao;
import com.prj.enjoy.login.dto.Business;
import com.prj.enjoy.login.dto.Customer;

@Controller
public class LoginController {
	
	

	@Autowired
	private SqlSession sqlSession;

	

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/loginProc")
	public String loginProc(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {

		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		String cuid = request.getParameter("cuid");
		String cupw = request.getParameter("cupw");
		Customer dto =dao.getCustomer(cuid);
		if (dto == null) {
			System.out.println("�븘�씠�뵒�뾾�쓬");
			return "login/login";
		} else if (!dto.getCupw().equals(cupw)) {
			System.out.println("鍮꾨�踰덊샇 遺덉씪移�");
			return "login/login";
		} else {
//			model.addAttribute("customer", dao.getCustomer(cuid));
			Cookie cookie=new Cookie("usr_cid", cuid);
			cookie.setMaxAge(60*60*24);
//			cookies=new Cookie("usr_cname", dto.getCuname());
			response.addCookie(cookie);
			System.out.println("로그인 성공");
			return "index";
		}

	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies=request.getCookies();
		if(cookies!=null) {
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0); //쿠키유효시간설정
				response.addCookie(cookies[i]); //서버에 추카
			}
		}
		return "redirect:/index";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/bLoginProc")
	public String bLoginProc(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception {

		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		String buid = request.getParameter("buid");
		String bupw = request.getParameter("bupw");
		Business dto=dao.getBusiness(buid);
		if (dto == null) {
			System.out.println("�븘�씠�뵒�뾾�쓬");
			return "login/login";
		} else if (!dto.getBupw().equals(bupw)) {
			System.out.println("鍮꾨�踰덊샇 遺덉씪移�");
			return "login/login";
		} else {
//			model.addAttribute("business", dao.getBusiness(buid));
			Cookie cookie=new Cookie("usr_bid", buid);
			cookie.setMaxAge(60*60*24);
//			cookies=new Cookie("usr_bname", dto.getBuname());
//			cookie=new Cookie("usr_bname", dao.getBusiness(buid).getBuname());
			response.addCookie(cookie);
			System.out.println("로그인 성공");
			return "index";
		}

	}
	@RequestMapping("/join")
	public String join() {
		return "login/join";
	}

	// �쉶�썝媛��엯
	@RequestMapping("/joinProc")
	public String joinProc(HttpServletRequest request) throws Exception {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);

		String cuid = request.getParameter("cuid");
		String cupw = request.getParameter("cupw");
		String cupw2 = request.getParameter("cupw2");
		String cuname = request.getParameter("cuname");
		String cugender = request.getParameter("cugender");
		String cuyear = request.getParameter("cuyear");
		String cuaddr = request.getParameter("cuaddr");
		String cumonth = request.getParameter("cumonth");
		String cuday = request.getParameter("cuday");
		String cubirth = String.format("%s-%s-%s", cuyear, cumonth, cuday);
		String cutel = request.getParameter("cutel");
		String cuemail = request.getParameter("cuemail");

		int result = chkCid(cuid);

		List<String> errors = new ArrayList();
		if (result > 0) {
			errors.add("check ID");
		}
		if (!cupw.equals(cupw2)) {
			errors.add("check your passwd");
		}

		System.out.println("errors :" + errors.size());
		if (errors.size() > 0) {
			return "login/join";
		} else {
			dao.createCustomer(cuid, cupw, cuname, cuaddr, cuemail, cugender, cubirth, cutel);
			return "redirect:login";
		}
	
	}

	private int chkCid(String cuid) {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		int result = dao.chkCid(cuid);
		System.out.println(result);
		return result;
	}

	@RequestMapping("/bJoin")
	public String bJoin() {
		return "blogin/bJoin";
	}

	// 媛�留뱀젏�쉶�썝媛��엯
	@RequestMapping("/bJoinProc")
	public String bJoinProc(HttpServletRequest request) throws Exception {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		
		String buid = request.getParameter("buid");
		String bupw = request.getParameter("bupw");
		String bupw2 = request.getParameter("bupw2");
		String buname = request.getParameter("buname");
		String buemail = request.getParameter("buemail");
		String burenum = request.getParameter("burenum");
		String butel = request.getParameter("butel");
		String buaddr = request.getParameter("buaddr");

		int result = chkBid(buid);
		List<String> errors = new ArrayList();
		// id �솗�씤
		if (result > 0) {
			errors.add("check ID");
		}
		// �뙣�뒪�썙�뱶 �솗�씤
		if (!bupw.equals(bupw2)) {
			errors.add("check your passwd");
		}
		System.out.println("errors :" + errors.size());
		if (errors.size() > 0) {
			return "blogin/bJoin";
		} else {
			dao.createBusiness(buid, bupw, buname, buemail,burenum, butel,buaddr);
			return "redirect: login";
		}
		
		
	}

	private int chkBid(String bid) {
		LoginDao dao = sqlSession.getMapper(LoginDao.class);
		int result = dao.chkBid(bid);
		System.out.println(result);
		
		return result;
	}
	@RequestMapping("/findId")
	public String findId() {
		return "login/findId";
	}
}
