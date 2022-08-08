package com.ezenplate.www.ctrl;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.POST;

import org.apache.cxf.jaxrs.ext.multipart.Multipart;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.ReviewDTO;
import com.ezenplate.www.domain.ReviewVO;
import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.ReviewService;
import com.ezenplate.www.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/review/*")
public class ReviewController {
	
	@Inject
	private ReviewService rsv;
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(ReviewVO rvo, 
						@RequestParam(name = "fileAttached", required = false) 
						MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
		
		}
		int isUp = rsv.register(new ReviewDTO(rvo, fileList));
		return null;
	}
	
	@GetMapping("/list")
	public void list(@RequestParam("sno") long sno, Model model, PagingVO pgvo) {
		List<ReviewDTO> dto = rsv.get_list(sno, pgvo);
		model.addAttribute("list", dto);
	}
	
	@GetMapping("{/detail, /modify}")
	public void get_detail(@RequestParam("rno") long rno, Model model) {
		ReviewDTO dto = rsv.get_review(rno);
		model.addAttribute("rdto", dto);
	}
	
	@PostMapping("/modify")
	public String modify(ReviewVO rvo, @RequestParam(name="fileAttached", required = false)
							MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
		}
		int isUp = rsv.modify(new ReviewDTO(rvo, fileList));
		return null;
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("rno") long rno) {
		rsv.remove(rno);
		return null;
	}
	
	@PostMapping("/report")
	public String report(@RequestParam("rno") long rno) {
		rsv.report(rno);
		return null;
	}

	@GetMapping("/mylist")
	public void list(Model model, PagingVO pgvo) {
		log.info(">>> ReviewController list - GET");
		model.addAttribute("list", rsv.getList(pgvo));
		int totalCount = rsv.getTotalCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping({"/mydetail", "/mymodify"})
	public void mydetail(Model model, @RequestParam("rno")long rno, @ModelAttribute("pgvo")PagingVO pgvo) {
		model.addAttribute("rdto", rsv.getDetail(rno));
		model.addAttribute("sdto", ssv.getDetail(rsv.getDetail(rno).getRvo().getSno()));
	}
	
	@PostMapping("/mymodify")
	public String update(ReviewVO rvo, RedirectAttributes rttr, PagingVO pgvo, @RequestParam(name = "fileAttached", required = false)MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
		}
		
		int isUp = rsv.modify(new ReviewDTO(rvo, fileList));
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		log.info(">>> ReviewController update - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/review/mydetail?rno=" + rvo.getRno();
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid")String uuid) {
		return rsv.removeFile(uuid) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/myremove")
	public String remove(@RequestParam("rno")long rno, RedirectAttributes rttr, PagingVO pgvo) {
		int isUp = rsv.remove(rno);
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		log.info(">>> ReviewController remove - POST : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/review/mylist";
	}
}
