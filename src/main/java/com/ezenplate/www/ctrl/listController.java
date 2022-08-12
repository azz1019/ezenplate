package com.ezenplate.www.ctrl;

import java.util.ArrayList;
<<<<<<< HEAD
import java.util.Iterator;
=======
>>>>>>> d323d31ec800f3b50d0c2a87e7f3faa685e316f2
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
>>>>>>> d323d31ec800f3b50d0c2a87e7f3faa685e316f2

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;
<<<<<<< HEAD
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.repository.MemberDAO;
=======
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.handler.PagingHandler;
>>>>>>> d323d31ec800f3b50d0c2a87e7f3faa685e316f2
import com.ezenplate.www.service.MemberService;
import com.ezenplate.www.service.ReviewService;

@Controller
@RequestMapping("/list/*")
public class listController {

	@Inject
	private ReviewService rsv;
	@Inject
	private MemberService msv;
<<<<<<< HEAD

	@GetMapping("/reviewlist")
	public void reviewlist(Model model) {
		model.addAttribute("mlist",msv.getList());
		model.addAttribute("relist",rsv.getlistall());
		model.addAttribute("flist",msv.getListFile());
=======
	@Inject
	private FileHandler fhd;
	

	@GetMapping("/reviewlist")
	public void reviewlist(Model model,PagingVO pgvo) {
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
>>>>>>> d323d31ec800f3b50d0c2a87e7f3faa685e316f2
	}
}