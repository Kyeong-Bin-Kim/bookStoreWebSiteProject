package ezen.store.controller;

import java.util.ArrayList;
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

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Bk_Number;
import ezen.store.beans.PageCountBean;
import ezen.store.beans.Search_Bean;
import ezen.store.service.Bk_Service;


@Controller
@RequestMapping("/book")
public class Bk_Controller {

	@Autowired
	private Bk_Service BkService;

	// 책정보 입력 컨트롤러
	@GetMapping("/BkInsert")
	public String BkInsert(@ModelAttribute("InsertBkBean") Bk_Bean InsertBkBean) {

		return "book/Bk_insert";
	}

	// 책정보 입력 컨트롤러
	@PostMapping("/BkInsertPro")
	public String InsertPro(@Validated @ModelAttribute("InsertBkBean") Bk_Bean InsertBkBean, BindingResult result) {

		if (result.hasErrors()) {
			return "book/Bk_insert";
		}
		// upload 처리
		BkService.addBkInfo(InsertBkBean);

		return "book/Bk_insert_success";
	}
	
	// 책리스트 검색
	@GetMapping("/BkList")
	public String BkList(
		@RequestParam(value="bk_local", defaultValue="") String bk_local, 
		@RequestParam(value="bk_genre", defaultValue="") String bk_genre,
		@SessionAttribute("mb_id") String mb_id,
		@ModelAttribute("searchBean") Search_Bean searchBean,
		@RequestParam(value="page", defaultValue="1") int page,
		Model model, BindingResult result) {
			
		//검색어의 경우
		if(searchBean.getSearch_word() != null) {
				
			String search_word = searchBean.getSearch_word();
				
			
			List<Bk_Number> bkNumList = BkService.getBkNumList2(search_word);
				
			List<Bk_Bean> bkListBean = new ArrayList<Bk_Bean>();
				
			for(int i=0; i<bkNumList.size(); i++) {
					
				Bk_Number bk_numbers = bkNumList.get(i);
				int bk_number = bk_numbers.getBk_number();
					
				Bk_Bean bkInfoBean = BkService.getBkInfo(bk_number);
				double avg_score = BkService.getBkScore(bk_number);
					
				bkInfoBean.setAvg_score(avg_score);
					
				bkListBean.add(i, bkInfoBean);
			}
				
			model.addAttribute("bkListBean", bkListBean);
				
			PageCountBean pageCountBean = BkService.getContentCnt2(search_word, page);
				
			model.addAttribute("pageCountBean", pageCountBean);
			
			return "book/Bk_list";
			
		//지역별 전체
		} else {
					
			if(bk_genre.equals("전체")) {
					
			model.addAttribute("bk_local", bk_local);
			model.addAttribute("bk_genre", bk_genre);
					
					
			List<Bk_Number> bkNumList = BkService.getAllBkNumList(bk_local, bk_genre);
					
			List<Bk_Bean> bkListBean = new ArrayList<Bk_Bean>();
					
			for(int i=0; i<bkNumList.size(); i++) {
						
				Bk_Number bk_numbers = bkNumList.get(i);
				int bk_number = bk_numbers.getBk_number();
						
				Bk_Bean bkInfoBean = BkService.getBkInfo(bk_number);
				double avg_score = BkService.getBkScore(bk_number);
						
				bkInfoBean.setAvg_score(avg_score);
						
				bkListBean.add(i, bkInfoBean);
			}
					
			model.addAttribute("bkListBean", bkListBean);
					
			PageCountBean pageCountBean = BkService.getAllContentCnt(bk_local, bk_genre, page);
					
			model.addAttribute("pageCountBean", pageCountBean);
							
			return "book/Bk_list";
			
			} 
			//지역, 장르의 경우
			else {
				model.addAttribute("bk_local", bk_local);
				model.addAttribute("bk_genre", bk_genre);
				
						
				List<Bk_Number> bkNumList = BkService.getBkNumList1(bk_local, bk_genre);
						
				List<Bk_Bean> bkListBean = new ArrayList<Bk_Bean>();
						
				for(int i=0; i<bkNumList.size(); i++) {
							
					Bk_Number bk_numbers = bkNumList.get(i);
					int bk_number = bk_numbers.getBk_number();
							
					Bk_Bean bkInfoBean = BkService.getBkInfo(bk_number);
					double avg_score = BkService.getBkScore(bk_number);
							
					bkInfoBean.setAvg_score(avg_score);
							
					bkListBean.add(i, bkInfoBean);
				}
						
				model.addAttribute("bkListBean", bkListBean);
						
				PageCountBean pageCountBean = BkService.getContentCnt1(bk_local, bk_genre, page);
						
				model.addAttribute("pageCountBean", pageCountBean);
						
						
				return "book/Bk_list";
				}
			
			}
		
		}
	
