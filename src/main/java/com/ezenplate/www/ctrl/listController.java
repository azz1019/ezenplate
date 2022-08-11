package com.ezenplate.www.ctrl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.domain.listDTO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.repository.MemberDAO;
import com.ezenplate.www.service.MemberService;
import com.ezenplate.www.service.ReviewService;

@Controller
@RequestMapping("/list/*")
public class listController {

	@Inject
	private ReviewService rsv;
	@Inject
	private MemberService msv;

	@GetMapping("/reviewlist")
	public void reviewlist(Model model) {
		model.addAttribute("mlist",msv.getList());
		model.addAttribute("relist",rsv.getlistall());
		MemberDTO mdto = null;
		ReviewDTO rdto = null;
		for (MemberVO m : msv.getList()) {
			mdto = msv.getDetail(m.getEmail());
		}
		for (ReviewVO r : rsv.getlistall()) {
			rdto = rsv.getDetail(r.getRno());
		}
		
		model.addAttribute("mdto",mdto);
		model.addAttribute("rdto",rdto);
	}
}