package ezen.store.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import ezen.store.beans.PageCountBean;
import ezen.store.beans.Wi_Bean;
import ezen.store.service.Wi_Service;

@Controller
@RequestMapping("/wish")
public class Wi_Controller {
	
	@Autowired
	private Wi_Service wi_Service;

	@GetMapping("/wish_info")
	public String wish_info(@SessionAttribute("mb_id") String wi_mbid, 
							@RequestParam(value = "page", defaultValue = "1") int page, Model model , HttpServletRequest request
				            , HttpServletResponse response) throws Exception {
		if(wi_mbid != "0") {
			model.addAttribute("wi_mbid", wi_mbid);
			
			List<Wi_Bean> infoWi_Bean = wi_Service.getWishInfo(wi_mbid);
			model.addAttribute("infoWi_Bean",infoWi_Bean);
			
			PageCountBean pageCountBean = wi_Service.getContentCnt(wi_mbid, page);
			model.addAttribute("pageCountBean", pageCountBean);
			
			model.addAttribute("page", page);
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush(); 
		}
		return "wish/wish_info";
		
		
		
	}
	
}
