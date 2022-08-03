package com.ezenplate.www.ctrl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezenplate.www.service.MemberService;
import com.ezenplate.www.domain.FileVO;
import com.ezenplate.www.domain.MemberDTO;
import com.ezenplate.www.domain.MemberVO;
import com.ezenplate.www.handler.FileHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Inject
	private MemberService msv;
	
	@Inject
	private FileHandler fhd;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info(">>> MemberController list - GET");
		model.addAttribute("list", msv.getList());
	}
	
	@GetMapping("/detail")
	public void detail(Model model, @RequestParam("email") String email) {
		log.info(">>> MemberController detail - GET");
		MemberDTO mdto = msv.getDetail(email);
		model.addAttribute("mdto", mdto);
	}
	
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
	
	@GetMapping("/register")
	public void register() {
		log.info(">>> MemberController register - GET");
	}
	
	@PostMapping("/register")
	public String register(MemberVO mvo, @RequestParam(name = "fileAttached", required = false)MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);
		}

		int isUp = 0;
		if(fileList == null) {
			isUp = msv.register(new MemberDTO(mvo, null));
			log.info(">>> MemberController register null - POST : {}", isUp > 0 ? "OK" : "FAIL");
		} else {
			isUp = msv.register(new MemberDTO(mvo, fileList.get(0)));
			log.info(">>> MemberController register - POST : {}", isUp > 0 ? "OK" : "FAIL");
		}
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping(value = "/dupleCheck", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String dupleCheck(@RequestBody HashMap<String, String> map) {
		int isExist = msv.dupleCheck(map.get("email"));
		return isExist > 0 ? "1" : "0";
	}
	
	@GetMapping("/modify")
	public void modify(Model model, @RequestParam("email")String email) {
		log.info(">>> MemberController modify - GET");
		MemberDTO mdto = msv.getDetail(email);
		model.addAttribute("mdto", mdto);
	}
	
	@PostMapping("/modify")
	public String modify(MemberVO mvo, @RequestParam(name = "fileAttached", required = false)MultipartFile[] files) {
		List<FileVO> fileList = null;
		if(files[0].getSize() > 0) {
			fileList = fhd.getFileList(files);			
		}
		
		int isUp = 0;
		if(fileList == null) {
			isUp = msv.modify(new MemberDTO(mvo, null));
			log.info(">>> MemberController modify null - POST : {}", isUp > 0 ? "OK":"FAIL");
		} else {
			isUp = msv.modify(new MemberDTO(mvo, fileList.get(0)));
			log.info(">>> MemberController modify - POST : {}", isUp > 0 ? "OK":"FAIL");
		}
		return "redirect:/member/modify?email=" + mvo.getEmail();
	}
	
	@DeleteMapping(value = "/file/{uuid}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> removeFile(@PathVariable("uuid") String uuid){		
		return msv.removeFile(uuid) > 0 ?
				new ResponseEntity<String>("1", HttpStatus.OK) : 
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/remove")
	public void remove(Model model, @RequestParam("email")String email) {
		log.info(">>> MemberController remove - GET");
		MemberDTO mdto = msv.getDetail(email);
		model.addAttribute("mdto", mdto);
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("email")String email) {
		int isUp = msv.remove(email);
		log.info(">>> MemberController remove - POST : {}", isUp > 0 ? "OK":"FAIL");
		return "redirect:/";
	}
}
