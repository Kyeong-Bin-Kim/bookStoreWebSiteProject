package ezen.store.beans;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Dv_Bean {
	
	private String mb_id;
	
	@Size(min=2, max=20)
	private String dv_nick;
	
	@Size(min=2, max=10)
	@Pattern(regexp = "[a-zA-Z가-힣]*")
	private String dv_name;
	
	@Size(min=2, max=50)
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$")
	private String dv_tel;
	
	@Size(min=2, max=3000)
	
	private String dv_address;
	
	private String dv_addressDetail;
	
	private String dv_pk;
	
	private boolean dv_numExist;
	
	public Dv_Bean() {
		this.dv_numExist = false;
	}
	
	//생성 입력
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}	
	public String getDv_nick() {
		return dv_nick;
	}
	public void setDv_nick(String dv_nick) {
		this.dv_nick = dv_nick;
	}
	public String getDv_name() {
		return dv_name;
	}
	public void setDv_name(String dv_name) {
		this.dv_name = dv_name;
	}
	public String getDv_tel() {
		return dv_tel;
	}
	public void setDv_tel(String dv_tel) {
		this.dv_tel = dv_tel;
	}
	public String getDv_address() {
		return dv_address;
	}
	public void setDv_address(String dv_address) {
		this.dv_address = dv_address;
	}
	public String getDv_addressDetail() {
		return dv_addressDetail;
	}
	public void setDv_addressDetail(String dv_addressDetail) {
		this.dv_addressDetail = dv_addressDetail;
	}
	public String getDv_pk() {
		return dv_pk;
	}
	public void setDv_pk(String dv_pk) {
		this.dv_pk = dv_pk;
	}
	public boolean isDv_numExist() {
		return dv_numExist;
	}
	public void setDv_numExist(boolean dv_numExist) {
		this.dv_numExist = dv_numExist;
	}	
	
}
