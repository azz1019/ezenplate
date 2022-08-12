package com.ezenplate.www.ctrl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.domain.StoreVO;
import com.ezenplate.www.service.StoreService;


@RequestMapping("/async/*")
@Controller
public class AsyncController {
	@Inject
	private StoreService ssv;
	
	@PostMapping(value="/view_more", 
			produces = {MediaType.APPLICATION_JSON_VALUE} )
	public ResponseEntity<List<StoreDTO>>view_more(){
		List<StoreDTO>list = ssv.view_more();
		return new ResponseEntity<List<StoreDTO>>(list, HttpStatus.OK);
	}
	
}
