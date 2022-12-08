package ezen.store.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.store.beans.Wi_Bean;
import ezen.store.mapper.Wi_Mapper;

@Repository
public class Wi_DAO {
	
	@Autowired
	private Wi_Mapper wi_Mapper;
	
	public	List<Wi_Bean> getWishInfo(String wi_mbid) {
		
		return wi_Mapper.getWishInfo(wi_mbid);
		
	}
	
	public void delwish(String wi_mbid,int wi_bknumbers) {
		
		wi_Mapper.delwish(wi_mbid,wi_bknumbers);
		
	}
	
	public void delwishAll(String wi_mbid) {
		
		wi_Mapper.delwishAll(wi_mbid);
		
	}
	
	public void addWishStuff(String wi_mbid,int wi_bknumbers) {
		
		wi_Mapper.addWishStuff(wi_mbid,wi_bknumbers);
		
	}
	
	public int getContentCnt(String wi_mbid) {
		
		return wi_Mapper.getContentCnt(wi_mbid);
		
	}
	
	public String checkWishHeart(String wi_mbid,int wi_bknumbers) {
		
		return wi_Mapper.checkWishHeart(wi_mbid, wi_bknumbers);
		
	}
	
}
