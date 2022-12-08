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
import org.springframework.web.bind.annotation.SessionAttribute;

import ezen.store.beans.Ca_Bean;
import ezen.store.service.Ca_Service;

@Controller
@RequestMapping("/cart")
public class Ca_Controller {
	
	@Autowired
	private Ca_Service ca_Service;
	
	
	
	@GetMapping("/cart_info")
	public String cart_info(@SessionAttribute("mb_id") String ca_mbid, Model model , HttpServletRequest request
            , HttpServletResponse response) throws Exception {
		

		if(ca_mbid != "0") {
			List<Ca_Bean> infoCa_Bean = ca_Service.getCartInfo(ca_mbid);
			model.addAttribute("infoCa_Bean",infoCa_Bean);
			
		}else {
			response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
            out.flush(); 
		}
		return "cart/cart_info";
	}
	
	
	
	
	
	
	
	
}
