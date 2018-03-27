package com.cafe24.hanboa.feeding;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FeedingMenuController {
	@Autowired
	private FeedingMenuService femeService;
	private static final Logger logger = LoggerFactory.getLogger(FeedingMenuController.class);
	
	//1. 목록조회
	@RequestMapping(value="/feeding/feedingMenu_list")
	public String feedingMenuList(Model model, HttpSession session) {
		List<FeedingMenu> list = femeService.getFeedingMenuList();
		logger.debug("{} <- feedingMenuList FeedingMenuController.java",list);
		model.addAttribute("list",list);
		return "feeding/feedingMenu_list";
		
	}
	

}
