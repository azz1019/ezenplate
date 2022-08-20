package com.ezenplate.www.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezenplate.www.domain.BoardDTO;
import com.ezenplate.www.domain.BoardVO;
import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.FileHandler;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board/*")
@Controller
public class BoardController {

	@Inject
	private BoardService bsv;
	@Inject
	private FileHandler fhd;

	@GetMapping("/register")
	public void register() {
		log.info(">>> Board Controller register - GET");
	}

	@PostMapping("/register")
	public String register(BoardVO bvo, RedirectAttributes rttr,
			@RequestParam(name = "fileAttached", required = false) MultipartFile[] files) {
		List<FileVO> fileList = null;
		if (files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
			bvo.setFileCount(fileList.size());
		}
		int isUp = bsv.register(new BoardDTO(bvo, fileList));
		log.info(">>> Board Register : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/board/list";
	}

	@GetMapping("/list")
	public void list(Model model, PagingVO pgvo) {
		List<BoardDTO> list = bsv.getList(pgvo);
		model.addAttribute("list", list);
		int totalCount = bsv.getTotalCount(pgvo);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/mylist")
	public void list(Model model, PagingVO pgvo, @RequestParam("nickName")String nickName) {
		List<BoardDTO> list = bsv.getMyList(pgvo, nickName);
		model.addAttribute("list", list);
		int totalCount = bsv.getMyTotalCount(pgvo, nickName);
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
	}
	
	@GetMapping("/detail")
	public void detail(@RequestParam("bno") long bno, Model model, PagingVO pgvo) {
		model.addAttribute("bdto", bsv.getDetail(bno));
	}
	
	@GetMapping("/modify")
	public void modify(Model model, @RequestParam("bno")long bno) {
		log.info(">>> Board Controller modify - GET");
		model.addAttribute("bdto", bsv.getDetail(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO bvo, RedirectAttributes rttr, PagingVO pgvo,
			@RequestParam(name = "fileAttached", required = false) MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0 ) {
			fileList = fhd.getFileList(files);
			bvo.setFileCount(fileList.size());
		}
		int isUp = bsv.modify(new BoardDTO(bvo, fileList));
		rttr.addAttribute("pageNo", pgvo.getPageNo());
		rttr.addAttribute("qty", pgvo.getQty());
		rttr.addAttribute("type", pgvo.getType());
		rttr.addAttribute("kw", pgvo.getKw());
		log.info(">>> Board Modify -post : {}", isUp > 0 ? "OK" : "FAIL");
		return "redirect:/board/detail?bno="+bvo.getBno();
	}
	
	@GetMapping("/remove")
	public void remove(Model model, @RequestParam("bno") long bno) {
		log.info(">>> Board Controller remove - GET");
		BoardDTO bdto = bsv.getDetail(bno);
		model.addAttribute("bdto", bdto);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno")long bno) {
		int isUp = bsv.remove(bno);
		log.info(">>> Board Controller remove - POST : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/board/list";
	}
	
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){		
		return bsv.removeFile(uuid) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}