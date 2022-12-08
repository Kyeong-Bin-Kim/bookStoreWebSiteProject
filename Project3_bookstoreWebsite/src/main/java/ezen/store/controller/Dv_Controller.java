package ezen.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ezen.store.beans.Dv_Bean;
import ezen.store.service.Dv_Service;

@Controller
public class Dv_Controller {
	
	@Autowired
	private Dv_Service dv_Service;
	
	//Dv_list
	@GetMapping("/delivery/DvList")
	public String DvList(@RequestParam("mb_id2") String mb_id2, Model model) {
		
		List<Dv_Bean> Deliverylist = dv_Service.getDvList(mb_id2);
		model.addAttribute("Deliverylist", Deliverylist);
		
		return "delivery/Dv_list";
		
	}
	
	
	//Dv_insert
	@GetMapping("/delivery/DvInsert")
	public String DvInsert(@ModelAttribute("InsertDvBean") Dv_Bean InsertDvBean,
						   @RequestParam("mb_id2") String mb_id2, Model model) {
		
		InsertDvBean.setMb_id(mb_id2);
				
		return "delivery/Dv_insert";
	
	}
	
	@PostMapping("/delivery/DvInsertPro")
	public String DvInsertPro(@Validated@ModelAttribute("InsertDvBean") Dv_Bean InsertDvBean,
							  Model model, BindingResult result) {
		
		if(result.hasErrors()) {
			
			
			return "/delivery/Dv_insert";
		
		}
		
		model.addAttribute("mb_id2", InsertDvBean.getMb_id());
		dv_Service.addDvInfo(InsertDvBean);
		
		return "delivery/Dv_insert_success";
		
	}
	
	//Dv_update
	@GetMapping("/delivery/DvUpdate")
	public String DvUpdate(
						   @RequestParam("mb_id2") String mb_id, 
						   @RequestParam("dv_nick") String dv_nick, Model model) {
		
		Dv_Bean UpdateDvBean = dv_Service.UpdateDvBean(mb_id, dv_nick);
		model.addAttribute("UpdateDvBean", UpdateDvBean);
		
		
		return "delivery/Dv_update";
	
	}
	
	@PostMapping("/delivery/DvUpdatePro")
	public String DvUpdatePro(@Validated@ModelAttribute("UpdateDvBean") Dv_Bean UpdateDvBean, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			
			return "delivery/Dv_update";
		
		}
		
		model.addAttribute("mb_id2", UpdateDvBean.getMb_id());
		dv_Service.UpdateDvInfo(UpdateDvBean);
		
		return "delivery/Dv_update_success";
		
	}
	
}

