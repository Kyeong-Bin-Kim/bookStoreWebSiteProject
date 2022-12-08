package ezen.store.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.store.beans.Bk_Bean;
import ezen.store.beans.Bk_Number;
import ezen.store.mapper.Bk_Mapper;

@Repository
public class Bk_DAO {
	
	@Autowired
	private Bk_Mapper bk_Mapper;
	
		//책 일련번호 중복확인 DAO
		public String CheckBkNumExist(int bk_number){				
			return bk_Mapper.CheckBkNumExist(bk_number);		
		}
		
		//책 정보 입력 DAO
		public void addBkInfo(Bk_Bean InsertBkBean) {
			
			bk_Mapper.addBkInfo(InsertBkBean); 
		}
		
		//해당 책 평점 평균
		public double getBkScore(int bk_number) {
			return bk_Mapper.getBkScore(bk_number); 
		}
		 
		//책 상세 정보
		public Bk_Bean getBkInfo(int bk_number) {
			  
			return bk_Mapper.getBkInfo(bk_number); 
		}
		
		//책 정보 수정
		public void updateBook(Bk_Bean updateBkBean) {
			bk_Mapper.updateBkBean(updateBkBean);
		}

		//책 번호 리스트 (지역, 장르)
		public List<Bk_Number> getBkNumList1(String bk_local, String bk_genre){
					
			return bk_Mapper.getBkNumList1(bk_local, bk_genre);
					
		}
				
		//책 리스트 갯수 (지역, 장르)
		public int getCntBook1(String bk_local, String bk_genre) {
					
			return bk_Mapper.getCntBook1(bk_local, bk_genre);
					
		}
				
		//책 번호 리스트 (검색어)
		public List<Bk_Number> getBkNumList2(String search_word){
							
			return bk_Mapper.getBkNumList2(search_word);
							
		}
						
		//책 리스트 갯수 (검색어)
		public int getCntBook2(String search_word) {
							
			return bk_Mapper.getCntBook2(search_word);
							
		}
		
		public List<Bk_Number> getAllBkDateList() {

			return bk_Mapper.getAllBkDateList();
		}
		
		public List<Bk_Number> getAllBkNumList(String bk_local,String bk_genre){
					
			return bk_Mapper.getAllBkNumList(bk_local,bk_genre);
		
		}
				
		//책 리스트 갯수 (지역, 장르)
		public int getAllCntBook(String bk_local, String bk_genre) {
					
			return bk_Mapper.getAllCntBook(bk_local, bk_genre);
					
		}
	
		//책 정보 삭제(수정)
		public void deleteBook(int bk_number) {
			
			bk_Mapper.deleteBkBean(bk_number);
			
		}
		
		

}
