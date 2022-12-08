package ezen.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Or_Bean;
import ezen.store.beans.Or_items;
import ezen.store.beans.PageCountBean;
import ezen.store.dao.Or_DAO;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class Or_Service {
	
	@Autowired
	private Or_DAO or_DAO;	
	
	@Value("${page.orlistcnt}")
	private int page_listcnt;  
	//페이지
	@Value("${page.orpagButtonCnt}")
	private int page_pageButtonCnt;
	
	public PageCountBean getOrAllCount(int currentPage) {
		
		int content_cnt = or_DAO.getOrAllCount();
		
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		
		return pageCountBean;
		
	}

	public PageCountBean getOrCount(String mb_id, int currentPage) {
		
		int content_cnt = or_DAO.getOrCount(mb_id);
		
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		
		return pageCountBean;
		
	}
	
	public PageCountBean getOrItemCount(String or_number, int currentPage) {
		
		int content_cnt = or_DAO.getOrItemCount(or_number);
		
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		
		return pageCountBean;
		
	}
		
		//모든 주문 목록 select
			public	List<Or_Bean> OrAllList() {
				return or_DAO.OrAllList();
			}
	
		//주문 목록 select
		public	List<Or_Bean> OrList(String mb_id) {
			return or_DAO.OrList(mb_id);
		}
		
		String mb_id = "mb_id";
		String or_number = "or_number";
		
		//주문 상세 정보 select
		public List<Or_Bean> getOrInfo(String mb_id, String or_number){
			return or_DAO.getOrInfo(mb_id, or_number);
		}
		
		//주문 items select
		public	List<Or_Bean> OrSelect(String or_number) {
			return or_DAO.OrSelect(or_number);
		}
		
		//주문 결제 확정 
		public void UpdateOrPurchase(Or_Bean updateOrPurchase){
			or_DAO.UpdateOrPurchase(updateOrPurchase);
		}
		
		//주문 변경 update(환불 등)
		public void OrUpdateAfter(Or_Bean updateOrBean) {
			or_DAO.OrUpdateAfter(updateOrBean);
		}
		
		//mb_id 일치하는 주문 결제 완료로 표시하기 위한 select
		public Or_Bean UpdateOrBean(String mb_id, String or_number) {
			return or_DAO.UpdateOrBean(mb_id, or_number);
		}
		
		//or number 일치하는 items select
		public List<Or_Bean> UpdateOriBean(String or_number) {
			return or_DAO.UpdateOriBean(or_number);
		}
		
		//주문 items의 bk_number, bk_quantity list select
		public List<Or_items> SelectBkQuantity(String or_number) {
			return or_DAO.SelectBkQuantity(or_number);
		}
		
		//주문 확정 후 책의 재고수 감소
		public Or_Bean SelectBkPurchase(String or_number, int bk_number) {
			return or_DAO.SelectBkPurchase(or_number, bk_number);
		}
		
		//주문 환불 후 책의 재고수 증가
		public Or_Bean SelectBkAfter(String or_number, int bk_number) {
			return or_DAO.SelectBkAfter(or_number, bk_number);
		}
		
		//주문 확정/환불 후 책 재고수 update
		public void UpdateBkQuantity(Or_Bean updateBkBean) {
			or_DAO.UpdateBkQuantity(updateBkBean);
		}
		
		//mb_id 일치하는 회원(주문자)정보 select
		public Or_Bean DvSelect(String mb_id, String dv_pk) {
			return or_DAO.DvSelect(mb_id, dv_pk);
		}
		//베스트셀러
		public List<Or_Bean> Orbest(){
			return or_DAO.Orbest();
		}
	
		//해당 책 평균 평점
		public double getBkScore(int bk_number) { 
				  
			return or_DAO.getBkScore(bk_number); 
			
		}
		public Bk_Bean getBkInfo(int bk_number) {
			return or_DAO.getBkInfo(bk_number);
		}
}
