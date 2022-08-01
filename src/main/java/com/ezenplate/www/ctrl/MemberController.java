package com.ezenplate.www.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezenplate.www.service.MemberService;
import com.ezenplate.www.domain.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	private MemberService msv;
	
	@GetMapping("/login")
	public void login() {
		log.info(">>> MemberController login - GET");
	}
	
	@PostMapping("/login")
	public String login(MemberVO mvo, HttpSession ses, RedirectAttributes rttr) {
		MemberVO sesMvo = msv.login(mvo);
		if(sesMvo != null) {
			log.info(">>> MemberController login - OK");
			ses.setAttribute("ses", sesMvo);
			ses.setMaxInactiveInterval(60 * 10);
			rttr.addFlashAttribute("isLogin", 1);
			return "redirect:/";
		} else {
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession ses, RedirectAttributes rttr) {
		ses.removeAttribute("ses");
		ses.invalidate();
		rttr.addFlashAttribute("isLogout", 1);
		return "redirect:/";
	}
}
