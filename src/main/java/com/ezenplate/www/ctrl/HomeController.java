package com.ezenplate.www.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezenplate.www.domain.PagingVO;
import com.ezenplate.www.domain.StoreDTO;
import com.ezenplate.www.handler.PagingHandler;
import com.ezenplate.www.service.StoreService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private StoreService ssv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, PagingVO pgvo) {
		/*
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 */
		
		pgvo.setPageNo(1);
		if(pgvo.getQty() == 10) {
			pgvo.setQty(9);
		} else if (pgvo.getQty() > 10) {
			pgvo.setQty(pgvo.getQty()-(pgvo.getQty()%9));
		}
		List<StoreDTO> list = ssv.store_list(pgvo);
		model.addAttribute("list", list);
		if(pgvo.getQty() == 9) {
			pgvo.setQty(10);
			}
		int totalCount = ssv.get_search_count(pgvo);
		
		model.addAttribute("pgn", new PagingHandler(pgvo, totalCount));
		
		return "/store/list";
	}
	
}
