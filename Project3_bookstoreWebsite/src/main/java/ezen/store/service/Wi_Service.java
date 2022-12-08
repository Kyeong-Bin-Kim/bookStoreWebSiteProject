package ezen.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import ezen.store.beans.PageCountBean;
import ezen.store.beans.Wi_Bean;
import ezen.store.dao.Wi_DAO;
@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class Wi_Service {
	
	@Autowired
	private Wi_DAO Wi_DAO;
	
	@Value("${page.wilistcnt}")
	private int page_listcnt;  
	
	//페이지
	@Value("${page.wipagButtonCnt}")
	private int page_pageButtonCnt;
	
	//카트 열람
	public	List<Wi_Bean> getWishInfo(String wi_mbid) {
		
		return Wi_DAO.getWishInfo(wi_mbid);
	
	}
	
	public void delwish(String wi_mbid,int wi_bknumbers) {
		
		Wi_DAO.delwish(wi_mbid,wi_bknumbers);
	
	}
	
	public void delwishAll(String wi_mbid) {
		
		Wi_DAO.delwishAll(wi_mbid);
	
	}
	
	public void addWishStuff(String wi_mbid,int wi_bknumbers) {
		
		Wi_DAO.addWishStuff(wi_mbid,wi_bknumbers);
	
	}
	
	public PageCountBean getContentCnt(String wi_mbid,int currentPage) {
		
		int content_cnt = Wi_DAO.getContentCnt(wi_mbid);
		
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		
		return pageCountBean;
	
	}
	
	public boolean checkWishHeart(String wi_mbid,int wi_bknumbers) {
		
		String wi_cul = Wi_DAO.checkWishHeart(wi_mbid, wi_bknumbers);
		
		if(wi_cul == null) {
			
			return true;
		
		}else {
			
			return false;
		
		}
		
	}
	
}
