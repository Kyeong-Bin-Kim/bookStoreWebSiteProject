package ezen.store.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.store.beans.Ca_Bean;
import ezen.store.mapper.Ca_Mapper;

@Repository
public class Ca_DAO {
	
	@Autowired
	private Ca_Mapper ca_Mapper;
	
	public String checkOrderNumExist(String or_number) {
		
		return ca_Mapper.checkOrderNumExist(or_number);
		
	}
	
	public	List<Ca_Bean> getCartInfo(String ca_mbid) {
		
		return ca_Mapper.getCartInfo(ca_mbid);
		
	}
	
	//선택장바구니삭제
	public void delcart(String ca_mbid,int ca_bknumbers) {
		
		ca_Mapper.delcart(ca_mbid,ca_bknumbers);
		
	}
	
	//장바구니전부삭제
	public void delcartAll(String ca_mbid) {
		
		ca_Mapper.delcartAll(ca_mbid);
		
	}
	
	//주문전 결제안한 주문삭제
	public void delPreOrder(String ca_mbid) {
		
		ca_Mapper.delPreOrder(ca_mbid);
		
	}
	
	public void delPreOrderItems(String ca_mbid) {
		
		ca_Mapper.delPreOrderItems(ca_mbid);
		
	}
	
	//장바구니추가
	public void addCartStuff(String ca_mbid,int ca_bknumbers) {
		
		ca_Mapper.addCartStuff(ca_mbid,ca_bknumbers);
		
	}
	
	//수량
	public void plusBookCount(String ca_mbid,int ca_bknumbers) {
		
		ca_Mapper.plusBookCount(ca_mbid, ca_bknumbers);
		
	}
	
	public void minusBookCount(String ca_mbid,int ca_bknumbers) {
		
		ca_Mapper.minusBookCount(ca_mbid, ca_bknumbers);
		
	}
	
	public void setBookCount(String ca_mbid,int ca_bknumbers,int newval) {
		
		ca_Mapper.setBookCount(ca_mbid, ca_bknumbers,newval);
		
	}
	
	//oder
	public void createOderInfo(String or_number, String ca_mbid) {
		
		ca_Mapper.createOderInfo(or_number, ca_mbid);
		
	}
	
	public void insertOderItems(String or_number,int ca_bknumbers,String ca_mbid,int ca_bkcount) {
		ca_Mapper.insertOderItems(or_number, ca_bknumbers,ca_mbid,ca_bkcount);
	}
	
	public void insertOderItem(String or_number,int ca_bknumbers,String ca_mbid,int ca_bkcount) {
		
		ca_Mapper.insertOderItem(or_number, ca_bknumbers,ca_mbid,ca_bkcount);
		
	}
	
}
