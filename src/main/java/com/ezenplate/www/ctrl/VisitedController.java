package com.ezenplate.www.ctrl;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.VisitedService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/visited/*")
public class VisitedController {
	@Inject
	private VisitedService vsv;
	
	@GetMapping("/register")
	public String register(@RequestParam("mno") long mno, @RequestParam("sno") long sno, RedirectAttributes rttr) {
		int dul = vsv.check(mno,sno);
		if(dul >0) {
			int ok = vsv.register(mno, sno);
			rttr.addFlashAttribute("visit_ok",1);
		} else {
			rttr.addFlashAttribute("visit_no",0);
		}
		
		return "redirect:/store/detail?sno="+ sno;
	}
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo, @RequestParam("mno")long mno) {
		log.info(">>> VisitedController list - GET");
		model.addAttribute("list", vsv.getList(pgvo, mno));
		int totalCount = vsv.getTotalCount(pgvo, mno);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("sno")long sno, @RequestParam("mno")long mno, RedirectAttributes rttr, PagingVO pgvo) {
		int isUp = vsv.remove(sno, mno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		log.info(">>> VisitedController remove - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/visited/list?mno=" + mno;
	}
}
