package ezen.store.controller;


import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Dv_Bean;
import ezen.store.beans.Mb_Bean;
import ezen.store.beans.Or_Bean;
import ezen.store.beans.Or_items;
import ezen.store.beans.PageCountBean;
import ezen.store.service.Ca_Service;
import ezen.store.service.Dv_Service;
import ezen.store.service.Mb_Service;
import ezen.store.service.Or_Service;

@Controller
@RequestMapping("/order")
public class Or_Controller {
	
	@Autowired
	private Or_Service or_Service;

	@Autowired
	private Dv_Service dv_Service;
	
	@Autowired
	private Ca_Service ca_Service;
	
	@Autowired
	private Mb_Service mb_Service;
	
	@Value("${page.orlistcnt2}")
	private int page_listcnt2;  
	
	//베스트셀러
	@GetMapping("/Or_bestSeller")
	public String OrBestSeller(Model model) {
		
		List<Or_Bean> bestSBean = or_Service.Orbest();
		
		List<Bk_Bean> bestSellerBeans = new ArrayList<Bk_Bean>();
		
		for(int i = 0; i<bestSBean.size(); i++) {
			
			Or_Bean bestSellerBean = bestSBean.get(i);
			int bk_number = bestSellerBean.getBk_number();
			double avg_score = or_Service.getBkScore(bk_number);
			
			Bk_Bean bestSbook = or_Service.getBkInfo(bk_number);
			
			bestSbook.setAvg_score(avg_score);
			
			bestSellerBeans.add(i,bestSbook);
			
		}
		model.addAttribute("page2",page_listcnt2);
		model.addAttribute("bestSellerBeans", bestSellerBeans);
		
		return "order/Or_bestSeller";
	}
	