	//책 신상품 리스트
		@GetMapping("/BkDateList")
		public String BkDateList(Model model) {
			
			List<Bk_Number> bkNumList = BkService.getAllBkDateList();
			
			List<Bk_Bean> bkListBean2 = new ArrayList<Bk_Bean>();
			
			for(int i=0; i<bkNumList.size(); i++) {
				
				Bk_Number bk_numbers = bkNumList.get(i);
				int bk_number = bk_numbers.getBk_number();
						
				Bk_Bean bkInfoBean = BkService.getBkInfo(bk_number);
				double avg_score = BkService.getBkScore(bk_number);
						
				bkInfoBean.setAvg_score(avg_score);
						
				bkListBean2.add(i, bkInfoBean);
			}
			
			model.addAttribute("bkListBean2", bkListBean2);
			
			return "book/Bk_listNew";
			
		}
		
	// 책 상세정보
	@GetMapping("/BkSelect")
	public String BkSelect(@RequestParam("bk_number") int bk_number,
						   @RequestParam(value="page", defaultValue="1") int page,
						   Model model) {
		 
		model.addAttribute("bk_number", bk_number);

		double ReadScore = BkService.getBkScore(bk_number);
		model.addAttribute("ReadScore", ReadScore);

		Bk_Bean ReadBkBean = BkService.getBkInfo(bk_number);
		model.addAttribute("ReadBkBean", ReadBkBean);
		 
		model.addAttribute("page", page);
		 
		return "book/Bk_select";
	}
	
	// 책 상세정보
	@GetMapping("/BkSelect2")
	public String BkSelect2(@RequestParam("bk_number") int bk_number,
							@RequestParam(value="page", defaultValue="1") int page,
							Model model) {
	 
	model.addAttribute("bk_number", bk_number);

	double ReadScore = BkService.getBkScore(bk_number);
	model.addAttribute("ReadScore", ReadScore);

	Bk_Bean ReadBkBean = BkService.getBkInfo(bk_number);
	model.addAttribute("ReadBkBean", ReadBkBean);
	 
	model.addAttribute("page", page);
	 
	return "book/Bk_select2";
}
	
	// 책정보 수정 페이지 컨트롤러
	@GetMapping("/BkUpdate")
	public String bkUpdate(@RequestParam("bk_number") int bk_number,
							Model model) {
		
		Bk_Bean updateBkBean = BkService.getBkInfo(bk_number);
		model.addAttribute("updateBkBean", updateBkBean);
		
		
		return "book/Bk_update";
	}

	// 책정보 수정 기능 컨트롤러
	@PostMapping("/BkUpdatePro")
	public String bkUpdatePro(@Validated @ModelAttribute("updateBkBean") Bk_Bean updateBkBean, BindingResult result) {
		
		if (result.hasErrors()) {
			
		return "book/Bk_update";
		
		}
		
		BkService.updateBook(updateBkBean);
		
		return "book/Bk_update_success";
	
	}
	
	

}
