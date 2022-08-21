package com.ezenplate.www.ctrl;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezenplate.www.handler.FileHandler;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.handler.PagingHandler;
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
	public void reviewlist (Model model,PagingVO pgvo) {
		model.addAttribute("active","active");
		model.addAttribute("mlist",msv.getList());
		model.addAttribute("relist",rsv.getlistall());
		int totalCount = rsv.getTotalCount(pgvo);
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
		int totalCount1 = rsv.getHolicTotalCount(pgvo);
		model.addAttribute("pgn1",new PagingHandler(pgvo, totalCount1));
		int totalCount2 = rsv.getGoodTotalCount(pgvo);
		model.addAttribute("pgn2",new PagingHandler(pgvo, totalCount2));
		int totalCount3 = rsv.getbadTotalCount(pgvo);
		model.addAttribute("pgn3",new PagingHandler(pgvo, totalCount3));
		model.addAttribute("filelist",msv.getListFile());
		List <ReviewVO> regatlist = new ArrayList<>();
		for (ReviewVO rv: rsv.getlistall()) {
			regatlist.add(rv);
		}
		for (ReviewVO rv : regatlist) {
				rv.setDiffTime(Time.calculateTime(rv.getRegAt()));
		}
		model.addAttribute("msg",regatlist);
	}
	@GetMapping("/holic")
	public void holic(Model model,PagingVO pgvo) {
		model.addAttribute("active","active");
		model.addAttribute("relist",rsv.getlistall());
		model.addAttribute("holic",msv.getListHolic());
		int totalCount = rsv.getTotalCount(pgvo);
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
		int totalCount1 = rsv.getHolicTotalCount(pgvo);
		model.addAttribute("pgn1",new PagingHandler(pgvo, totalCount1));
		int totalCount2 = rsv.getGoodTotalCount(pgvo);
		model.addAttribute("pgn2",new PagingHandler(pgvo, totalCount2));
		int totalCount3 = rsv.getbadTotalCount(pgvo);
		model.addAttribute("pgn3",new PagingHandler(pgvo, totalCount3));
		model.addAttribute("filelist",msv.getListFile());
		List <ReviewVO> regatlist = new ArrayList<>();
		for (ReviewVO rv: rsv.getlistall()) {
			regatlist.add(rv);
		}
		for (ReviewVO rv : regatlist) {
				rv.setDiffTime(Time.calculateTime(rv.getRegAt()));
		}
		model.addAttribute("msg",regatlist);
	}
	
	@GetMapping("/good")
	public void good(Model model, PagingVO pgvo) {
		model.addAttribute("active","active");
		model.addAttribute("mlist",msv.getList());
		model.addAttribute("good",rsv.getListGood());
		int totalCount = rsv.getTotalCount(pgvo);
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
		int totalCount1 = rsv.getHolicTotalCount(pgvo);
		model.addAttribute("pgn1",new PagingHandler(pgvo, totalCount1));
		int totalCount2 = rsv.getGoodTotalCount(pgvo);
		model.addAttribute("pgn2",new PagingHandler(pgvo, totalCount2));
		int totalCount3 = rsv.getbadTotalCount(pgvo);
		model.addAttribute("pgn3",new PagingHandler(pgvo, totalCount3));
		model.addAttribute("filelist",msv.getListFile());
		List <ReviewVO> regatlist = new ArrayList<>();
		for (ReviewVO rv: rsv.getlistall()) {
			regatlist.add(rv);
		}
		for (ReviewVO rv : regatlist) {
				rv.setDiffTime(Time.calculateTime(rv.getRegAt()));
		}
		model.addAttribute("msg",regatlist);
	}
	
//	@GetMapping("/nomal")
//	public void nomal(Model model) {
//		model.addAttribute("mlist",msv.getList());
//		model.addAttribute("nomal",rsv.getListNomal());
//	}
	@GetMapping("/bad")
	public void bad(Model model, PagingVO pgvo) {
		model.addAttribute("active","active");
		model.addAttribute("mlist",msv.getList());
		model.addAttribute("bad",rsv.getListbad());
		int totalCount = rsv.getTotalCount(pgvo);
		model.addAttribute("pgn",new PagingHandler(pgvo, totalCount));
		int totalCount1 = rsv.getHolicTotalCount(pgvo);
		model.addAttribute("pgn1",new PagingHandler(pgvo, totalCount1));
		int totalCount2 = rsv.getGoodTotalCount(pgvo);
		model.addAttribute("pgn2",new PagingHandler(pgvo, totalCount2));
		int totalCount3 = rsv.getbadTotalCount(pgvo);
		model.addAttribute("pgn3",new PagingHandler(pgvo, totalCount3));
		model.addAttribute("filelist",msv.getListFile());
		List <ReviewVO> regatlist = new ArrayList<>();
		for (ReviewVO rv: rsv.getlistall()) {
			regatlist.add(rv);
		}
		for (ReviewVO rv : regatlist) {
				rv.setDiffTime(Time.calculateTime(rv.getRegAt()));
		}
		model.addAttribute("msg",regatlist);
	}
	
}