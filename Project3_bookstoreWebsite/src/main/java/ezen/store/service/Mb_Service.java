package ezen.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import ezen.store.beans.Mb_Bean;
import ezen.store.beans.PageCountBean;
import ezen.store.dao.Mb_DAO;

@Service
public class Mb_Service {


	@Autowired
	private Mb_DAO mbDAO;
	
	@Value("${page.mblistcnt}")
	private int page_listcnt; 
	
	//페이지
	@Value("${page.mbpagButtonCnt}")
	private int page_pageButtonCnt;

	// 아이디 중복 체크
	public boolean checkUserIdExist(String mb_id) {

		String mb_name = mbDAO.checkUserIdExist(mb_id);

		if (mb_name == null) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
	}

	// 회원 가입
	public void addUserInfo(Mb_Bean insertMbBean) {

		mbDAO.addUserInfo(insertMbBean);
		
	}

	// 로그인 정보 확인
	public boolean getloginUserInfo(Mb_Bean tempMbBean) {
	
		Mb_Bean tempMbBean2 = mbDAO.getloginUserInfo(tempMbBean);

		if (tempMbBean2!=null) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
	}

	// 회원정보 수정 정보 가져오기
	public Mb_Bean getModifyUserInfo(String mb_id) {
			
		return mbDAO.getModifyUserInfo(mb_id);
			
	}

	// 회원정보 수정 실행
	public void modifyUserInfo(Mb_Bean updateMbBean) {

		mbDAO.modifyUserInfo(updateMbBean);
			
	}

	// 삭제할 정보 확인
	public void deleteUserInfo(Mb_Bean deleteMbBean) {
		
		mbDAO.deleteUserInfo(deleteMbBean);

	}

	// 전체회원 목록 리스트 가져오기
	public List<Mb_Bean> getMbList() {

		return mbDAO.getMbList();
		
	}
		
	//전체회원 페이지네이션
	public PageCountBean getContentCnt(int currentPage) {
			
		int content_cnt = mbDAO.getCntMember();
			
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
			
		return pageCountBean;
			
	}

	// 회원 상세보기 가져오기
	public Mb_Bean getMbInfo(String mb_id) {

		return mbDAO.getMbInfo(mb_id);
		
	}

}
