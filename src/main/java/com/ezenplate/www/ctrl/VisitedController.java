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
	
	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		log.info(">>> VisitedController list - GET");
		model.addAttribute("list", vsv.getList(pgvo));
		int totalCount = vsv.getTotalCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("sno")long sno, RedirectAttributes rttr, PagingVO pgvo) {
		int isUp = vsv.remove(sno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		log.info(">>> VisitedController remove - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/visited/list";
	}
}
