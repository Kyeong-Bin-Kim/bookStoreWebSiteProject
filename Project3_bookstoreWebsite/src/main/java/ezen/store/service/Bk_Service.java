package ezen.store.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Bk_Number;
import ezen.store.beans.PageCountBean;
import ezen.store.dao.Bk_DAO;


@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class Bk_Service {
	
	@Value("${path.upload}")
	private String PathUpload;
	
	@Value("${page.bklistcnt}")
	private int page_listcnt;  
	//페이지
	@Value("${page.bkpagButtonCnt}")
	private int page_pageButtonCnt;
	
	@Autowired
	private Bk_DAO BkDAO;
	
	//책 일련번호 중복확인 관련 서비스
	public boolean CheckBkNumExist(int bk_number) {	
		
		String bk_writer = BkDAO.CheckBkNumExist(bk_number);	
		
		if(bk_writer == null) {
			
			return true;
			
		}else {
			
			return false;
			
		}
		
	}
	
	//업로드 받은 파일명 관련 서비스
	private String SaveUploadFile(MultipartFile upload_file) {
		
		String file_name = upload_file.getOriginalFilename();
		
		try {
			
			upload_file.transferTo(new File(PathUpload + "/" + file_name));  
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return file_name;
		
	}
	
	//책 정보 입력, 업로드 이미지 관련 서비스
	public void addBkInfo(Bk_Bean InsertBkBean) {
		
		MultipartFile upload_file = InsertBkBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {	
			
			String file_name = SaveUploadFile(upload_file);
					
			InsertBkBean.setBk_image(file_name);
			
		}

		BkDAO.addBkInfo(InsertBkBean);
		
	}
	
	//해당 책 평균 평점
	public double getBkScore(int bk_number) { 
			  
		return BkDAO.getBkScore(bk_number); 
		
	}
		
	//책 정보 관련 서비스 
	public Bk_Bean getBkInfo(int bk_number) { 
			  
		return BkDAO.getBkInfo(bk_number); 
		
	}
		
	//책 리스트 갯수 (지역, 장르)
	public PageCountBean getContentCnt1(String bk_local, String bk_genre, int currentPage) {
					
		int content_cnt = BkDAO.getCntBook1(bk_local, bk_genre);
					
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
					
		return pageCountBean;
				
	}
				
	//책 리스트를 위한 책번호 리스트 (지역, 장르)
	public List<Bk_Number> getBkNumList1(String bk_local, String bk_genre){
							
		return BkDAO.getBkNumList1(bk_local, bk_genre);
							
	}
				
	//책 리스트 갯수 (검색어)
	public PageCountBean getContentCnt2(String search_word, int currentPage) {
							
		int content_cnt = BkDAO.getCntBook2(search_word);
							
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
							
		return pageCountBean;
				
	}
				
	//책 리스트를 위한 책번호 리스트 (검색어)
	public List<Bk_Number> getBkNumList2(String search_word){
						
		return BkDAO.getBkNumList2(search_word);
							
	}
	
	public List<Bk_Number> getAllBkDateList() {

		return BkDAO.getAllBkDateList();
	}
			
	public PageCountBean getAllContentCnt(String bk_local, String bk_genre, int currentPage) {
					
		int content_cnt = BkDAO.getAllCntBook(bk_local, bk_genre);
					
		PageCountBean pageCountBean = new PageCountBean(content_cnt, currentPage, page_listcnt, page_pageButtonCnt);
					
		return pageCountBean;
				
	}
				
	public List<Bk_Number> getAllBkNumList(String bk_local,String bk_genre){
					
		return BkDAO.getAllBkNumList(bk_local,bk_genre);
				
	}
					
	//책 정보 수정
	public void updateBook(Bk_Bean updateBkBean) {
			
		MultipartFile upload_file = updateBkBean.getUpload_file();
			
		if(upload_file.getSize() > 0) {			
				
			String file_name = SaveUploadFile(upload_file);
						
			updateBkBean.setBk_image(file_name);
			
		}

		BkDAO.updateBook(updateBkBean);
			
	}
	
	//책 정보 삭제
	public void deleteBook(int bk_number) {
	
		BkDAO.deleteBook(bk_number);
			
	}
		
}


