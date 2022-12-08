package ezen.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import ezen.store.service.Dv_Service;

// html형태의 데이터가 아니라면 사용합니다. 아니라면 json으로 처리를 합니다.

@RestController
public class Dv_RestController {

	@Autowired
	private Dv_Service dv_Service;
	
	@GetMapping("/delivery/CheckDvNick/{dv_pk}")
	public String restApiControll(@PathVariable String dv_pk) {
		
		boolean chk = dv_Service.CheckDvNick(dv_pk);
		
		return chk + "";
		
	}
	
	//Dv_delete
	@GetMapping("/delivery/DvDelete/{mb_id}/{dv_nick}")
	public String DvDelete(@PathVariable String mb_id, @PathVariable("dv_nick") String dv_nick,
						   Model model) {
		
		model.addAttribute("mb_id2", mb_id);
		dv_Service.DeleteDvInfo(mb_id, dv_nick);
		
		return "";
		
	}
	
}
