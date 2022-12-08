package ezen.store.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import ezen.store.beans.Search_Bean;


@Controller
@RequestMapping("/Main")
public class Ma_Controller {

	
	@GetMapping("/header")
	public String header(@SessionAttribute("mb_id") String mb_id,
						 @ModelAttribute("searchBean") Search_Bean searchBean,
						 Model model,HttpServletRequest request) {
		
		return "include/header";
		
	}
	
	
	@GetMapping("/footer")
	public String footer() {

		return "include/footer";
		
	}

	@GetMapping("/center")
	public String center() {

		return "include/center";
		
	}
	

}
