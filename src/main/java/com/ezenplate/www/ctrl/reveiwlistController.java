package com.ezenplate.www.ctrl;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.ReviewService;

@RequestMapping("/review/*")
@Controller
public class reveiwlistController {
	@Inject
	private ReviewService rsv;
	
	@GetMapping(value = "/{pageNo}",produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<PagingHandler> spread(@PathVariable("pageNo") int pageNo){
		PagingVO pgvo = new PagingVO(pageNo,10);
		return new ResponseEntity<PagingHandler>(rsv.spread(pgvo),HttpStatus.OK);
	}
}
