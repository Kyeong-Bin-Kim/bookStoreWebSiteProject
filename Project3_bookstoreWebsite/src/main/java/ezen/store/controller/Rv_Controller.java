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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import ezen.store.beans.PageCountBean;
import ezen.store.beans.Rv_Bean;
import ezen.store.service.Rv_Service;

@Controller
@RequestMapping("/Review")
public class Rv_Controller {
	
	@Autowired
	private Rv_Service rvService;
	
	// 리뷰 리스트
	@GetMapping("/RvList")
	public String list(@SessionAttribute("mb_id") String mb_id,
					   @RequestParam("bk_number") int bk_number, 
					   @RequestParam(value="page", defaultValue="1") int page,
					   Model model) {
		
		// Review 목록 열기
		model.addAttribute("bk_number", bk_number);
		
		List<Rv_Bean> reviewlist = rvService.getRvList(bk_number);
		model.addAttribute("reviewlist", reviewlist);
		
		PageCountBean pageCountBean = rvService.getContentCnt(bk_number, page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		return "review/Rv_list";
		
	}

	// Rv_insert 파일 열기
	@GetMapping("/RvInsert")
	//여기서 ModelAttribute로 Rv_Bean을 설정하면 Rv_Bean을 이어 받는데 여기서는 이어 받는게 없으므로 아무것도 없는 상태로 Rv_insert페이지로 반환함
	public String insert(@ModelAttribute("insertRvBean") Rv_Bean insertRvBean,
						 @RequestParam("bk_number") int bk_number,
						 @SessionAttribute("mb_id") String mb_id, Model model) {
		
		// insert 페이지 열기
		insertRvBean.setMb_id(mb_id);
		insertRvBean.setBk_number(bk_number);
		
		return "review/Rv_insert";
		
	}
	
	// 리뷰 insert 기능
	@PostMapping("/RvInsertPro")
	public String insertPro(@Validated@ModelAttribute("insertRvBean") Rv_Bean insertRvBean,
							BindingResult result) {
		
		// insert 처리
		if(result.hasErrors()) {
			
			return "review/Rv_insert";
			
		}
		
		rvService.insertReview(insertRvBean);
		
		return "review/Rv_insert_success";
		
	}
	
	// Rv_update 파일 열기
	@GetMapping("/RvUpdate")
	public String update(@RequestParam("rv_number") int rv_number, Model model) {
		
		// update 페이지 열기
		Rv_Bean updateRvBean = rvService.updateCheckRvBean(rv_number);
		model.addAttribute("updateRvBean", updateRvBean);
		
		return "review/Rv_update";
		
	}
	
	// 리뷰 update 기능
	@PostMapping("/RvUpdatePro")
	// select문으로 가져온 것이 이어받은 updateRvBean이기 때문에 select하여 찾은 값으로 update기능 실패시 초기화된다.
	public String updatePro(@Validated@ModelAttribute("updateRvBean") Rv_Bean updateRvBean,
							BindingResult result) {
		
		if(result.hasErrors()) {
			
		return "review/Rv_update";
		
		}
		
		rvService.updateReview(updateRvBean);
		
		return "review/Rv_update_success";
	}
	
	// 리뷰 delete 기능
	@GetMapping("/RvDeletePro")
	public String deletePro(@ModelAttribute("deleteRvBean") Rv_Bean deleteRvBean,
							BindingResult result) {
		
		rvService.deleteReview(deleteRvBean.getRv_number());
		
		if(result.hasErrors()) {
			
		return "review/Rv_delete_fail";
		
		}
		
		return "review/Rv_delete_success";
	}
	
	
	
}
