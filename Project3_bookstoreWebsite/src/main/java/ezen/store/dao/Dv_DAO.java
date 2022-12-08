package ezen.store.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.store.beans.Dv_Bean;
import ezen.store.mapper.Dv_Mapper;

@Repository
public class Dv_DAO {
	
	@Autowired
	private Dv_Mapper dv_Mapper;
	
	//중복확인
	public int CheckDvNick(String dv_pk){	
		
		return dv_Mapper.CheckDvNick(dv_pk);
		
	}	
	
	//delivery 리스트
	public List<Dv_Bean> getDvList(String mb_id){
		
		return dv_Mapper.getDvList(mb_id);	
		
	}
	
	//delivery 입력
	public void addDvInfo(Dv_Bean InsertDvBean) {
		
		dv_Mapper.addDvInfo(InsertDvBean);
		
	}
	
	//delivery 수정
	public Dv_Bean UpdateDvBean(String mb_id, String dv_nick) {
		
		return dv_Mapper.UpdateDvBean(mb_id,dv_nick);
		
	}
	
	public void UpdateDvInfo(Dv_Bean UpdateDvBean) {
		
		dv_Mapper.UpdateDvInfo(UpdateDvBean);
		
	}
	
	//delivery 삭제 기능
	public void DeleteDvInfo(String mb_id, String dv_nick) {
		
		dv_Mapper.DeleteDvInfo(mb_id, dv_nick);
		
	}
	
}
