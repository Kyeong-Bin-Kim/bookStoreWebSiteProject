package ezen.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import ezen.store.service.Wi_Service;

@RestController
@RequestMapping("/wish")
public class Wi_RestController {
	
	@Autowired
	private Wi_Service wi_Service;

	@GetMapping("wish_checkWishHeart/{wi_mbid}/{wi_bknumbers}")
	public String wish_checkWishHeart(@SessionAttribute("mb_id") String wi_mbid,
									  @PathVariable int wi_bknumbers) {
		
		boolean chk = wi_Service.checkWishHeart(wi_mbid,wi_bknumbers);
		
		return chk + "";
		
	}
	
	//restAPI
	@GetMapping("/wish_add/{wi_mbid}/{wi_bknumbers}")
	public String wish_add(@SessionAttribute("mb_id") String wi_mbid,
						   @PathVariable int wi_bknumbers) {
		
		if(wi_mbid != "0") {
			wi_Service.addWishStuff(wi_mbid, wi_bknumbers);
			boolean chk = true;
			
			return chk + "";
		}else {
			return "not login";
		}
	}
	
	
	//restAPI
	@GetMapping("/wish_delete/{wi_mbid}/{wi_bknumbers}")
	public String wish_delete(@SessionAttribute("mb_id") String wi_mbid,
							  @PathVariable int wi_bknumbers) {
		
		
		if(wi_mbid != "0") {
			wi_Service.delwish(wi_mbid,wi_bknumbers) ;
			
			boolean chk = true;
			
			return chk + "";
		}else {
			return "not login";
		}
	}
	
	//restAPI
	@GetMapping("/wish_deleteAll/{wi_mbid}")
	public String wish_deleteAll(@SessionAttribute("mb_id") String wi_mbid) {
		
		
		if(wi_mbid != "0") {
			wi_Service.delwishAll(wi_mbid);
			
			return null;
		}else {
			return "not login";
		}
	}
	


}
