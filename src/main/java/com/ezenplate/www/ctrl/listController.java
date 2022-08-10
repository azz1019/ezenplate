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
	@Inject
	private FileHandler fhd;

	
	
	
	@GetMapping("/reviewlist")
	public void reviewlist(Model model){
		List<MemberVO> mlist = msv.getList();
		List<ReviewVO> relist = rsv.getlistall();
		for (MemberVO m : mlist) {
//			long mno = m.getMno();
			MemberDTO mdto = msv.getDetail(m.getEmail());
			model.addAttribute("mdto",mdto);
		for (ReviewVO r : relist) {
			ReviewDTO rdto = rsv.getDetail(r.getRno());
			model.addAttribute("rdto",rdto);
		}
		}
		
	}
}
