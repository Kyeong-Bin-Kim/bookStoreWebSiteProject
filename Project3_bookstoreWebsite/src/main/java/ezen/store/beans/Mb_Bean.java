package ezen.store.beans;

import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class Mb_Bean {


	@Size(min = 2, max = 8)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String mb_id;
	
	@Size(min = 2, max = 20)
	private String mb_name;
	
	@Size(min = 8, max = 15)
	private String mb_pw;

	@Size(min = 8, max = 15)
	private String mb_pw2;
	
	@Size(min = 8, max = 15)
	private String mb_pw3;
	
	@Size(min = 8, max = 15)
	private String mb_pw4;
	
	
	@Size(min = 1, max = 30)
	private String mb_email;
	
	@Size(min = 1, max = 30)
	private String mb_tel;

	private Date mb_date;
	
	private String mb_deleted;
	
	private Date mb_deleted_date;
	
	
	//아이디용
	private boolean mbIdExist;
	
	//로그인용
	private boolean mblogin;
	
	private boolean mbPw12;
	
	private boolean mbPw34;
	
	

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getMb_pw2() {
		return mb_pw2;
	}
	
	public void setMb_pw2(String mb_pw2) {
		this.mb_pw2 = mb_pw2;
	}

	public String getMb_pw3() {
		return mb_pw3;
	}

	public void setMb_pw3(String mb_pw3) {
		this.mb_pw3 = mb_pw3;
	}

	public String getMb_pw4() {
		return mb_pw4;
	}

	public void setMb_pw4(String mb_pw4) {
		this.mb_pw4 = mb_pw4;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_tel() {
		return mb_tel;
	}

	public void setMb_tel(String mb_tel) {
		this.mb_tel = mb_tel;
	}

	
	public boolean isMbIdExist() {
		return mbIdExist;
	}

	public void setMbIdExist(boolean mbIdExist) {
		this.mbIdExist = mbIdExist;
	}

	public boolean isMblogin() {
		return mblogin;
	}

	public void setMblogin(boolean mblogin) {
		this.mblogin = mblogin;
	}

	public Date getMb_date() {
		return mb_date;
	}

	public void setMb_date(Date mb_date) {
		this.mb_date = mb_date;
	}

	public String getMb_deleted() {
		return mb_deleted;
	}

	public void setMb_deleted(String mb_deleted) {
		this.mb_deleted = mb_deleted;
	}

	public Date getMb_deleted_date() {
		return mb_deleted_date;
	}

	public void setMb_deleted_date(Date mb_deleted_date) {
		this.mb_deleted_date = mb_deleted_date;
	}

	public boolean isMbPw12() {
		return mbPw12;
	}

	public void setMbPw12(boolean mbPw12) {
		this.mbPw12 = mbPw12;
	}

	public boolean isMbPw34() {
		return mbPw34;
	}

	public void setMbPw34(boolean mbPw34) {
		this.mbPw34 = mbPw34;
	}

	
}

