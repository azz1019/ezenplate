package com.ezenplate.www.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/store/*")
public class StoreController {
	@Inject
	private StoreService ssv;
	
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/approve")
	public void approve(Model model, PagingVO pgvo) {
		log.info(">>> StoreController approve - GET");
		model.addAttribute("list", ssv.getApproveList(pgvo));
		int totalApproveCount = ssv.getTotalApproveCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalApproveCount));
	}
	
	@GetMapping("/admit")
	public void admit(Model model,@RequestParam("sno") long sno) {
		log.info(">>> StoreController admit - GET");
		StoreDTO sdto = ssv.getDetail(sno);
		model.addAttribute("sdto", sdto);
	}
	
	@PostMapping("/admit")
	public String admit(StoreVO svo) {
		int isUp = ssv.admit(svo);
		log.info(">>> StoreController admit - POST : {}", isUp > 0 ? "성공":"실패");
		return "redirect:/store/approve";
	}
	
	@GetMapping("/myregister")
	public void register() {
		log.info(">>> StoreController register - GET");
	}
	
	@PostMapping("/myregister")
	public String register(StoreVO svo, RedirectAttributes rttr, @RequestParam(name = "fileAttached", required = false)MultipartFile[] files,
							@RequestParam(name="locate_detail") String detail) {
		List<FileVO> fileList = null;
		svo.setLocate(svo.getLocate()+' '+detail);
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
		}
		
		int isUp = ssv.register(new StoreDTO(svo, fileList));
		log.info(">>> StoreController register - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/store/mylist?email=" + svo.getWriter();
	}
	
	@GetMapping("/mylist")
	public void list(Model model, PagingVO pgvo, @RequestParam("email")String email) {
		log.info(">>> StoreController list - GET");
		model.addAttribute("list", ssv.getMyList(pgvo, email));
		int totalCount = ssv.getMyTotalCount(pgvo, email);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/mydetail")
	public void mydetail(Model model, @RequestParam("sno")long sno, @ModelAttribute("pgvo")PagingVO pgvo) {
		model.addAttribute("sdto", ssv.getDetail(sno));
	}
	
	@PostMapping("/myremove")
	public String remove(@RequestParam("sno")long sno, @RequestParam("email")String email, RedirectAttributes rttr, PagingVO pgvo) {
		int isUp = ssv.remove(sno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		log.info(">>> StoreController remove - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/store/mylist?email=" + email;
	}
	
	@PostMapping("/remove")
	public String storeRemove(@RequestParam("sno") long sno) {
		int isUp = ssv.remove(sno);
		return "redirect:/store/approve";
	}
	
	/* 맛집 목록 및 검색*/
	@GetMapping("/list")
	public void get_list(Model model,PagingVO pgvo) {
		pgvo.setPageNo(1);
		int num = pgvo.getQty();
		if (pgvo.getQty() > 10) {
			pgvo.setQty(pgvo.getQty()-(pgvo.getQty()%9));
		}
		log.info("pageStart : {}", pgvo.getPageStart());
		log.info("pageStart : {}", pgvo.getPageNo());
		List<StoreDTO> list = ssv.store_list(pgvo);
		model.addAttribute("list", list);
		if(pgvo.getQty()== num) {
			pgvo.setQty(num);
		}
		int totalCount = ssv.get_search_count(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/detail")
	public void detail(Model model,@RequestParam("sno") long sno) {
		StoreDTO sdto = ssv.get_store(sno,1);
		model.addAttribute("sdto", sdto);
	}
}