	//주문 list all select
	@GetMapping("/Or_alllist")
	public String OrAllList( 
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) {
		
		//모든 order list select
		List<Or_Bean> allListOrBean = or_Service.OrAllList();
		model.addAttribute("allListOrBean", allListOrBean);
		
		//order list 수에 맞춰 페이지 생성
		PageCountBean pageCountBean = or_Service.getOrAllCount(page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		
		return "order/Or_alllist";
		
	}
	
	//주문 list select
	@GetMapping("/Or_list")
	public String OrList(@RequestParam("mb_id") String mb_id, 
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) {
		
		
		//mb id 일치하는 order list select
		List<Or_Bean> listOrBean = or_Service.OrList(mb_id);
		model.addAttribute("listOrBean", listOrBean);
		
		//order list 수에 맞춰 페이지 생성
		PageCountBean pageCountBean = or_Service.getOrCount(mb_id, page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		
		return "order/Or_list";
		
	}
	
	
	//주문 상세 정보 출력 select
	@RequestMapping(value="/Or_select", method = {RequestMethod.GET, RequestMethod.POST})
	public String OrSelect(@RequestParam("mb_id") String mb_id,
			@RequestParam("or_number") String or_number,
			@RequestParam(value="page", defaultValue="1") int page,
			Model model) {
		
		//mb id, or number 일치하는 order select
		List<Or_Bean> infoOrBean = or_Service.getOrInfo(mb_id, or_number);
		model.addAttribute("infoOrBean", infoOrBean);
		
		//or number 일치하는 items select
		List<Or_Bean> itemsOrBean = or_Service.OrSelect(or_number);
		model.addAttribute("itemsOrBean", itemsOrBean);
		
		int allprice = 0;
				
		//bk_number(개수만큼 반복)와 bk_quantity 추출 및 수정 대입
		for(int i=0; i<itemsOrBean.size(); i++) {
			
			Or_Bean or_items = itemsOrBean.get(i);
			int bk_price = or_items.getBk_price();
			int ori_bkcount = or_items.getOri_bkcount();
			
			allprice = allprice + (bk_price * ori_bkcount);
			
			model.addAttribute("allprice", allprice);
		}
		
		//order item 수에 맞춰 페이지 생성
		PageCountBean pageCountBean = or_Service.getOrItemCount(or_number, page);
		model.addAttribute("pageCountBean", pageCountBean);
		
		
		return "order/Or_select";
		
	}
	
	
	//결제 진행 페이지 insert/update
	@GetMapping("/Or_purchase")
	public String Orpurchase(
			@RequestParam("mb_id") String mb_id,
			@RequestParam("or_number") String or_number,
			 Model model) {
		
		//mb_id 일치하는 회원(주문자) 정보 select
		Mb_Bean infoMbBean = mb_Service.getMbInfo(mb_id);
		model.addAttribute("infoMbBean", infoMbBean);
		
		//mb id 일치하는 배송지 정보 select
		List<Dv_Bean> listDvBean = dv_Service.getDvList(mb_id);
		model.addAttribute("listDvBean", listDvBean);
		
		//mb id 일치하는 장바구니 정보 select(미리 생성된 주문 item select)
		List<Or_Bean> OrSelect = or_Service.OrSelect(or_number);
		model.addAttribute("OrSelect", OrSelect);
		
		//mb id 일치하는 주문 정보 생성 or number(미리 생성된 주문 정보 수정 위한 select)
		List<Or_Bean> infoOrBean = or_Service.getOrInfo(mb_id, or_number);
		model.addAttribute("infoOrBean", infoOrBean);
		
		//mb_id 일치하는 주문을 결제 완료로 표시 위한 select
		Or_Bean updateOrPurchase = or_Service.UpdateOrBean(mb_id, or_number);
		model.addAttribute("updateOrPurchase", updateOrPurchase);
		
		return "order/Or_purchase";
	}
	
	
	@PostMapping("/Or_purchasePro")
	public String Orpurchse(@RequestParam("mb_id") String mb_id,
			@RequestParam("or_number") String or_number,
			@ModelAttribute("updateOrPurchase") Or_Bean updateOrPurchase,
			BindingResult result, Model model) {
		
		//에러 발생시 연산 생략 후 실패 페이지로
		if(result.hasErrors()) {
			return "order/Or_purchasefail";
		}
		
		//mb_id, or_number 일치하는 주문 정보 select
		List<Or_Bean> infoOrBean = or_Service.getOrInfo(mb_id, or_number);
		model.addAttribute("infoOrBean", infoOrBean);
		
		//주문 status update
		or_Service.UpdateOrPurchase(updateOrPurchase);
		model.addAttribute("updateOrPurchase", updateOrPurchase);
		
		
		//주문 아이템 정보 list select
		List<Or_Bean> updateOriBean = or_Service.UpdateOriBean(or_number);
		model.addAttribute("updateOriBean", updateOriBean);
		
		
		//주문 정보의 bk_number, bk_quantity list select
		List<Or_items> bkNum = or_Service.SelectBkQuantity(or_number);
		model.addAttribute("bkNum", bkNum);
		
		
		//bk_number(개수만큼 반복)와 bk_quantity 추출 및 수정 대입
		for(int i=0; i<bkNum.size(); i++) {
			
			Or_items bk_items = bkNum.get(i);
			int bk_number = bk_items.getBk_number();
			
			//bk_number 일치하는 bk select
			Or_Bean updateBkBean = or_Service.SelectBkPurchase(or_number, bk_number);
			model.addAttribute("updateBkBean", updateBkBean);
			
			//bk quantity update
			or_Service.UpdateBkQuantity(updateBkBean);
			
			//선택된 장바구니 내용 delete
			ca_Service.delcart(mb_id, bk_number);
			
		}
		
		
		return "order/Or_purchasesuccess";
	}
	
	
	//주문 A/S update
	@GetMapping("/Or_after")
	public String Orafter(@RequestParam("mb_id") String mb_id,
			@RequestParam("or_number") String or_number,
			Model model) {
		
		//수정을 위한 주문 select
		Or_Bean updateOrBean = or_Service.UpdateOrBean(mb_id, or_number);
		model.addAttribute("updateOrBean", updateOrBean);
		
		//주문 items select
		List<Or_Bean> updateOriBean = or_Service.UpdateOriBean(or_number);
		model.addAttribute("updateOriBean", updateOriBean);
		
		
		return "order/Or_after";
	}
	
	
	@PostMapping("/Or_afterPro")
	public String OrafterPro(@ModelAttribute("updateOrBean") Or_Bean updateOrBean,
			BindingResult result1,
			@RequestParam("mb_id") String mb_id,
			@RequestParam("or_number") String or_number,
			BindingResult result, Model model) {
		
		//에러 발생시 연산 생략 후 실패 페이지로
		if (result1.hasErrors()) {
			return "order/Or_afterfail";
		}
		
		
		//주문 status update
		or_Service.OrUpdateAfter(updateOrBean);
		
		//주문 정보 select
		Or_Bean infoOrBean = or_Service.UpdateOrBean(mb_id, or_number);
		model.addAttribute("infoOrBean", infoOrBean);
		
		//주문 status 확인
		String Status = infoOrBean.getOr_status();
		
		
		//status 변화가 책 재고수 변화 없는 '교환'시 책 재고수 변경 생략
		 if(Status.equals("교환")) {
		 
		 return "order/Or_aftersuccess";
		 }
		
		 
		//주문 아이템 정보 list select
		List<Or_Bean> updateOriBean = or_Service.UpdateOriBean(or_number);
		model.addAttribute("updateOriBean", updateOriBean);
		
		
		//주문 items의 bk_number, bk_quantity list select
		List<Or_items> bkNum = or_Service.SelectBkQuantity(or_number);
		model.addAttribute("bkNum", bkNum);
		
		
		//bk_number(수만큼 반복)와 bk_quantity 추출 및 수정 대입
		for(int i=0; i<bkNum.size(); i++) {
			
			//주문의 bk_number 하나씩 추출
			Or_items bk_items = bkNum.get(i);
			int bk_number = bk_items.getBk_number();
			
			//bk_number 일치하는 bk select
			Or_Bean updateBkBean = or_Service.SelectBkAfter(or_number, bk_number);
			model.addAttribute("updateBkBean", updateBkBean);
			
			//bk quantity 재고수 update
			or_Service.UpdateBkQuantity(updateBkBean);
			
		}
		 
		
		return "order/Or_aftersuccess";
	}
}
