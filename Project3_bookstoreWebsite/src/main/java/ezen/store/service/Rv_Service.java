package ezen.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import ezen.store.beans.PageCountBean;
import ezen.store.beans.Rv_Bean;
import ezen.store.dao.Rv_DAO;

@Service
public class Rv_Service {

	@Autowired
	private Rv_DAO rvDAO;
	
	@Value("${page.rvlistcnt}")
	private int page_listcnt;  
	//페이지
	@Value("${page.rvpagButtonCnt}")
	private int page_pageButtonCnt;
	
	public PageCountBean getContentCnt(int bk_number, int currentPage) {
		
		int content_cnt = rvDAO.getCntReview(bk_number);
		
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
		
		return pageCountBean;
		
	}
	
	//리뷰 리스트
	public List<Rv_Bean> getRvList(int bk_number){
		
		return rvDAO.getRvList(bk_number);
		
	}
	
	//리뷰 입력
	public void insertReview(Rv_Bean insertRvBean) {
		
		rvDAO.insertReview(insertRvBean);
		
	}
	
	//수정 리뷰 정보 불러오기
	public Rv_Bean updateCheckRvBean(int rv_number) {
		
		return rvDAO.updateCheckRvBean(rv_number);
		
	}
	
	//리뷰 수정
	public void updateReview(Rv_Bean updateRvBean) {
		
		rvDAO.updateReview(updateRvBean);
		
	}
	
	//리뷰 삭제
	public void deleteReview(int rv_number) {
		
		rvDAO.deleteReview(rv_number);
		
	}
	
	
}
